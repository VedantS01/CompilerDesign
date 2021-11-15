/**
 *  IRGenerator v1.0
 *  Author - Vedant Ashish Saboo, CS19B074
 */

package visitor;
import syntaxtree.*;

import java.util.*;

class FuntionTable {
   //?
   // public ArrayList<Method_> allmethods = new ArrayList<>();
   public HashMap<Method_, Integer> fnmaps = new HashMap<>();
   // public HashMap<Method_, HashMap<Variable_, Integer>> fnlocals = new HashMap<>();
   // public HashMap<Method_, HashMap<Variable_, Integer>> fnformals = new HashMap<>();

}

public class IRGenerator extends GJDepthFirst<AttrSynthesized, AttrInherited> implements GJVisitor<AttrSynthesized, AttrInherited>{
   // public static int MAX_INT = 0xffffffff;
   public SymbolTable table;
   public Integer tempcount = 1;
   public Integer labelcount = 0; 
   Stack<String> scopestack = new Stack<>();
   Stack<ArrayList<String>> gpstack = new Stack<>();

   HashSet<Integer> tempbin = new HashSet<>();
   HashSet<Integer> labelbin = new HashSet<>();

   // ObjectAllocationManager objmanager;
   public HashMap<String, Class_> objMap = new HashMap<>();

   HashMap<Variable_, String> localvarmap = new HashMap<>();

   // Storage Maps
   public HashMap<Class_, HashMap<Object, Integer>> classmaps = new HashMap<>();   

   private Method_ mMethod_;
   private HashMap<Variable_, String> localMap = new HashMap<>();
   private HashMap<String, Boolean> islocalinit = new HashMap<>();
   private HashMap<Variable_, String> formalMap = new HashMap<>();

   public IRGenerator() {
      table = new SymbolTable();
   }

   public void printsyntaxtable() {
      table.print();
      System.out.println("++++++++++++Classmaps++++++++++++");
      for (Class_ c : classmaps.keySet()) {
         System.out.println(c.name + " of size " + c.size);
         HashMap<Object, Integer> m = classmaps.get(c);
         for (Object o : m.keySet()) {
            if(o.getClass() == Variable_.class) {
               System.out.println("--var : " + ((Variable_)o).name + " at offset " + m.get(o));
            } else {
               System.out.println("--fntable at offset " + m.get(o));
               FuntionTable fnt = (FuntionTable)o;
               for (Method_ f : fnt.fnmaps.keySet()) {
                  System.out.println("----fn : " + f.name + " at offset " + fnt.fnmaps.get(f) + " access=" + f.access);
               }
            }
         }
      }
      System.out.println("+++++++++++++++++++++++++++++++++");
   }

   public void error() {
      System.err.println("Error Detected");
      System.exit(0);
   }

   public String genTemp() {
      while(tempbin.contains(tempcount)) tempcount++;
      String r = "TEMP "+tempcount.toString();
      tempbin.add(tempcount++);
      return r;
   }

   public String genLabel() {
      while(labelbin.contains(labelcount)) labelcount++;
      String r = "L"+labelcount.toString();
      labelbin.add(labelcount++);
      return r;
   }

   /**
    * Finds a variable and returns it wrapper
    * @param name
    * @param scope
    * @return Variable_ wrapper , null if not found, which is rare because in general you won't get null in a correctly typed program.
    * NOTE: STRICTLY USE ON A CONFIRMED VARIABLE ONLY
    */
   public Variable_ lookupvarref(String name) {
      Class_ pc = null;
      String cname = scopestack.get(1);
      for (Class_ c : table.classes) {
         if(c.name.equals(cname)) {
            pc = c;
            break;
         }
      }
      if(pc == null) error();
      String mname = scopestack.get(2);
      Method_ pm = null;
      for (Method_ m : pc.methods) {
         if(m.name.equals(mname)) {
            pm = m;
            break;
         }
      }
      if(pm == null) error();

      //check locals
      for (Variable_ v : pm.locals) {
         if(v.name == name) {
            // if(!v.used) {
            //    v.lexeme = genTemp();
            //    v.used = true;
            // }
            return v;
         }
      }

      //check formals
      for (Variable_ v : pm.formals) {
         if(v.name == name) {
            // if(!v.used) {
            //    v.lexeme = genTemp();
            //    v.used = true;
            // }
            return v;
         }
      }

      //check class members
      for (Variable_ v : pc.members) {
         if(v.name == name) {
            // if(!v.used) {
            //    v.lexeme = genTemp();
            //    v.used = true;
            // }
            return v;
         }
      }

      //check inherited membership
      Class_ c1 = pc.parent;
      while(c1 != null) {
         for (Variable_ v : c1.members) {
            if(v.name == name) {
               // if(!v.used) {
               //    v.lexeme = genTemp();
               //    v.used = true;
               // }
               return v;
            }
         }
         c1 = c1.parent;
      }
      // not a var ref
      // error?
      // wait, it may be a method, or it may be a class name too
      // in general, lets push out null
      return null;
   }

   public Method_ mdecwhich(String mname) {
      Class_ pc = null;
      String cname = scopestack.get(1);
      for (Class_ c : table.classes) {
         if(c.name.equals(cname)) {
            pc = c;
            break;
         }
      }
      if(pc == null) error();
      Method_ pm = null;
      for (Method_ m : pc.methods) {
         if(m.name.equals(mname)) {
            pm = m;
            break;
         }
      }
      // if(pm == null) error();
      return pm;
   }


   /**
    * Finds MessendSend method call and returns the Method_ wrrapper
    * @param fname
    * @return Method_ wrapper, or null
    * MUST USE ONLY FOR MessendSend lookups
    */
   public Method_ lookupmethodref(String fname, String objtemp, String callerobj){
      String cname = scopestack.get(1);
      Class_ objclass = objMap.get(objtemp);
      if(objclass == null) {
         System.err.println("Caution! objMap entry is null : " + objtemp);
         error();
      }
      Class_ c = objclass;
      // Method_ m = null;
      // look for privates
      // System.out.println("IRGenerator.lookupmethodref()");
      // for (Class_ c1 : table.classes) {
      //    if(c1.name.equals(cname)) {
      //       boolean ok = false;
      //       Class_ ctemp = c;
      //       while(ctemp != null) {
      //          if(ctemp.name.equals(c1.name)) {
      //             ok = true;
      //             break;
      //          }
      //          ctemp = ctemp.parent;
      //       }
      //       if(!ok) continue; // break?
      //       System.err.println("HERE " + c1.name + " " + ctemp.name + " " + c.name);
      //       for (Method_ im : c1.methods) {
      //          if(im.access.equals("private") && im.name.equals(fname)) {
      //             System.err.println("HERE " + im.name + " " + im.access);
      //             return im;
      //          }
      //       }
      //    }
      // }
      if(callerobj != null) {
         Class_ c1 = null;
         for(Class_ c2 : table.classes) {
            if(c2.name.equals(callerobj)) {
               c1 = c2;
               break;
            }
         }
         if(c1 != null)
         if(callerobj.equals(cname)) {
            for (Method_ im : c1.methods) {
               if(im.access.equals("private") && im.name.equals(fname)) {
                  return im;
               }
            }
         }
      }

      // others
      while(c != null) {
         for (Method_ im : c.methods) {
            // System.out.println("IRGenerator.lookupmethodref() : " + im.name);
            if(im.access != "private" && im.name.equals(fname)) {
               return im;
            }
         }
         c = c.parent;
      }
      
      return null;
   }

