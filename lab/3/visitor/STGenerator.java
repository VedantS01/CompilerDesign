package visitor;
import java.util.*;

import syntaxtree.*;

public class STGenerator extends GJNoArguDepthFirst<String> implements GJNoArguVisitor<String>{
    // Following class data members essentially represent the symbol table as a whole
   public SymbolTable table;

   public void printsyntaxtable() {
      table.print();
   }
    
    // divide the program in scopes, associate variables and methods to a scope

    
    // for each variable, map it to a type
    // for each method, map it to return type, and function parameters (types)
    // for each inherited class or scope, map it to its parent (maybe not for now, later)
    // for the parser, maintain a general stack for scopes like visitor > MiniJavaTypeChecker.java > MiniJavaTypeChecker
    // if needed, add counts and variables and so on
    // override each method you need in here, add new methods
    // So until next time, Sayonara

    private Stack<String> currentScopeStack;    //maintains scope of current section
    private HashMap<String,HashSet<String>> scopes; //maintains visibility of scopes
    private HashMap<String,String> typeof; //maintains symbol table
    private HashMap<String,ArrayList<String>> fnargs; //maintains signature of a function
    private HashMap<String,String> inheritance; //maintain inheritance information
    private HashMap<String,String> fnaccess; //maintains signature of a function

    //helpers
    public boolean typecheck = false; //when typecheck is false, it builds symbol table, and when it is true, it type checks
    boolean idastype = false; //when an identifier is parsed as type, this is set, else reset

    //for aiding method declarations
    ArrayList<String> tempArgTypes = new ArrayList<>(); //for recording fn arg types

    //for temporary information
    private Stack<ArrayList<String>> tempStack = new Stack<>();


      public void extracttable() {
         if(table == null) table = new SymbolTable();
         String gscope = "global::";
         if(!scopes.containsKey(gscope)) return;
         for (String c : scopes.get(gscope)) {
            Class_ class_ = new Class_();
            class_.name = c;
            String cscope = "global::"+c+"::";
            if(scopes.containsKey(cscope))
            for (String vorm : scopes.get(cscope)) {
               if(vorm.endsWith("()")) {
                  //m
                  Method_ m = new Method_();
                  m.name = vorm;
                  m.access = fnaccess.get(cscope+vorm);
                  Type_ ret = new Type_();
                  ret.name = typeof.get(cscope+vorm);
                  if(lookupclass(ret.name) != null) {
                     ret.isclass = true;
                  } else {
                     ret.isclass = false;
                  }
                  m.rettype = ret;
                  String mscope = cscope+vorm+"::";
                  if(scopes.containsKey(mscope))
                  for (String formal : scopes.get(mscope)) {
                     Variable_ v = new Variable_();
                     v.name = formal;
                     Type_ t = new Type_();
                     t.name = typeof.get(mscope+v.name);
                     if(lookupclass(t.name) != null) {
                        t.isclass = true;
                     } else {
                        t.isclass = false;
                     }
                     v.type = t;
                     m.addFormal(v);
                  }
                  mscope = mscope+"body::";
                  if(scopes.containsKey(mscope))
                  for (String local : scopes.get(mscope)) {
                     Variable_ v = new Variable_();
                     v.name = local;
                     Type_ t = new Type_();
                     t.name = typeof.get(mscope+v.name);
                     if(lookupclass(t.name) != null) {
                        t.isclass = true;
                     } else {
                        t.isclass = false;
                     }
                     v.type = t;
                     m.addLocal(v);
                  }
                  class_.addMethod(m);
               } else {
                  //v
                  Variable_ v = new Variable_();
                  v.name = vorm;
                  Type_ t = new Type_();
                  t.name = typeof.get(cscope+v.name);
                  if(lookupclass(t.name) != null) {
                     t.isclass = true;
                  } else {
                     t.isclass = false;
                  }
                  v.type = t;
                  class_.addVariable(v);
               }
            }
            table.addClass(class_);
         }
         for (Class_ c : table.classes) {
            String name = c.name;
            String parent = inheritance.get(name);
            if(parent == null) {
               c.parent = null;
            } else {
               for (Class_ par : table.classes) {
                  if(par.name == parent) {
                     c.parent = par;
                     break;
                  }
               }
            }
         }
      }

    /**
     * Public empty constructor
     */
    public STGenerator() {
        table = new SymbolTable();
        currentScopeStack = new Stack<String>();
        scopes = new HashMap<String,HashSet<String>>();
        typeof = new HashMap<String, String>();
        fnargs = new HashMap<String, ArrayList<String>>();
        inheritance = new HashMap<String, String>();
        fnaccess = new HashMap<String, String>();
        typecheck = false;
    }