   public void beginscope(String s) {
      scopestack.push(s);
   }

   public void endscope() {
      scopestack.pop();
   }

   public String getscope() {
      String str = "";
      for(String s : scopestack) {
         str += s + "::";
      }
      return str;
   }

   public void initstoragemaps() {
      if(classmaps == null) classmaps = new HashMap<>();
      // Integer totalclasses = table.classes.size();
      // Integer iter = 0;
      for (Class_ c : table.classes) {
         if(classmaps.containsKey(c)) continue;
         initsmhelper(c);
      }
   }

   public void initsmhelper(Class_ c) {
      if(c.parent != null && !classmaps.containsKey(c.parent)) {
         initsmhelper(c.parent);
      }
      HashMap<Object, Integer> classmap = new HashMap<>();
      Integer startoffset = 0;
      if(c.parent != null) {
         HashMap<Object, Integer> pclassmap = classmaps.get(c.parent);
         startoffset = c.parent.size - 4;
         FuntionTable ft = new FuntionTable();
         FuntionTable t;
         Integer sanity = 0;
         for (Object o : pclassmap.keySet()) {
            if(o.getClass().equals(FuntionTable.class)) {
               sanity++;
               t = (FuntionTable) o;
               ft.fnmaps.putAll(t.fnmaps);
               classmap.put(ft, 0);
            } else {
               classmap.put(o, pclassmap.get(o));
            }
         }
         if(sanity != 1) {
            System.err.println("Code is insane : " + sanity);
            error();
         }
         Integer ftableoffset = 4*(ft.fnmaps.size());
         for (Method_ mc : c.methods) {
            Boolean override = false;
            Set<Method_> set = ft.fnmaps.keySet();
            for (Method_ ftm : set) {
               if(ftm.access.equals("private")) continue;
               if(ftm.name.equals(mc.name)) {
                  override = true;
                  Integer offset = ft.fnmaps.get(ftm);
                  ft.fnmaps.remove(ftm);
                  ft.fnmaps.put(mc, offset);
                  break;
               }
            }
            if(override) continue;
            ft.fnmaps.put(mc, ftableoffset);
            ftableoffset += 4;
         }
      } else {
         FuntionTable fTable = new FuntionTable();
         Integer ftableoffset = 0;
         for (Method_ mc : c.methods) {
            fTable.fnmaps.put(mc, ftableoffset);
            ftableoffset += 4;
         }
         classmap.put(fTable, startoffset);
      }
      startoffset += 4;
      for (Variable_ vc : c.members) {
         classmap.put(vc, startoffset);
         startoffset += 4;
      }
      c.size = startoffset;
      classmaps.put(c, classmap);
   }


   public void output(String s) {
      System.out.println(s);
   }
    //
   // User-generated visitor methods below
   //

   /**
    * f0 -> MainClass()
    * f1 -> ( TypeDeclaration() )*
    * f2 -> <EOF>
    */
   public AttrSynthesized visit(Goal n, AttrInherited argu) {
      initstoragemaps();
      beginscope("global");
      argu = new AttrInherited();
      argu.from = "Goal";
      AttrSynthesized _ret = null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      endscope();
      n.f2.accept(this, argu);
      return _ret;
 }

 /**
  * f0 -> "class"
  * f1 -> Identifier()
  * f2 -> "{"
  * f3 -> "public"
  * f4 -> "static"
  * f5 -> "void"
  * f6 -> "main"
  * f7 -> "("
  * f8 -> "String"
  * f9 -> "["
  * f10 -> "]"
  * f11 -> Identifier()
  * f12 -> ")"
  * f13 -> "{"
  * f14 -> PrintStatement()
  * f15 -> "}"
  * f16 -> "}"
  */
 public AttrSynthesized visit(MainClass n, AttrInherited argu) {
    AttrSynthesized _ret = new AttrSynthesized();
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    beginscope(n.f1.f0.tokenImage);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    n.f6.accept(this, argu);
    beginscope("main()");
    output("MAIN");
    n.f7.accept(this, argu);
    n.f8.accept(this, argu);
    n.f9.accept(this, argu);
    n.f10.accept(this, argu);
    n.f11.accept(this, argu);
    tempbin.add(1);
    n.f12.accept(this, argu);
    beginscope("body");
    n.f13.accept(this, argu);
    _ret = n.f14.accept(this, argu);
    n.f15.accept(this, argu);
    n.f16.accept(this, argu);
    output("END");
    endscope();
    endscope();
    endscope();
    return _ret;
 }

 /**
  * f0 -> ClassDeclaration()
  *       | ClassExtendsDeclaration()
  */
 public AttrSynthesized visit(TypeDeclaration n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "class"
  * f1 -> Identifier()
  * f2 -> "{"
  * f3 -> ( VarDeclaration() )*
  * f4 -> ( MethodDeclaration() )*
  * f5 -> "}"
  */
 public AttrSynthesized visit(ClassDeclaration n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    beginscope(n.f1.f0.tokenImage);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    endscope();
    return _ret;
 }

 /**
  * f0 -> "class"
  * f1 -> Identifier()
  * f2 -> "extends"
  * f3 -> Identifier()
  * f4 -> "{"
  * f5 -> ( VarDeclaration() )*
  * f6 -> ( MethodDeclaration() )*
  * f7 -> "}"
  */
 public AttrSynthesized visit(ClassExtendsDeclaration n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    beginscope(n.f1.f0.tokenImage);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    n.f6.accept(this, argu);
    n.f7.accept(this, argu);
    endscope();
    return _ret;
 }

 /**
  * f0 -> Type()
  * f1 -> Identifier()
  * f2 -> ";"
  */
 public AttrSynthesized visit(VarDeclaration n, AttrInherited argu) {
    AttrSynthesized _ret = new AttrSynthesized();
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);

   //  _ret.code = "MOVE TEMP 0 CODE";
    return _ret;
 }

 /**
  * f0 -> AccessType()
  * f1 -> Type()
  * f2 -> Identifier()
  * f3 -> "("
  * f4 -> ( FormalParameterList() )?
  * f5 -> ")"
  * f6 -> "{"
  * f7 -> ( VarDeclaration() )*
  * f8 -> ( Statement() )*
  * f9 -> "return"
  * f10 -> Expression()
  * f11 -> ";"
  * f12 -> "}"
  */
 public AttrSynthesized visit(MethodDeclaration n, AttrInherited argu) {
    AttrSynthesized _ret =  new AttrSynthesized();
    AttrInherited fromm = new AttrInherited();
    fromm.from = "Method";
    n.f0.accept(this, fromm);
    n.f1.accept(this, fromm);
    n.f2.accept(this, fromm);
    beginscope(n.f2.f0.tokenImage+"()");
    Method_ m = mdecwhich(n.f2.f0.tokenImage+"()");
    if(m == null) {
       System.err.println("Line 479: Caution! m is null");
       error();
    }
    mMethod_ = m;
    String l = m.owner.name + "_" + m.name;
    if(l.endsWith("()")) {
       l = l.substring(0, l.length()-2);
    }
    Integer argsnum = m.formals.size() + 1;
    output(l + " [" + argsnum + "]");
    n.f3.accept(this, fromm);
    n.f4.accept(this, fromm);
    n.f5.accept(this, fromm);
    formalMap.clear();
    for (Variable_ fv : mMethod_.formals) {
       Integer i = mMethod_.formals.indexOf(fv) + 1;
       String t = "TEMP " + i;
       if(!tempbin.contains(i)) tempbin.add(i);
       formalMap.put(fv, t);
       
       if(fv.type.isclass) {
          for (Class_ c11 : table.classes) {
             if(c11.name.equals(fv.type.name)) {
                objMap.put(t, c11);
                break;
             }
          }
       }
    }
    beginscope("body");
    output("BEGIN");
    n.f6.accept(this, fromm);
    n.f7.accept(this, fromm);
    localMap.clear();
    islocalinit.clear();
    for (Variable_ fv : mMethod_.locals) {
       String t = genTemp();
       formalMap.put(fv, t);
       islocalinit.put(t, false);
    }
    n.f8.accept(this, fromm);
    n.f9.accept(this, fromm);
    _ret = n.f10.accept(this, fromm);
    output("RETURN " + _ret.addr);
    n.f11.accept(this, fromm);
    n.f12.accept(this, fromm);
    output("END");
    localMap.clear();
    islocalinit.clear();
    formalMap.clear();
   //  objMap.clear();
    mMethod_ = null;
    endscope();
    endscope();
    return _ret;
 }