    /**
     * stack up new scope
     **/
    private void startScope(String s) {
        currentScopeStack.add(s);
        String scope = getScope();
        if(!scopes.containsKey(scope)) {
            scopes.put(scope,new HashSet<String>());
        }
    }

    /**
     * stack out a scope
     **/
    private void endScope() {
        currentScopeStack.pop();
    }

    /**
     * get current scope
     **/
    private String getScope() {
        String str = "";
        for(String s : currentScopeStack) {
            str += s + "::";
        }
        return str;
    }

    /**
     * report error and exit
     **/
    private void error() {
        System.out.println("Type error");
        System.exit(0);
    }

    /**
     * whether child extends parent, or not
     * @param child
     * @param parent
     * @return
     */
    private boolean cextends(String c, String p) {
        if(lookupclass(c) == null) return false;
        if(lookupclass(p) == null) return false;
        if(c == p) return true;
        if(!inheritance.containsKey(c)) return false;
        return cextends(inheritance.get(c), p);
    }

    /**
     * Least upper bound in the inheritance tree
     * @param class1
     * @param class2
     * @return name of least upper bound in inheritance of the two classes if exists. null if lub doesn't exist.
     */
    private String lub(String class1, String class2){
        // System.out.println(class1 + " " + class2);
        if(lookupclass(class1) == null) return null;
        if(lookupclass(class2) == null) return null;

        // if(class1.equals(class2)) return class1;

        // String classt = lub(class2,inheritance.get(class1));
        // if(classt != null) return classt;
        // return lub(class1,inheritance.get(class2));
        if(cextends(class1, class2)) return class2;
        if(cextends(class2, class1)) return class1;
        if(inheritance.containsKey(class1) && inheritance.containsKey(class2)){
            return lub(inheritance.get(class1), inheritance.get(class2));
        }

        return null;
    }

    /**
     * add a variable in current scope
     **/
    private void addVariable(String var, String type) {
        String scope = getScope();
        if(scopes.get(scope).contains(var)) {
            error();
        }
        scopes.get(scope).add(var);
        if(typeof.containsKey(scope+var)) error();
        typeof.put(scope+var,type);
    }

    /**
     * add parameter type list of a function
     * @param fullMethod
     * @param argTypes
     */
    private void addFnArgs(String fullMethod, ArrayList<String> argTypes, String access) {
        if(fnargs.containsKey(fullMethod) || fnaccess.containsKey(fullMethod)) {
            error();
        }
        fnargs.put(fullMethod, new ArrayList<>(argTypes));
        fnaccess.put(fullMethod, access);
    }

    /**
     * print the symbol table
     */
    public void printSymbolTable() {
        System.out.println("Symbol Table:");
        System.out.println(scopes.toString());
        System.out.println(typeof.toString());
        System.out.println(fnargs.toString());
        System.out.println(fnaccess.toString());
        System.out.println(inheritance.toString());
    }

    /**
     * Associate child class with a parent
     * @param child
     * @param parent
     */
    private void addParent(String child, String parent) {
        //always works in global scope
        if(inheritance.containsKey(child)) {
            error();
        }
        inheritance.put(child, parent);
    }

    /**
     * Check if a symbol is visible in current scope or not
     * Returns type of name if successful
     * Else returns null
     * @param name
     * @return
     */
    // public String lookupname(String name) {
    //     ArrayList<String> lookupscopes = new ArrayList<>();
    //     String str = "";
    //     int size = currentScopeStack.size();
    //     for(int i = 0; i < size; i++) {
    //         str += currentScopeStack.get(i) + "::";
    //         lookupscopes.add(str);
    //     }
    //     for (int i = size-1; i >= 0; i--) {
    //         String fullname = lookupscopes.get(i)+name;
    //         if(vars.containsKey(fullname)) {
    //             return vars.get(fullname);
    //         }
    //     }
    //     // error();
    //     return null;
    // }
/**
     * Check if a symbol is visible in current scope or not
     * Returns type of name if successful
     * Else returns null
     * @param name
     * @return
     */
    private String lookupclass(String name) {
        String scope = "global::";
        if(!scopes.containsKey(scope)) error();
        if(scopes.get(scope).contains(name)) {
            return typeof.get(scope+name);
        }
        return null;
    }

    /**
     * Returns type of name if successful
     * Else returns null
     * @param name
     * @return type, or null
     */
    private String lookupvar(String name) {

        //check for local declaration
        String scope = getScope();
        String fullname = scope + name;
        if(!scopes.containsKey(scope)) error();
        if(scopes.get(scope).contains(name)) {
            return typeof.get(fullname);
        }

        //check for formal parameter
        scope = scope.substring(0,scope.lastIndexOf("::"));
        scope = scope.substring(0,scope.lastIndexOf("::")+2);
        fullname = scope + name;
        if(!scopes.containsKey(scope)) error();
        if(scopes.get(scope).contains(name)) {
            return typeof.get(fullname);
        }

        //check for enclosing class
        scope = scope.substring(0,scope.lastIndexOf("::"));
        scope = scope.substring(0,scope.lastIndexOf("::")+2);
        fullname = scope + name;
        if(!scopes.containsKey(scope)) error();
        if(scopes.get(scope).contains(name)) {
            return typeof.get(fullname);
        }

        //check for parent class(es) if exists
        if(currentScopeStack.size() < 2) error();
        String pclass = currentScopeStack.get(1);
        while(inheritance.containsKey(pclass)) {
            pclass = inheritance.get(pclass);
            scope = "global::"+pclass+"::";
            fullname = scope + name;
            if(!scopes.containsKey(scope)) error();
            if(scopes.get(scope).contains(name)) {
                return typeof.get(fullname);
            }
        }
        error();
        return null;
    }

    private boolean compareLists(ArrayList<String> a, ArrayList<String> b) {
        if(a == null && b == null) return true;
        if(a == null || b == null) return false;
        if(a.size() != b.size()) return false;
        for(int i = 0; i < a.size(); i++) {
            if(a.get(i) != b.get(i)) return false;
        }
        return true;
    }

    private boolean compareListsHeritage(ArrayList<String> a, ArrayList<String> b) {
        if(a == null && b == null) return true;
        if(a == null || b == null) return false;
        if(a.size() != b.size()) return false;
        for(int i = 0; i < a.size(); i++) {
            if((lookupclass(a.get(i)) != null)&&(lookupclass(b.get(i)) != null)) {
                if(!cextends(b.get(i), a.get(i))) return false;
            }
            else if(a.get(i) != b.get(i)) return false;
        }
        return true;
    }

    /**
     * Looks up a member function
     * @param classname called by the instanse of type classname
     * @param scope called in the scope
     * @param methodname name of the method called
     * @param paramList list of types of parameters
     * @return return type of the found method
     */
    private String lookupclassmethod(String classname, String methodname, ArrayList<String> paramList) {

        // which instance of method?
        String pclass = classname;
        while(pclass != null) {
            String scope = "global::"+pclass+"::";
            if(!scopes.containsKey(scope)) error();
            if(scopes.get(scope).contains(methodname)){
                // found an instance of the method
                // is it visible? does it match parameters?
                String fullname = scope + methodname;
                // System.out.println(fullname);
                if(!fnaccess.containsKey(fullname)) error();
                if(!fnargs.containsKey(fullname)) error();
                // System.out.println(fnargs.get(fullname).toString());
                // System.out.println(paramList.toString());
                if(pclass == classname && fnaccess.get(fullname) == "private" && currentScopeStack.get(1) == pclass && compareListsHeritage(fnargs.get(fullname), paramList)){
                    // found!
                    return typeof.get(fullname);
                }
                if(fnaccess.get(fullname) == "protected" && compareListsHeritage(fnargs.get(fullname), paramList)){
                    String tclass = currentScopeStack.get(1);
                    while(tclass != null) {
                        if(tclass == pclass) {
                            return typeof.get(fullname);
                        }
                        // if(!inheritance.containsKey(tclass)) continue;
                        tclass = inheritance.get(tclass);
                    }
                }
                if(fnaccess.get(fullname) == "public" && compareListsHeritage(fnargs.get(fullname), paramList)) {
                    // found!
                    return typeof.get(fullname);
                }
                
            }
            pclass = inheritance.get(pclass);
        }
        return null;
    }

    /**
     * Check for hierarchical cycles
     */
    private void checkForCycles() {
        ArrayList<String> keyset = new ArrayList<>(inheritance.keySet());
        for(String s : keyset) {
            if(!inheritance.containsValue(s)) continue;
            String p = inheritance.get(s);
            while(inheritance.containsKey(p)) {
                String p1 = inheritance.get(p);
                if(p1 == s) {
                    error();
                }
                p = p1;
            }
        }
    }