 /**
  * f0 -> FormalParameter()
  * f1 -> ( FormalParameterRest() )*
  */
 public AttrSynthesized visit(FormalParameterList n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> Type()
  * f1 -> Identifier()
  */
 public AttrSynthesized visit(FormalParameter n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> ","
  * f1 -> FormalParameter()
  */
 public AttrSynthesized visit(FormalParameterRest n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> ArrayType()
  *       | BooleanType()
  *       | IntegerType()
  *       | Identifier()
  */
 public AttrSynthesized visit(Type n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    if(argu != null && argu.from == "PE") {
       argu.typelookup = true;
    }
    n.f0.accept(this, argu);
    if(argu != null && argu.from == "PE") {
      argu.typelookup = false;
   }
    return _ret;
 }

 /**
  * f0 -> PublicType()
  *       | PrivateType()
  *       | ProtectedType()
  */
 public AttrSynthesized visit(AccessType n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "int"
  * f1 -> "["
  * f2 -> "]"
  */
 public AttrSynthesized visit(ArrayType n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "boolean"
  */
 public AttrSynthesized visit(BooleanType n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "int"
  */
 public AttrSynthesized visit(IntegerType n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "public"
  */
 public AttrSynthesized visit(PublicType n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "private"
  */
 public AttrSynthesized visit(PrivateType n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "protected"
  */
 public AttrSynthesized visit(ProtectedType n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> Block()
  *       | AssignmentStatement()
  *       | ArrayAssignmentStatement()
  *       | IfStatement()
  *       | WhileStatement()
  *       | PrintStatement()
  */
 public AttrSynthesized visit(Statement n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "{"
  * f1 -> ( Statement() )*
  * f2 -> "}"
  */
 public AttrSynthesized visit(Block n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> Identifier()
  * f1 -> "="
  * f2 -> Expression()
  * f3 -> ";"
  */
 public AttrSynthesized visit(AssignmentStatement n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    AttrSynthesized exp;
    n.f0.accept(this, argu);
    Variable_ id = lookupvarref(n.f0.f0.tokenImage);
    if(id == null) {
       System.err.println("Fatal error! id to be assigned is null");
       error();
    }
    n.f1.accept(this, argu);
    exp = n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    if(exp.isconstant) {
       Integer i = Integer.parseInt(exp.addr);
       String t1 = genTemp();
       String t = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
       exp.addr = t;
       exp.isconstant = false;
    }
    if(localMap.containsKey(id)) {
       // is local
       String t = localMap.get(id);
       islocalinit.remove(t);
       islocalinit.put(t, true);
       output("MOVE " + t + " " + exp.addr);
       if(objMap.containsKey(exp.addr)) {
         objMap.put(t, objMap.get(exp.addr));
      }
    } else if (formalMap.containsKey(id)) {
       String t = formalMap.get(id);
       output("MOVE " + t + " " + exp.addr);
       if(objMap.containsKey(exp.addr)) {
         objMap.put(t, objMap.get(exp.addr));
      }
    } else {
       // class variable
       // what instance? well, tis Temp 0, no? yes, tis Temp 0
       Integer offset = classmaps.get(id.ownerclass).get(id);
       if(exp.isconstant) {
         String t = genTemp();
         Integer i = Integer.parseInt(exp.addr);
         String t1 = genTemp();
         if(i < 0) {
             i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
         } else
         output("MOVE " + t + " " + i);
         exp.isconstant = false;
         exp.addr = t;
       }
       output("HSTORE TEMP 0 " + offset + " " + exp.addr);
    }
    
    return _ret;
 }

 /**
  * f0 -> Identifier()
  * f1 -> "["
  * f2 -> Expression()
  * f3 -> "]"
  * f4 -> "="
  * f5 -> Expression()
  * f6 -> ";"
  */
 public AttrSynthesized visit(ArrayAssignmentStatement n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    AttrSynthesized ind, exp;
    n.f0.accept(this, argu);
    Variable_ id = lookupvarref(n.f0.f0.tokenImage);
    n.f1.accept(this, argu);
    ind = n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    exp = n.f5.accept(this, argu);
    n.f6.accept(this, argu);
    if(exp.isconstant) {
      Integer i = Integer.parseInt(exp.addr);
      String t1 = genTemp();
       String t = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
      exp.addr = t;
      exp.isconstant = false;
   }
    if(localMap.containsKey(id)) {
       // is local
       String t = localMap.get(id);
       islocalinit.remove(t);
       islocalinit.put(t, true);
       if(exp.isconstant) {
         String t1 = genTemp();
         Integer i = Integer.parseInt(exp.addr);
       String t2 = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t2 + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t2 + " " + i);
         exp.isconstant = false;
         exp.addr = t2;
       }

       if(ind.isconstant) {
          Integer i = Integer.parseInt(ind.tokenImage);
          i = 4*i + 4;
          output("HSTORE " + t + " " + i + " " + exp.addr);
       } else {
          String t2 = genTemp();
          String t3 = genTemp();
          output("MOVE " + t2 + " TIMES " + ind.addr + " 4");
          output("MOVE " + t3 + " PLUS " + t + " " + t2);
          output("HSTORE " + t3 + " 4 " + exp.addr);
       }
    } else if (formalMap.containsKey(id)) {
       String t = formalMap.get(id);
       if(exp.isconstant) {
         String t1 = genTemp();
         Integer i = Integer.parseInt(exp.addr);
       String t2 = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t2+ " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t2 + " " + i);
         exp.isconstant = false;
         exp.addr = t2;
       }

       if(ind.isconstant) {
          Integer i = Integer.parseInt(ind.tokenImage);
          i = 4*i + 4;
          output("HSTORE " + t + " " + i + " " + exp.addr);
       } else {
          String t2 = genTemp();
          String t3 = genTemp();
          output("MOVE " + t2 + " TIMES " + ind.addr + " 4");
          output("MOVE " + t3 + " PLUS " + t + " " + t2);
          output("HSTORE " + t3 + " 4 " + exp.addr);
       }
    } else {
       // class variable
       // what instance? well, tis Temp 0, no? yes, tis Temp 0
       Integer offset = classmaps.get(id.ownerclass).get(id);
       String t = genTemp();
       output("HLOAD " + t + " TEMP 0 " + offset);
       if(exp.isconstant) {
         String t1 = genTemp();
         Integer i = Integer.parseInt(exp.addr);
       String t2 = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t2 + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t2 + " " + i);
         exp.isconstant = false;
         exp.addr = t2;
       }

       if(ind.isconstant) {
          Integer i = Integer.parseInt(ind.tokenImage);
          i = 4*i + 4;
          output("HSTORE " + t + " " + i + " " + exp.addr);
       } else {
          String t2 = genTemp();
          String t3 = genTemp();
          output("MOVE " + t2 + " TIMES " + ind.addr + " 4");
          output("MOVE " + t3 + " PLUS " + t + " " + t2);
          output("HSTORE " + t3 + " 4 " + exp.addr);
       }
    }
    return _ret;
 }

 /**
  * f0 -> IfthenElseStatement()
  *       | IfthenStatement()
  */
 public AttrSynthesized visit(IfStatement n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    AttrInherited S = new AttrInherited();
    String l = genLabel();
    S.next = l;
    n.f0.accept(this, S);
    output(l);
    output("NOOP");
    return _ret;
 }

 /**
  * f0 -> "if"
  * f1 -> "("
  * f2 -> Expression()
  * f3 -> ")"
  * f4 -> Statement()
  */
 public AttrSynthesized visit(IfthenStatement n, AttrInherited S) {
    AttrSynthesized _ret=null;
    AttrInherited B = new AttrInherited();
    B.tru = "fall";
    B.fls = S.next;
    B.ifusage = true;
    AttrInherited S1 = new AttrInherited();
    S1.next = S.next;
    n.f0.accept(this, S);
    n.f1.accept(this, S);
    n.f2.accept(this, B);
    n.f3.accept(this, S);
    n.f4.accept(this, S1);
    return _ret;
 }

 /**
  * f0 -> "if"
  * f1 -> "("
  * f2 -> Expression()
  * f3 -> ")"
  * f4 -> Statement()
  * f5 -> "else"
  * f6 -> Statement()
  */
 public AttrSynthesized visit(IfthenElseStatement n, AttrInherited S) {
   AttrSynthesized _ret=null;
   AttrInherited B = new AttrInherited();
   B.tru = "fall";
   B.fls = genLabel();
   B.ifusage = true;
   AttrInherited S1 = new AttrInherited();
   AttrInherited S2 = new AttrInherited();
   S1.next = S.next;
   S2.next = S.next;
   n.f0.accept(this, S);
   n.f1.accept(this, S);
   n.f2.accept(this, B);
   n.f3.accept(this, S);
   // output(B.tru);
   // output("NOOP");
   n.f4.accept(this, S1);
   output("JUMP " + S.next);
   output(B.fls);
   output("NOOP");
   n.f5.accept(this, S);
   n.f6.accept(this, S2);
   return _ret;
 }

 /**
  * f0 -> "while"
  * f1 -> "("
  * f2 -> Expression()
  * f3 -> ")"
  * f4 -> Statement()
  */
 public AttrSynthesized visit(WhileStatement n, AttrInherited S) {
    AttrSynthesized _ret=null;
    String begin = genLabel();
    String end = genLabel();
    AttrInherited B = new AttrInherited();
    B.ifusage = true;
    AttrInherited S1 = new AttrInherited();
    B.tru = "fall";
    B.fls = end;
    S1.next = begin;
    output(begin);
    output("NOOP");
    n.f0.accept(this, S);
    n.f1.accept(this, S);
    n.f2.accept(this, B);
    n.f3.accept(this, S);
    n.f4.accept(this, S1);
    output("JUMP " + begin);
    output(end);
    output("NOOP");
    return _ret;
 }

/**
 * f0 -> "System.out.println"
* f1 -> "("
* f2 -> Expression()
* f3 -> ")"
* f4 -> ";"
*/
public AttrSynthesized visit(PrintStatement n, AttrInherited argu) {
   AttrSynthesized _ret = null;
   argu.from = "Normal";
   n.f0.accept(this, argu);
   n.f1.accept(this, argu);
   _ret = n.f2.accept(this, argu);
   if(_ret.isconstant) {
      String t = genTemp();
      Integer i = Integer.parseInt(_ret.addr);
      String t1 = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
      _ret.addr = t;
   }
   output("PRINT " + _ret.addr);
   n.f3.accept(this, argu);
   n.f4.accept(this, argu);
   return _ret;
}

 /**
  * f0 -> OrExpression()
  *       | AndExpression()
  *       | CompareExpression()
  *       | neqExpression()
  *       | PlusExpression()
  *       | MinusExpression()
  *       | TimesExpression()
  *       | DivExpression()
  *       | ArrayLookup()
  *       | ArrayLength()
  *       | MessageSend()
  *       | TernaryExpression()
  *       | PrimaryExpression()
  */
 public AttrSynthesized visit(Expression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    _ret = n.f0.accept(this, argu);
    if(_ret == null) {
      System.err.println("Caution! _ret null in Expression");
    } else {
      // ?
    }
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "&&"
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(AndExpression n, AttrInherited B) {
    AttrSynthesized _ret = new AttrSynthesized();
    AttrSynthesized pe1, pe2;
    AttrInherited B1 = new AttrInherited();
    AttrInherited B2 = new AttrInherited();
    // for no ifusage
    String fls = "", end = ""; // to satisfy compiler
    if(!B.ifusage) {
      _ret.addr = genTemp();
      fls = genLabel();
      end = genLabel();
      B.tru = "fall";
      B.fls = fls;
    }
    B1.tru = "fall";
    B1.fls = B.fls;
    B2.tru = B.tru;
    B2.fls = B.fls;
    B1.ifusage = B.ifusage;
    B2.ifusage = B.ifusage;
    String t = "";
    if(B1.fls.equals("fall")) {
       t = genLabel();
       B1.fls = t;
    }
    pe1 = n.f0.accept(this, B1);
    if(!B.ifusage) {
      output("CJUMP " + pe1.addr + " " + fls);
    }
    n.f1.accept(this, B);
    pe2 = n.f2.accept(this, B2);
   if(!B.ifusage) {
      output("CJUMP " + pe2.addr + " " + fls);
      output("MOVE " + _ret.addr + " 1");
      output("JUMP " + end);
      output(fls);
      output("MOVE " + _ret.addr + " 0");
      output(end);
      output("NOOP");
   }
   if(!t.equals("") && B.ifusage){
      output(t);
      output("NOOP");
   }
   if(!t.equals("") && B.ifusage) {
      output(t);
      output("NOOP");
   }
   _ret.type = "boolean";
   _ret.istypedefault = true;
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "||"
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(OrExpression n, AttrInherited B) {
   AttrSynthesized _ret = new AttrSynthesized();
    AttrSynthesized pe1, pe2;
    AttrInherited B1 = new AttrInherited();
    AttrInherited B2 = new AttrInherited();
    // for no ifusage
    String tru = "", fls = "", end = ""; // to satisfy compiler
    if(!B.ifusage) {
      _ret.addr = genTemp();
      tru = genLabel();
      fls = genLabel();
      end = genLabel();
      B.tru = tru;
      B.fls = fls;
    }
    B1.fls = "fall";
    B1.tru = B.tru;
    B2.tru = "fall";
    B2.fls = B.fls;
    String t = "";
    if(B1.tru.equals("fall")) {
      t = genLabel();
      B1.tru = t;
    }
    B1.ifusage = B.ifusage;
    B2.ifusage = B.ifusage;
    pe1 = n.f0.accept(this, B1);
    if(!B.ifusage) {
       String t1 = genTemp();
       output("MOVE " + t1 + " NE " + pe1.addr + " 1");
       output("CJUMP " + t1 + " " + tru);
    }
    n.f1.accept(this, B);
    pe2 = n.f2.accept(this, B2);
   if(!B.ifusage) {
      output("CJUMP " + pe2.addr + " " + fls);
      output(tru);
      output("MOVE " + _ret.addr + " 1");
      output("JUMP " + end);
      output(fls);
      output("MOVE " + _ret.addr + " 0");
      output(end);
      output("NOOP");
   }
   if(!t.equals("") && B.ifusage){
      output(t);
      output("NOOP");
   }
   _ret.type = "boolean";
   _ret.istypedefault = true;
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "<="
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(CompareExpression n, AttrInherited B) {
   AttrSynthesized _ret = new AttrSynthesized();
   AttrSynthesized pe1, pe2;
   pe1 = n.f0.accept(this, B);
   n.f1.accept(this, B);
   pe2 = n.f2.accept(this, B);
   String t = genTemp();
   output("MOVE " + t + " LE " + pe1.addr + " " + pe2.addr);
   if(!B.ifusage) {
      _ret.addr = t;
      _ret.type = "boolean";
      _ret.istypedefault = true;
      return _ret;
   }
   if(B.tru.equals("fall")) {
      output("CJUMP " + t + " " + B.fls);
   } else if (B.fls.equals("fall") ) {
      String t2 = genTemp();
      output("MOVE " + t2 + " NE " + t + " 1");
      output("CJUMP " + t2 + " " + B.tru);
   } else {
      output("CJUMP " + t + " " + B.fls);
      output("JUMP " + B.tru);
   }
   _ret.addr = t;
   _ret.type = "boolean";
   _ret.istypedefault = true;
   return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "!="
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(neqExpression n, AttrInherited B) {
   AttrSynthesized _ret = new AttrSynthesized();
   AttrSynthesized pe1, pe2;
   Boolean old = B.ifusage;
   B.ifusage = false;
   pe1 = n.f0.accept(this, B);
   n.f1.accept(this, B);
   pe2 = n.f2.accept(this, B);
   B.ifusage = old;
   if(pe1.isconstant && pe2.isconstant) {
      //integers. sure? hell yeah
      Integer i1 = Integer.parseInt(pe1.tokenImage);
      Integer i2 = Integer.parseInt(pe2.tokenImage);
      if(i1 != i2) {
         _ret.tokenImage = "true";
         _ret.addr = "1";
         output("JUMP " + B.tru);
      } else {
         _ret.tokenImage = "false";
         _ret.addr = "0";
         output("JUMP " + B.fls);
      }
      _ret.isconstant = true;
      _ret.type = "boolean";
      return _ret;
   }
   if(pe1.isconstant) {
      String t = genTemp();
      Integer i = Integer.parseInt(pe1.addr);
      String t1 = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
      pe1.addr = t;
      pe1.isconstant = false;
   }
   if(pe2.isconstant) {
      String t = genTemp();
      Integer i = Integer.parseInt(pe2.addr);
      String t1 = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
      pe2.addr = t;
      pe2.isconstant = false;
   }
   String t = genTemp();
   output("MOVE " + t + " NE " + pe1.addr + " " + pe2.addr);
   if(!B.ifusage) {
      _ret.addr = t;
      _ret.type = "boolean";
      _ret.istypedefault = true;
      return _ret;
   }
   if(B.tru.equals("fall")) {
      output("CJUMP " + t + " " + B.fls);
   } else if (B.fls.equals("fall") ) {
      String t2 = genTemp();
      output("MOVE " + t2 + " NE " + t + " 1");
      output("CJUMP " + t2 + " " + B.tru);
   } else {
      output("CJUMP " + t + " " + B.fls);
      output("JUMP " + B.tru);
   }
   _ret.addr = t;
   _ret.type = "boolean";
   _ret.istypedefault = true;
   return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "+"
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(PlusExpression n, AttrInherited argu) {
    AttrSynthesized _ret = new AttrSynthesized();
    AttrSynthesized pe1;
    AttrSynthesized pe2;
    pe1 = n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    pe2 = n.f2.accept(this, argu);
    if(pe1.isconstant && pe2.isconstant) {
       //must be integer constants
       _ret.isconstant = true;
       _ret.type = "int";
       _ret.istypedefault = true;
       Integer i = (Integer.parseInt(pe1.tokenImage) + Integer.parseInt(pe2.tokenImage));
       _ret.tokenImage = ""+i;
       _ret.addr = _ret.tokenImage;
       return _ret;
    }
    _ret.isconstant = false;
    if(pe1.isconstant) {
       Integer i = Integer.parseInt(pe1.addr);
       String t1 = genTemp();
       String t = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
       pe1.addr = t;
    }
    if(pe2.isconstant) {
      Integer i = Integer.parseInt(pe2.addr);
      String t1 = genTemp();
       String t = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
      pe2.addr = t;
   }
    String t = genTemp();
    output("MOVE " + t + " PLUS " + pe1.addr + " " + pe2.addr);
    _ret.addr = t;
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "-"
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(MinusExpression n, AttrInherited argu) {
   AttrSynthesized _ret = new AttrSynthesized();
   AttrSynthesized pe1;
   AttrSynthesized pe2;
   pe1 = n.f0.accept(this, argu);
   n.f1.accept(this, argu);
   pe2 = n.f2.accept(this, argu);
   if(pe1.isconstant && pe2.isconstant) {
      //must be integer constants
      _ret.isconstant = true;
      _ret.type = "int";
      _ret.istypedefault = true;
      Integer i = (Integer.parseInt(pe1.tokenImage) - Integer.parseInt(pe2.tokenImage));
      _ret.tokenImage = ""+i;
      _ret.addr = _ret.tokenImage;
      return _ret;
   }
   if(pe1.isconstant) {
      Integer i = Integer.parseInt(pe1.addr);
      String t1 = genTemp();
       String t = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
      pe1.addr = t;
   }
   if(pe2.isconstant) {
     Integer i = Integer.parseInt(pe2.addr);
     String t1 = genTemp();
       String t = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
     pe2.addr = t;
  }
   String t = genTemp();
   output("MOVE " + t + " MINUS " + pe1.addr + " " + pe2.addr);
   _ret.addr = t;
   _ret.isconstant = false;
   return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "*"
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(TimesExpression n, AttrInherited argu) {
   AttrSynthesized _ret = new AttrSynthesized();
   AttrSynthesized pe1;
   AttrSynthesized pe2;
   pe1 = n.f0.accept(this, argu);
   n.f1.accept(this, argu);
   pe2 = n.f2.accept(this, argu);
   if(pe1.isconstant && pe2.isconstant) {
      //must be integer constants
      _ret.isconstant = true;
      _ret.type = "int";
      _ret.istypedefault = true;
      Integer i = (Integer.parseInt(pe1.tokenImage) * Integer.parseInt(pe2.tokenImage));
      _ret.tokenImage = ""+i;
      _ret.addr = _ret.tokenImage;
      return _ret;
   }
   if(pe1.isconstant) {
      Integer i = Integer.parseInt(pe1.addr);
      String t1 = genTemp();
       String t = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
      pe1.addr = t;
   }
   if(pe2.isconstant) {
     Integer i = Integer.parseInt(pe2.addr);
     String t1 = genTemp();
       String t = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
     pe2.addr = t;
  }
   String t = genTemp();
   output("MOVE " + t + " TIMES " + pe1.addr + " " + pe2.addr);
   _ret.addr = t;
   _ret.isconstant = false;
   return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "/"
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(DivExpression n, AttrInherited argu) {
   AttrSynthesized _ret = new AttrSynthesized();
   AttrSynthesized pe1;
   AttrSynthesized pe2;
   pe1 = n.f0.accept(this, argu);
   n.f1.accept(this, argu);
   pe2 = n.f2.accept(this, argu);
   if(pe1.isconstant && pe2.isconstant) {
      //must be integer constants
      _ret.isconstant = true;
      _ret.type = "int";
      _ret.istypedefault = true;
      Integer i = (Integer.parseInt(pe1.tokenImage) / Integer.parseInt(pe2.tokenImage));
      _ret.tokenImage = ""+i;
      _ret.addr = _ret.tokenImage;
      return _ret;
   }
   if(pe1.isconstant) {
      Integer i = Integer.parseInt(pe1.addr);
      String t1 = genTemp();
       String t = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
      pe1.addr = t;
   }
   if(pe2.isconstant) {
     Integer i = Integer.parseInt(pe2.addr);
     String t1 = genTemp();
       String t = genTemp();
       if(i < 0) {
          i = -i;
          output("MOVE " + t1 + " 0");
          output("MOVE " + t + " MINUS " + t1 + " " + i);
       } else
       output("MOVE " + t + " " + i);
     pe2.addr = t;
  }
   String t = genTemp();
   output("MOVE " + t + " DIV " + pe1.addr + " " + pe2.addr);
   _ret.addr = t;
   _ret.isconstant = false;
   return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "["
  * f2 -> PrimaryExpression()
  * f3 -> "]"
  */
 public AttrSynthesized visit(ArrayLookup n, AttrInherited argu) {
    AttrSynthesized _ret = new AttrSynthesized();
    AttrSynthesized pe1 = n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    AttrSynthesized pe2 = n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    String t1 = genTemp();
    output("MOVE " + t1  + " TIMES " + pe2.addr + " 4");
    String t3 = genTemp();
    output("MOVE " + t3 + " PLUS " + pe1.addr + " " + t1);
    String t2 = genTemp();
    output("HLOAD " + t2 + " " + t3 + " 4");
    _ret.addr = t2;
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "."
  * f2 -> "length"
  */
 public AttrSynthesized visit(ArrayLength n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    _ret = n.f0.accept(this, argu);
    if(_ret == null) {
       System.err.println("Caution! _ret null in ArrayLength");
       error();
    }
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    String t = genTemp();
    output("HLOAD " + t + " " + _ret.addr + " 0");
    _ret.addr = t;
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "."
  * f2 -> Identifier()
  * f3 -> "("
  * f4 -> ( ExpressionList() )?
  * f5 -> ")"
  */
 public AttrSynthesized visit(MessageSend n, AttrInherited argu) {
    AttrSynthesized _ret = new AttrSynthesized();
    AttrSynthesized t ;
    t = n.f0.accept(this, argu);

    n.f1.accept(this, argu);
    n.f2.accept(this, null);
    String fname = n.f2.f0.tokenImage + "()";
    Method_ m = lookupmethodref(fname, t.addr, t.callerobj);
    if(m == null) error();
    Integer fntableoffset = 0;
    String t3 = genTemp();
    output("HLOAD " + t3 + " " + t.addr + " " + fntableoffset);
    FuntionTable ft = null;
    for(Object o : classmaps.get(m.owner).keySet()) {
       if(classmaps.get(m.owner).get(o) == fntableoffset) {
          ft = (FuntionTable) o;
       }
    }
    if(ft == null) error();
    Integer fnoffset = ft.fnmaps.get(m);
    String t4 = genTemp();
    output("HLOAD " + t4 + " " + t3 + " " + fnoffset);
    n.f3.accept(this, argu);
    gpstack.push(new ArrayList<>());
    gpstack.peek().add(t.addr);
    n.f4.accept(this, argu);
    String t2 = genTemp();
    System.out.print("MOVE " + t2 + " CALL "+ t4 + " ( ");
    for (String s : gpstack.peek()) {
       System.out.print(s + " ");
    }
    output(")");
    gpstack.pop();
    n.f5.accept(this, argu);
    _ret.addr = t2;
    _ret.type = m.rettype.name;
    _ret.istypedefault = !m.rettype.isclass;
    if(_ret.type.equals("boolean")) {
      if(argu.ifusage) {
         String t1 = _ret.addr;
         if(argu.tru.equals("fall")) {
            output("CJUMP " + t1 + " " + argu.fls);
         } else if (argu.fls.equals("fall")) {
            String t5 = genTemp();
            output("MOVE " + t5 + " NE " + t1 + " 1");
            output("CJUMP " + t5 + " " + argu.tru);
         } else {
            output("CJUMP " + t1 + " " + argu.fls);
            output("JUMP " + argu.tru);
         }
      }
    }
    if(!_ret.istypedefault) {
       for (Class_ c11 : table.classes) {
          if(c11.name.equals(_ret.type)) {
             objMap.put(_ret.addr, c11);
             break;
          }
       }
    }
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "?"
  * f2 -> PrimaryExpression()
  * f3 -> ":"
  * f4 -> PrimaryExpression()
  */
 public AttrSynthesized visit(TernaryExpression n, AttrInherited S) {
    AttrSynthesized _ret = new AttrSynthesized();
    AttrSynthesized rs1, rs2;
    AttrInherited B = new AttrInherited();
    AttrInherited S1 = new AttrInherited();
    AttrInherited S2 = new AttrInherited();
    B.tru = "fall";
    B.fls = genLabel();
    B.ifusage = true;
    String end = genLabel();
    S1.next = end;
    S2.next = end;
    _ret.addr = genTemp();
    n.f0.accept(this, B);
    n.f1.accept(this, S);
    rs1 = n.f2.accept(this, S1);
    output("MOVE " + _ret.addr + " " + rs1.addr);
    output("JUMP " + end);
    output(B.fls);
    output("NOOP");
    n.f3.accept(this, S);
    rs2 = n.f4.accept(this, S2);
    output("MOVE " + _ret.addr + " " + rs2.addr);
    output(end);
    output("NOOP");
    if(rs1.type.equals("boolean")) {
      _ret.type = "boolean";
      _ret.istypedefault = true;
      if(S.ifusage) {
         String t = _ret.addr;
         if(S.tru.equals("fall")) {
            output("CJUMP " + t + " " + S.fls);
         } else if (S.fls.equals("fall")) {
            String t2 = genTemp();
            output("MOVE " + t2 + " NE " + t + " 1");
            output("CJUMP " + t2 + " " + S.tru);
         } else {
            output("CJUMP " + t + " " + S.fls);
            output("JUMP " + S.tru);
         }
         // argu.ifusage = false;
      }
    }
    if(rs1.type.equals("int")) {
      _ret.type = "int";
      _ret.istypedefault = true;
    }
    return _ret;
 }

 /**
  * f0 -> Expression()
  * f1 -> ( ExpressionRest() )*
  */
 public AttrSynthesized visit(ExpressionList n, AttrInherited argu) {
    AttrSynthesized _ret=new AttrSynthesized();
    AttrSynthesized t =
    n.f0.accept(this, argu);
    if(t.isconstant) {
      String t1 = genTemp();
      if(t.type.equals("int")) {
         output("MOVE " + t1 + " " + t.addr);
      } else {
         output("MOVE " + t1 + " " + t.addr);
      }
      // add conditions for boolean constants
      t.addr = t1;
   }
    gpstack.peek().add(t.addr);
    n.f1.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> ","
  * f1 -> Expression()
  */
 public AttrSynthesized visit(ExpressionRest n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    _ret = n.f1.accept(this, argu);
    if(_ret.isconstant) {
       String t = genTemp();
       if(_ret.type == "int") {
          Integer i = Integer.parseInt(_ret.addr);
          if(i < 0) {
             i = -i;
             String t1 = genTemp();
             String t2 = genTemp();
             output("MOVE " + t1 + " " + 0);
             output("MOVE " + t2 + " MINUS " + t1 + " " + i);
             _ret.addr = t2;
          }
       }
       output("MOVE " + t + " " + _ret.addr);
       _ret.addr = t;
    }
    gpstack.peek().add(_ret.addr);
    return _ret;
 }

 /**
  * f0 -> IntegerLiteral()
  *       | TrueLiteral()
  *       | FalseLiteral()
  *       | Identifier()
  *       | ThisExpression()
  *       | ArrayAllocationExpression()
  *       | AllocationExpression()
  *       | NotExpression()
  *       | BracketExpression()
  */
 public AttrSynthesized visit(PrimaryExpression n, AttrInherited argu) {
    AttrSynthesized PE1 = null;

    AttrInherited frompe = new AttrInherited();
    frompe.tru = argu.tru;
    frompe.fls = argu.fls;
    frompe.next = argu.next;
    frompe.from = "PE";
    frompe.ifusage = argu.ifusage;
    frompe.typelookup = argu.typelookup;
    PE1 = n.f0.accept(this, frompe);
    if(PE1.isconstant) {
       if(PE1.type.equals("int"))
       PE1.addr = PE1.tokenImage;
    }
    return PE1;
 }

 /**
  * f0 -> <INTEGER_LITERAL>
  */
 public AttrSynthesized visit(IntegerLiteral n, AttrInherited argu) {
   AttrSynthesized _ret = new AttrSynthesized();
   n.f0.accept(this, argu);
   _ret.tokenImage = n.f0.tokenImage;
   _ret.isconstant = false;
   _ret.istypedefault = true;
   _ret.type = "int";
   String t = genTemp();
   output("MOVE " + t + " " + _ret.tokenImage);
   _ret.addr = t;
   return _ret;
 }

 /**
  * f0 -> "true"
  */
 public AttrSynthesized visit(TrueLiteral n, AttrInherited argu) {
   AttrSynthesized _ret = new AttrSynthesized();
   n.f0.accept(this, argu);
   _ret.tokenImage = n.f0.tokenImage;
   _ret.isconstant = false;
   _ret.istypedefault = true;
   _ret.type = "boolean";
   _ret.addr = genTemp();
   output("MOVE " + _ret.addr + " 1");
   if(argu.ifusage) {
      if(!argu.tru.equals("fall"))
      output("JUMP " + argu.tru);
      // argu.ifusage = false;
    }
   return _ret;
 }

 /**
  * f0 -> "false"
  */
 public AttrSynthesized visit(FalseLiteral n, AttrInherited argu) {
   AttrSynthesized _ret = new AttrSynthesized();
   n.f0.accept(this, argu);
   _ret.tokenImage = n.f0.tokenImage;
   _ret.isconstant = false;
   _ret.istypedefault = true;
   _ret.type = "boolean";
   _ret.addr = genTemp();
   output("MOVE " + _ret.addr + " 0");
   if(argu.ifusage) {
      if(!argu.fls.equals("fall"))
      output("JUMP " + argu.fls);
      // argu.ifusage = false;
    }
   return _ret;
 }

 /**
  * f0 -> <IDENTIFIER>
  */
 public AttrSynthesized visit(Identifier n, AttrInherited argu) {
    AttrSynthesized _ret = new AttrSynthesized();
    n.f0.accept(this, argu);
    _ret.tokenImage = n.f0.tokenImage;
    _ret.isconstant = false;
    if(argu != null && argu.from == "PE" && !argu.typelookup) {
       // Came from PE
       // Should be a variable
       // Or maybe a type?? no
       Variable_ v = lookupvarref(n.f0.tokenImage);
       if(localMap.containsKey(v)) {
          // is in local map
          _ret.addr = localMap.get(v);
          if(!islocalinit.get(_ret.addr)) {
            output("MOVE " + _ret.addr + " 0");
            islocalinit.remove(_ret.addr);
            islocalinit.put(_ret.addr, true);
          }
          
       } else if (formalMap.containsKey(v)) {
          // is in formal map
          _ret.addr = formalMap.get(v);
       } else {
          // is class variable
          if(v.ownerclass == null) {
             System.err.println("Fatal error: class not found!");
             error();
          }
          Integer offset = classmaps.get(v.ownerclass).get(v);
          String t = genTemp();
          output("HLOAD " + t + " TEMP 0 " + offset);
          _ret.addr = t;
       }
       _ret.type = v.type.name;
       _ret.istypedefault = !v.type.isclass;
       _ret.isconstant = false;

       if(_ret.type.equals("boolean")) {
         if(argu.ifusage) {
            String t = _ret.addr;
            if(argu.tru.equals("fall")) {
               output("CJUMP " + t + " " + argu.fls);
            } else if (argu.fls.equals("fall")) {
               String t2 = genTemp();
               output("MOVE " + t2 + " NE " + t + " 1");
               output("CJUMP " + t2 + " " + argu.tru);
            } else {
               output("CJUMP " + t + " " + argu.fls);
               output("JUMP " + argu.tru);
            }
            // argu.ifusage = false;
         }
       }
       if(!_ret.istypedefault) {
         for (Class_ c11 : table.classes) {
            if(c11.name.equals(_ret.type)) {
               objMap.put(_ret.addr, c11);
               _ret.callerobj = c11.name;
               break;
            }
         }
      }
    }
    if(argu != null && argu.from == "PE" && argu.typelookup) {
       //well if it is typelookup, then what??
    }
    return _ret;
 }

 /**
  * f0 -> "this"
  */
 public AttrSynthesized visit(ThisExpression n, AttrInherited argu) {
    AttrSynthesized _ret=new AttrSynthesized();
    n.f0.accept(this, argu);
    String t = genTemp();
    output("MOVE " + t + " TEMP 0");
    String cname = scopestack.get(1);
    Class_ c = null;
    for (Class_ c1 : table.classes) {
       if(c1.name.equals(cname)) {
          c = c1;
          break;
       }
    }
    if(c == null) error();
    objMap.put(t, c);
    _ret.callerobj = c.name;
    _ret.addr = t;
    return _ret;
 }

 /**
  * f0 -> "new"
  * f1 -> "int"
  * f2 -> "["
  * f3 -> Expression()
  * f4 -> "]"
  */
 public AttrSynthesized visit(ArrayAllocationExpression n, AttrInherited argu) {
    AttrSynthesized _ret=new AttrSynthesized();
    AttrSynthesized e;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    e = n.f3.accept(this, argu);
    n.f4.accept(this, argu);

    String t = e.addr;
    if(e.isconstant) {
       Integer i = Integer.parseInt(t);
       String t1 = genTemp();
       Integer size = 4 * (i + 1);
       output("MOVE " + t1 + " " + size);
       String t2 = genTemp();
       output("MOVE " + t2 + " HALLOCATE " + t1);
       String t3 = genTemp();
       output("MOVE " + t3 + " " + i);
       output("HSTORE " + t2 + " 0 " + t3);
       String t4 = genTemp();
       output("MOVE " + t4 + " 0");
       for(int j = 1; j <= i; j++) {
         Integer k = j*4;
         output("HSTORE " + t2 + " " + k + " " + t4);
       }
       _ret.addr = t2;
     } else {
      String t1 = genTemp();
      output("MOVE " + t1 + " PLUS " + t + " 1");
      String t4 = genTemp();
      output("MOVE " + t4 + " TIMES " + t1 + " 4");
      String t2 = genTemp();
      output("MOVE " + t2 + " HALLOCATE " + t4);
      output("HSTORE " + t2 + " 0 " + t);
      _ret.addr = t2;
     } 
    return _ret;
 }

 /**
  * f0 -> "new"
  * f1 -> Identifier()
  * f2 -> "("
  * f3 -> ")"
  */
 public AttrSynthesized visit(AllocationExpression n, AttrInherited argu) {
    AttrSynthesized _ret=new AttrSynthesized();
    n.f0.accept(this, argu);
    if(argu != null && argu.from == "PE") {
       argu.typelookup = true;
    }
    n.f1.accept(this, argu);
    if(argu != null && argu.from == "PE") {
      argu.typelookup = false;
    }
    
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    String cname = n.f1.f0.tokenImage;
    Class_ c = null;
    for (Class_ iter : table.classes) {
       if(cname == iter.name) {
          c = iter;
          break;
       }
    }
    if(c == null) error();
    Integer size = c.size;
    String s = genTemp();
    output("MOVE " + s + " " + size);
    String o = genTemp();
    output("MOVE " + o + " HALLOCATE " + s);
    for(Object obj : classmaps.get(c).keySet()) {
       if(obj.getClass() == FuntionTable.class) {
         FuntionTable ft = (FuntionTable)obj;
         Integer ftoffset = classmaps.get(c).get(obj);
         // String t1 = genTemp();
         // output("MOVE " + t1 + " " + ftoffset);
         Integer ftsize = ft.fnmaps.size() * 4;
         String t4 = genTemp();
         output("MOVE " + t4 + " " + ftsize);
         String t2 = genTemp();
         output("MOVE " + t2 + " HALLOCATE " + t4);
         for (Method_ m : ft.fnmaps.keySet()) {
            String label = m.owner.name+"_"+m.name;
            if(label.endsWith("()")) {
               label = label.substring(0, label.length()-2);
            }
            String t3 = genTemp();
            output("MOVE " + t3 + " " + label);
            Integer mind = ft.fnmaps.get(m);
            output("HSTORE " + t2 + " " + mind + " " + t3);
         }
         output("HSTORE " + o + " " + ftoffset + " " + t2);
       }
    }
    objMap.put(o, c);
    _ret.callerobj = c.name;
    _ret.addr = o;
    
    return _ret;
 }

 /**
  * f0 -> "!"
  * f1 -> Expression()
  */
 public AttrSynthesized visit(NotExpression n, AttrInherited B) {
    AttrSynthesized _ret=new AttrSynthesized();
    AttrInherited B1 = new AttrInherited();
    B1.from = B.from;
    B1.ifusage = B.ifusage;
    B1.tru = B.fls;
    B1.fls = B.tru;
    B1.next = B.next;
    n.f0.accept(this, B);
    _ret = n.f1.accept(this, B1);
    if(!B.ifusage) {
       String t = genTemp();
       output("MOVE " + t + " NE " + _ret.addr + " 1");
       _ret.addr = t;
    }
   _ret.type = "boolean";
   // B.ifusage = false;
    return _ret;
 }

 /**
  * f0 -> "("
  * f1 -> Expression()
  * f2 -> ")"
  */
 public AttrSynthesized visit(BracketExpression n, AttrInherited argu) {
    AttrSynthesized _ret=new AttrSynthesized();
    n.f0.accept(this, argu);
    _ret = n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

}