    private boolean validdatemethod(String mname, String bclass, String access,String rettype, ArrayList<String> argtypes) {
        // check in all parent classes
        String pclass = inheritance.get(bclass);
        // if(!scopes.get("global::").contains(pclass)) error();
        while(pclass != null) {
            String scope = "global::"+pclass+"::";
            if(!scopes.containsKey(scope)) break;
            if(scopes.get(scope).contains(mname)){
                String fname = scope + mname;
                if(fnaccess.get(fname) == "private") {
                    pclass = inheritance.get(pclass);
                    if(pclass == null) break;
                    continue;
                }
                if(fnaccess.get(fname) != access) error();
                // System.out.println(fname);
                if(!compareLists(fnargs.get(fname), argtypes)) error();
                if(lookupclass(typeof.get(fname)) != null 
                && lookupclass(rettype) != null) {
                    if(!cextends(rettype, typeof.get(fname))) error();
                } else if(typeof.get(fname) != rettype) error();
            }
            pclass = inheritance.get(pclass);
        }

        //check in all children as well
        //NOTE: during primary parsing, there maybe a lot of breaking up of links in the heritage. Maybe a grandparent and child have same functions but no say das parent may be defined later, defying the link between grand parent and child
        for (String string : typeof.keySet()) {
            if(typeof.get(string) == null) continue;
            string = string.substring(string.lastIndexOf("::")+2);
            if(cextends(string, bclass)) {
                String scope = "global::"+string+"::";
                if(!scopes.containsKey(scope)) continue;
                if(scopes.get(scope).contains(mname)){
                    String fname = scope + mname;
                    if(access == "private")  {
                        // pclass = inheritance.get(pclass);
                        continue;
                    }
                    if(fnaccess.get(fname) != access) error();
                    // System.out.println(fname);
                    if(!compareLists(fnargs.get(fname), argtypes)) error();
                    if(lookupclass(typeof.get(fname)) != null 
                    && lookupclass(rettype) != null) {
                        if(!cextends(typeof.get(fname),rettype)) error();
                    } else if(typeof.get(fname) != rettype) error();
                }
            }
        }
        return true;
    }
    
    /**
     * CRITICAL: eliminate cycles before they are created; might otherwise cause infinite loop
     * 
     * @param c
     * @param p
     */
    private void validinheritance(String c, String p) {
        if(cextends(p, c)) error();
    }

    public void missingClassOverloadChecks(String classname) {
        if(!(inheritance.containsKey(classname) && inheritance.containsValue(classname))) return;
        HashSet<String> classes = scopes.get("global::");
        for (String parent : classes) {
            if(parent == classname || !cextends(classname, parent)) continue;
            if(!scopes.containsKey("global::"+parent+"::")) continue;
            for (String child : classes) {
                if(child == classname || !cextends(child, classname)) continue;
                if(!scopes.containsKey("global::"+child+"::")) continue;

                HashSet<String> fns = scopes.get("global::"+child+"::");
                for (String string : fns) {
                    if(!string.endsWith("()")) continue;
                    validdatemethod(string, child, fnaccess.get("global::"+child+"::"+string), typeof.get("global::"+child+"::"+string), fnargs.get("global::"+child+"::"+string));
                }
            }
        }
    }

// methods inherited from GJNoArguDepthFirst
// overrides

    @Override
    public String visit(NodeToken n) { return n.tokenImage; }

   /**
    * f0 -> MainClass()
    * f1 -> ( TypeDeclaration() )*
    * f2 -> <EOF>
    */
    public String visit(Goal n) {
        if(typecheck) {
            checkForCycles();
        }
        startScope("global");
        String _ret=null;
        String mClass = n.f0.accept(this);
        if(!typecheck) {
            addVariable(mClass, "MainClass");
        }
        n.f1.accept(this);
        n.f2.accept(this);
        endScope();
        if(!typecheck) {
           extracttable();
        }
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
     public String visit(MainClass n) {
        String _ret=null;
        n.f0.accept(this);
        _ret = n.f1.accept(this);
        n.f2.accept(this);
        startScope(_ret);
        n.f3.accept(this);
        n.f4.accept(this);
        n.f5.accept(this);
        n.f6.accept(this);
        // String _type = "";
        if(!typecheck) {
            addVariable("main()", "void");
        // } else {
        //     _type = lookupname("main()");
        //     if(!_type.equals("void")) error();
        }
        String pscope = getScope();
        startScope("main()");
        n.f7.accept(this);
        n.f8.accept(this);
        n.f9.accept(this);
        n.f10.accept(this);
        String args = n.f11.accept(this);
        if(!typecheck) {
            addVariable(args, "String[]");
            tempArgTypes.clear();
            tempArgTypes.add("String[]");
            addFnArgs(pscope+"main()", tempArgTypes, "public");
            tempArgTypes.clear();
        // } else {
        //     _type = lookupname(args);
        //     if(!_type.equals("String[]")) error();
        }
        n.f12.accept(this);
        n.f13.accept(this);
        n.f14.accept(this);
        n.f15.accept(this);
        endScope();
        n.f16.accept(this);
        endScope();
        return _ret;
     }
  
     /**
      * f0 -> ClassDeclaration()
      *       | ClassExtendsDeclaration()
      */
     public String visit(TypeDeclaration n) {
        String _ret=null;
        n.f0.accept(this);
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
     public String visit(ClassDeclaration n) {
        String _ret=null;
        n.f0.accept(this);
        String classname = n.f1.accept(this);
        if(!typecheck) {
            addVariable(classname, "class");
        }
        n.f2.accept(this);
        startScope(classname);
        n.f3.accept(this);
        n.f4.accept(this);
        n.f5.accept(this);
        endScope();
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
     public String visit(ClassExtendsDeclaration n) {
        String _ret=null;
        n.f0.accept(this);
        String classname = n.f1.accept(this);
        if(!typecheck) {
            addVariable(classname, "class");
        }
        n.f2.accept(this);
        String parent = n.f3.accept(this);
        if(!typecheck) {
            validinheritance(classname, parent);
            addParent(classname, parent);
        } else {
            if(lookupclass(parent) == null) error();;
        }
        n.f4.accept(this);
        startScope(classname);
        n.f5.accept(this);
        n.f6.accept(this);
        n.f7.accept(this);
        endScope();
        missingClassOverloadChecks(classname);
        return _ret;
     }
  
     /**
      * f0 -> Type()
      * f1 -> Identifier()
      * f2 -> ";"
      */
     public String visit(VarDeclaration n) {
        String _ret=null;
        String type = n.f0.accept(this);
        // if(typecheck && idastype) {
        //     if(lookupname(type) == null) {
        //         // error();
        //     }
        // }
        // idastype = false;
        String varname = n.f1.accept(this);
        if(!typecheck) {
            addVariable(varname, type);
        }
        n.f2.accept(this);
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
     public String visit(MethodDeclaration n) {
        String _ret=null;
        String accessType = n.f0.accept(this);
        String rettype = n.f1.accept(this);
        String fnname = n.f2.accept(this);
        if(!typecheck) {
            // validateacess(fnname+"()", rettype);
            addVariable(fnname+"()", rettype);
        }
        String pscope = getScope();
        startScope(fnname+"()");
        n.f3.accept(this);
        tempArgTypes.clear();
        n.f4.accept(this);
        if(!typecheck) {
            validdatemethod(fnname+"()", currentScopeStack.get(1), accessType, rettype, tempArgTypes);
            addFnArgs(pscope+fnname+"()", tempArgTypes, accessType);
        }
        tempArgTypes.clear();
        n.f5.accept(this);
        n.f6.accept(this);
        startScope("body");
        n.f7.accept(this);
        n.f8.accept(this);
        n.f9.accept(this);
        String retval = n.f10.accept(this);
        if(typecheck){
            if(lookupclass(retval) != null && lookupclass(rettype) != null) {
                String s = lub(rettype, retval);
                if(s == null || s != rettype) error();
            } else if(retval != rettype) error();
        }
        n.f11.accept(this);
        endScope();
        n.f12.accept(this);
        endScope();
        return _ret;
     }
  
     /**
      * f0 -> FormalParameter()
      * f1 -> ( FormalParameterRest() )*
      */
     public String visit(FormalParameterList n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> Type()
      * f1 -> Identifier()
      */
     public String visit(FormalParameter n) {
        String _ret=null;
        String type = n.f0.accept(this);
        // if(typecheck && idastype) {
        //     if(lookupname(type) == null) {
        //         error();
        //     }
        // }
        // idastype = false;
        String varname = n.f1.accept(this);
        if(!typecheck){
            addVariable(varname, type);
            tempArgTypes.add(type);
        }
        return _ret;
     }
  
     /**
      * f0 -> ","
      * f1 -> FormalParameter()
      */
     public String visit(FormalParameterRest n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> ArrayType()
      *       | BooleanType()
      *       | IntegerType()
      *       | Identifier()
      */
     public String visit(Type n) {
        String _ret=null;
        idastype = false;
        _ret = n.f0.accept(this);
        // idastype = true;
        if(typecheck && idastype) {
            if(lookupclass(_ret) == null) {
                error();
            }
        }
        idastype = false;
        return _ret;
     }

     /**
    * f0 -> PublicType()
    *       | PrivateType()
    *       | ProtectedType()
    */
   public String visit(AccessType n) {
    String _ret=null;
    _ret = n.f0.accept(this);
    return _ret;
 }
  
     /**
      * f0 -> "int"
      * f1 -> "["
      * f2 -> "]"
      */
     public String visit(ArrayType n) {
        String _ret="int[]";
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> "boolean"
      */
     public String visit(BooleanType n) {
        String _ret="boolean";
        n.f0.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> "int"
      */
     public String visit(IntegerType n) {
        String _ret="int";
        n.f0.accept(this);
        return _ret;
     }

     /**
    * f0 -> "public"
    */
   public String visit(PublicType n) {
    String _ret="public";
    n.f0.accept(this);
    return _ret;
 }

 /**
  * f0 -> "private"
  */
 public String visit(PrivateType n) {
    String _ret="private";
    n.f0.accept(this);
    return _ret;
 }

 /**
  * f0 -> "protected"
  */
 public String visit(ProtectedType n) {
    String _ret="protected";
    n.f0.accept(this);
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
     public String visit(Statement n) {
        String _ret=null;
        n.f0.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> "{"
      * f1 -> ( Statement() )*
      * f2 -> "}"
      */
     public String visit(Block n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> Identifier()
      * f1 -> "="
      * f2 -> Expression()
      * f3 -> ";"
      */
     public String visit(AssignmentStatement n) {
        String _ret=null;
        String varname = n.f0.accept(this);
        if(typecheck) {
            varname = lookupvar(varname);
        }
        n.f1.accept(this);
        String type = n.f2.accept(this);
        if(typecheck){
            if(lookupclass(type) != null && lookupclass(varname) != null) {
                String s = lub(type, varname);
                if(s == null || s != varname) error();
            } else if(type != varname) error();
        }
        n.f3.accept(this);
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
     public String visit(ArrayAssignmentStatement n) {
        String _ret=null;
        String varname = n.f0.accept(this);
        if(typecheck){
            if(lookupvar(varname) != "int[]") error();
        }
        n.f1.accept(this);
        String type = n.f2.accept(this);
        if(typecheck) {
            if(type != "int") error();
        }
        n.f3.accept(this);
        n.f4.accept(this);
        type = n.f5.accept(this);
        if(typecheck){
            if(type != "int") error();
        }
        n.f6.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> IfthenElseStatement()
      *       | IfthenStatement()
      */
     public String visit(IfStatement n) {
        String _ret=null;
        n.f0.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> "if"
      * f1 -> "("
      * f2 -> Expression()
      * f3 -> ")"
      * f4 -> Statement()
      */
     public String visit(IfthenStatement n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        String type = n.f2.accept(this);
        if(typecheck) {
            if(type != "boolean") error();
        }
        n.f3.accept(this);
        n.f4.accept(this);
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
     public String visit(IfthenElseStatement n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        String type = n.f2.accept(this);
        if(typecheck) {
            if(type != "boolean") error();
        }
        n.f3.accept(this);
        n.f4.accept(this);
        n.f5.accept(this);
        n.f6.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> "while"
      * f1 -> "("
      * f2 -> Expression()
      * f3 -> ")"
      * f4 -> Statement()
      */
     public String visit(WhileStatement n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        String type = n.f2.accept(this);
        if(typecheck) {
            if(type != "boolean") error();
        }
        n.f3.accept(this);
        n.f4.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> "System.out.println"
      * f1 -> "("
      * f2 -> Expression()
      * f3 -> ")"
      * f4 -> ";"
      */
     public String visit(PrintStatement n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        String type = n.f2.accept(this);
        if(typecheck) {
            if(type != "int") error();
        }
        n.f3.accept(this);
        n.f4.accept(this);
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
     public String visit(Expression n) {
        String _ret=null;
        String ret = n.f0.accept(this);
        if(typecheck) {
            return ret;
        }
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "&&"
      * f2 -> PrimaryExpression()
      */
     public String visit(AndExpression n) {
        String _ret=null;
        String a =n.f0.accept(this);
        if(typecheck) {
            if(a != "boolean") error();
        }
        n.f1.accept(this);
        String b =n.f2.accept(this);
        if(typecheck) {
            if(b != "boolean") error();
            return "boolean";
        }
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "||"
      * f2 -> PrimaryExpression()
      */
     public String visit(OrExpression n) {
        String _ret=null;
        String a =n.f0.accept(this);
        if(typecheck) {
            if(a != "boolean") error();
        }
        n.f1.accept(this);
        String b =n.f2.accept(this);
        if(typecheck) {
            if(b != "boolean") error();
            return "boolean";
        }
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "<="
      * f2 -> PrimaryExpression()
      */
     public String visit(CompareExpression n) {
        String _ret=null;
        String a =n.f0.accept(this);
        n.f1.accept(this);
        String b =n.f2.accept(this);
        if(typecheck) {
            if(a != b) error();
            switch(a) {
                case "int":
                    return "boolean";
                default:
                    error();
            }
            return "boolean";
        }
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "!="
      * f2 -> PrimaryExpression()
      */
     public String visit(neqExpression n) {
        String _ret=null;
        String a =n.f0.accept(this);
        n.f1.accept(this);
        String b =n.f2.accept(this);
        if(typecheck) {
            // if(a != b) error();
            // System.out.println(a + " " + b);
            if(a.equals(b)) {
                switch(a) {
                    case "int":
                    case "boolean":
                    case "int[]":
                    return "boolean";
                }
            }
            if(lookupclass(a) != null && lookupclass(b) != null){
                if(!(cextends(a, b) || cextends(b, a))) error();
                return "boolean";
            } else if(a != b) {
                error();
            }
            return "boolean";
        }
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "+"
      * f2 -> PrimaryExpression()
      */
     public String visit(PlusExpression n) {
        String _ret=null;
        String t1 = n.f0.accept(this);
        n.f1.accept(this);
        String t2 = n.f2.accept(this);
        if(typecheck) {
            if(t1 != t2) error();
            switch(t1) {
                case "int":
                    break;
                default:
                    error();
            }
            return t1;
        }
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "-"
      * f2 -> PrimaryExpression()
      */
     public String visit(MinusExpression n) {
        String _ret=null;
        String t1 = n.f0.accept(this);
        n.f1.accept(this);
        String t2 = n.f2.accept(this);
        if(typecheck) {
            if(t1 != t2) error();
            switch(t1) {
                case "int":
                    break;
                default:
                    error();
            }
            return t1;
        }
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "*"
      * f2 -> PrimaryExpression()
      */
     public String visit(TimesExpression n) {
        String _ret=null;
        String t1 = n.f0.accept(this);
        n.f1.accept(this);
        String t2 = n.f2.accept(this);
        if(typecheck) {
            if(t1 != t2) error();
            switch(t1) {
                case "int":
                    break;
                default:
                    error();
            }
            return t1;
        }
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "/"
      * f2 -> PrimaryExpression()
      */
     public String visit(DivExpression n) {
        String _ret=null;
        String t1 = n.f0.accept(this);
        n.f1.accept(this);
        String t2 = n.f2.accept(this);
        if(typecheck) {
            if(t1 != t2) error();
            switch(t1) {
                case "int":
                    break;
                default:
                    error();
            }
            return t1;
        }
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "["
      * f2 -> PrimaryExpression()
      * f3 -> "]"
      */
     public String visit(ArrayLookup n) {
        String _ret=null;
        String elem = n.f0.accept(this);
        if(typecheck) {
            if(elem != "int[]") error();
        }
        n.f1.accept(this);
        String it = n.f2.accept(this);
        if(typecheck) {
            if(it != "int") error();
        }
        n.f3.accept(this);
        if(typecheck) {
            return "int";
        }
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "."
      * f2 -> "length"
      */
     public String visit(ArrayLength n) {
        String _ret=null;
        String elem = n.f0.accept(this);
        if(typecheck) {
            if(elem != "int[]") error();
        }
        n.f1.accept(this);
        n.f2.accept(this);
        if(typecheck) return "int";
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
     public String visit(MessageSend n) {
        String _ret=null;
        String classname = n.f0.accept(this);
        if(typecheck) {
            // type check for class object
            if(classname == null) error();
            if(lookupclass(classname) == null) error();
        }
        n.f1.accept(this);
        String id = n.f2.accept(this);
        // if(typecheck) {
        //     // type check for visibility of function id in class
        // }
        idastype = false;
        n.f3.accept(this);
        tempStack.push(new ArrayList<>());
        n.f4.accept(this);
        n.f5.accept(this);
        if(typecheck) {
            // type check for correct argument list
            // return rettype of the function if found accessible, else error
            // tempArgTypes.clear();
            String ret = lookupclassmethod(classname, id+"()", tempStack.peek());
            if(ret == null) error();
            tempStack.pop();
            return ret;

        }
        // tempArgTypes.clear();
        tempStack.pop();
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "?"
      * f2 -> PrimaryExpression()
      * f3 -> ":"
      * f4 -> PrimaryExpression()
      */
     public String visit(TernaryExpression n) {
        String _ret=null;
        String boolexpr = n.f0.accept(this);
        if(typecheck){
            if(boolexpr != "boolean") error();
        }
        n.f1.accept(this);
        String t1 = n.f2.accept(this);
        n.f3.accept(this);
        String t2 = n.f4.accept(this);
        if(typecheck){
            if(lookupclass(t1) != null && lookupclass(t2) != null){
                _ret = lub(t1,t2);
                if(_ret == null) error();
                return _ret;
            } else if(t1 != t2) {
                error();
            }
            return t1;
        }
        return _ret;
     }
  
     /**
      * f0 -> Expression()
      * f1 -> ( ExpressionRest() )*
      */
     public String visit(ExpressionList n) {
        String _ret=null;
        // tempArgTypes.clear();
        // tempStack.push(new ArrayList<>());
        String type = n.f0.accept(this);
        if(typecheck) {
            // tempArgTypes.add(type);
            tempStack.peek().add(type);
        }
        n.f1.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> ","
      * f1 -> Expression()
      */
     public String visit(ExpressionRest n) {
        String _ret=null;
        n.f0.accept(this);
        String type = n.f1.accept(this);
        if(typecheck) {
            // tempArgTypes.add(type);
            tempStack.peek().add(type);
        }
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
     public String visit(PrimaryExpression n) {
        String _ret=null;
        idastype = false;
        _ret = n.f0.accept(this);
        if(typecheck) {
            if(idastype) {
                _ret = lookupvar(_ret);
            }
        }
        idastype = false;
        return _ret;
    }
  
     /**
      * f0 -> <INTEGER_LITERAL>
      */
     public String visit(IntegerLiteral n) {
        String _ret=null;
        _ret = n.f0.accept(this);
        if(typecheck) return "int";
        return _ret;
     }
  
     /**
      * f0 -> "true"
      */
     public String visit(TrueLiteral n) {
        String _ret="true";
        n.f0.accept(this);
        if(typecheck) return "boolean";
        return _ret;
     }
  
     /**
      * f0 -> "false"
      */
     public String visit(FalseLiteral n) {
        String _ret="false";
        n.f0.accept(this);
        if(typecheck) return "boolean";
        return _ret;
     }
  
     /**
      * f0 -> <IDENTIFIER>
      */
     public String visit(Identifier n) {
        String _ret=null;
        _ret = n.f0.accept(this);
        idastype = true;
        return _ret;
     }
  
     /**
      * f0 -> "this"
      */
     public String visit(ThisExpression n) {
        if(currentScopeStack.size() < 2) error();
        String _ret=currentScopeStack.get(1);
        n.f0.accept(this);
        if(typecheck) return _ret;
        return null;
     }
  
     /**
      * f0 -> "new"
      * f1 -> "int"
      * f2 -> "["
      * f3 -> Expression()
      * f4 -> "]"
      */
     public String visit(ArrayAllocationExpression n) {
        String _ret="int[]";
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
        String type = n.f3.accept(this);
        if(typecheck) {
            if(type != "int") error();
        }
        n.f4.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> "new"
      * f1 -> Identifier()
      * f2 -> "("
      * f3 -> ")"
      */
     public String visit(AllocationExpression n) {
        String _ret=null;
        n.f0.accept(this);
        _ret = n.f1.accept(this);
        if(typecheck) {
            if(lookupclass(_ret) == null) {
                error();
            }
        }
        n.f2.accept(this);
        n.f3.accept(this);
        idastype = false;
        return _ret;
     }
  
     /**
      * f0 -> "!"
      * f1 -> Expression()
      */
     public String visit(NotExpression n) {
        String _ret=null;
        n.f0.accept(this);
        String t = n.f1.accept(this);
        if(typecheck){
            if(t != "boolean") error();
            return t;
        }
        return _ret;
     }
  
     /**
      * f0 -> "("
      * f1 -> Expression()
      * f2 -> ")"
      */
     public String visit(BracketExpression n) {
        String _ret=null;
        n.f0.accept(this);
        _ret = n.f1.accept(this);
        n.f2.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> Identifier()
      * f1 -> ( IdentifierRest() )*
      */
     public String visit(IdentifierList n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> ","
      * f1 -> Identifier()
      */
     public String visit(IdentifierRest n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        return _ret;
     }
  

}