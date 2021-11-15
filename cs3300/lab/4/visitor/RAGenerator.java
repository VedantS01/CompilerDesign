package visitor;
import syntaxtree.*;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

public class RAGenerator extends GJDepthFirst<String, String> {
    private Boolean debug = false;
    
    public ArrayList<Proc> procs;
    private Proc curProc;
    private Integer curProcIndexInteger = 0;
    // private Integer maxcallargs; //?
    private Integer stackpointer; //?

    private String bodyofproc = "";

    // specific proc maps
    private HashMap<String,String> registermap = new HashMap<>();
    HashMap<String,String> stackmap = new HashMap<>();
    HashMap<String,String> argmap = new HashMap<>();

    private Boolean isv0used = false;
    private Boolean isv1used = false;
    private Boolean labellookup = false;
    private Boolean movelookup = false;
    private Boolean calllookup = false;
    private Integer currarg = 0;

    // global reg mapping, for all 24 regs
    HashMap<String, LiveInterval> curusage = new HashMap<>();

    public void codeout(String s) {
        // System.out.println(s);
        bodyofproc += s + "\n";
    }

    public void emit(String s) {
        System.out.println(s);
        if(debug) System.err.println(s);
    }

    public void error() {
        System.err.println("// ERROR ");
        System.exit(0);
     }
     public void error(String line) {
        System.err.println("// ERROR: AT LINE " + line);
        System.exit(0);
     }

    // NOTE : HIGHLY CONTEXT SENSITIVE, USE WISELY
    private String getreg(String temp, Boolean write) {
        // if(debug) System.err.println("Looking reg for " + temp);
        String reg = "";
        for (LiveInterval l : curProc.liveintervals) {
            if(l.label.equals(temp)) {
                if(l.isstacked) {
                    if(!isv1used) {
                        if(!write)
                        codeout("ALOAD v1 SPILLEDARG " + l.location);
                        reg = "v1";
                        isv1used = true;
                    } else if (!isv0used) {
                        if(!write)
                        codeout("ALOAD v0 SPILLEDARG " + l.location);
                        reg = "v0";
                        isv0used = true;
                    } else {
                        if(!write) {
                            System.err.println("FATAL ERROR!!!");
                        }
                        reg = "v0";
                    }
                } else {
                    reg = l.register;
                }
                curusage.put(reg, l);
            }
        }
        if(reg.equals("")) {
            error("REGALLOC failed due to register unavailable for T: " + temp);
        }
        return reg;
    }

    public void initregmaps() {
        for (int i = 0; i < 10; i++) {
            curusage.put("t"+i, null);
        }
        for (int i = 0; i < 8; i++) {
            curusage.put("s"+i, null);
        }
        for (int i = 0; i < 4; i++) {
            curusage.put("a"+i, null);
        }
        curusage.put("v0", null);
        curusage.put("v1", null);
    }

    // FLAGGED WITH HIGH CONTEXT SENSITIVITY; USE WISELY
    public void calleesave() {
        Proc p = curProc;
        // if MAIN, no need to callee save
        if(p.label.equals("MAIN")) {
            p.calleesavenumber = 0;
            if(p.spillcount > p.stackspace) {
                p.stackspace = p.spillcount;
            }
            return;
        }
        ArrayList<String> sregs = new ArrayList<>();
        for (int i = 0; i < 8; i++) sregs.add("s"+i);
        ArrayList<String> unusedsregs = new ArrayList<>();
        unusedsregs.addAll(sregs);
        unusedsregs.removeAll(p.usedregisters);
        sregs.removeAll(unusedsregs);
        // now sregs contain used sregs;
        p.calleesavenumber = sregs.size();
        Integer c = p.spillcount;
        for (String reg : sregs) {
            codeout("ASTORE SPILLEDARG " + c + " " + reg);
            c++;
        }
        if(c > p.stackspace) {
            p.stackspace = c;
        }
        // if(debug) {
        //     System.err.println("Stackspace for "+ p.label +" is : " + p.stackspace);
        //     System.err.println("-- spillcount: " + p.spillcount + " and c=" + c);
        // }
    }

    // FLAGGED WITH HIGH CONTEXT SENSITIVITY; USE WISELY
    public void calleerestore() {
        Proc p = curProc;
        // if MAIN, no need to callee save
        if(p.label.equals("MAIN")) {
            // p.calleesavenumber = 0;
            // if(p.spillcount > p.stackspace) {
            //     p.stackspace = p.spillcount;
            // }
            return;
        }
        ArrayList<String> sregs = new ArrayList<>();
        for (int i = 0; i < 8; i++) sregs.add("s"+i);
        ArrayList<String> unusedsregs = new ArrayList<>();
        unusedsregs.addAll(sregs);
        unusedsregs.removeAll(p.usedregisters);
        sregs.removeAll(unusedsregs);
        // now sregs contain used sregs;
        // p.calleesavenumber = sregs.size();
        Integer c = p.spillcount;
        for (String reg : sregs) {
            codeout("ALOAD "+ reg + " SPILLEDARG " + c);
            c++;
        }
        if(debug) {
            System.err.println("Stackspace for "+ p.label +" is : " + p.stackspace);
        }
        // if(c < p.stackspace) {
        //     p.stackspace = c;
        // }
    }

    // FLAGGED WITH HIGH CONTEXT SENSITIVITY; USE WISELY
    public void callersave() {
        Proc p = curProc;
        ArrayList<String> tregs = new ArrayList<>();
        for (int i = 0; i < 10; i++) tregs.add("t"+i);
        ArrayList<String> unusedtregs = new ArrayList<>();
        unusedtregs.addAll(tregs);
        unusedtregs.removeAll(p.usedregisters);
        tregs.removeAll(unusedtregs);
        // if(isv0used) tregs.add("v0");
        // now tregs contain used sregs;
        Integer c = p.calleesavenumber + p.spillcount;
        for (String reg : tregs) {
            codeout("ASTORE SPILLEDARG " + c + " " + reg);
            c++;
        }
        if(c > p.stackspace) {
            p.stackspace = c;
        }
        // if(debug) {
        //     System.err.println("Stackspace for "+ p.label +" is : " + p.stackspace);
        // }
    }

    // FLAGGED WITH HIGH CONTEXT SENSITIVITY; USE WISELY
    public void callerrestore() {
        Proc p = curProc;
        ArrayList<String> tregs = new ArrayList<>();
        for (int i = 0; i < 10; i++) tregs.add("t"+i);
        ArrayList<String> unusedtregs = new ArrayList<>();
        unusedtregs.addAll(tregs);
        unusedtregs.removeAll(p.usedregisters);
        tregs.removeAll(unusedtregs);
        // very carefully, this would only work when there is no v0 usage that sets v0 to unused
        // if(isv0used) tregs.add("v0"); // this code is in visit of Call node
        // now tregs contain used sregs;
        Integer c = p.calleesavenumber + p.spillcount;
        for (String reg : tregs) {
            codeout("ALOAD "+ reg + " SPILLEDARG " + c);
            c++;
        }
        // if(c < p.stackspace) {
        //     p.stackspace = c;
        // }
        // if(debug) {
        //     System.err.println("Stackspace for "+ p.label +" is : " + p.stackspace);
        // }
    }


//FROM GJDEPTHFIRST

    public String visit(NodeToken n, String argu) { return n.tokenImage; }
   /**
    * f0 -> "MAIN"
    * f1 -> StmtList()
    * f2 -> "END"
    * f3 -> ( Procedure() )*
    * f4 -> <EOF>
    */
   public String visit(Goal n, String argu) {
    initregmaps();

    String _ret=null;
    curProc = procs.get(curProcIndexInteger);
    // codeout(curProc.label + " [" + curProc.argc + "][" + curProc.stackspace + "][" + curProc.maxcallargs + "]");
    bodyofproc = "";
    calleesave();
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    calleerestore();
    emit(curProc.label + " [" + curProc.argc + "][" + curProc.stackspace + "][" + curProc.maxcallargs + "]");
    emit(bodyofproc);
    emit("END");
    curProc = null;
    curProcIndexInteger++;
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> ( ( Label() )? Stmt() )*
  */
 public String visit(StmtList n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> Label()
  * f1 -> "["
  * f2 -> IntegerLiteral()
  * f3 -> "]"
  * f4 -> StmtExp()
  */
 public String visit(Procedure n, String argu) {
    String _ret=null;
    curProc = procs.get(curProcIndexInteger);
    // codeout(curProc.label + " [" + curProc.argc + "][" + curProc.stackspace + "][" + curProc.maxcallargs + "]");
    bodyofproc = "";
    labellookup = true;
    n.f0.accept(this, argu);
    labellookup = false;
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    // callee save s regs
    calleesave();
    // set up args
    for (LiveInterval larg : curProc.args) {
        codeout("MOVE " + larg.register + " " + larg.argregister);
        curusage.put(larg.register, larg);
        curusage.put(larg.argregister, null);
    }
    n.f4.accept(this, argu);
    calleerestore();
    emit(curProc.label + " [" + curProc.argc + "][" + curProc.stackspace + "][" + curProc.maxcallargs + "]");
    emit(bodyofproc);
    emit("END");
    curProc = null;
    curProcIndexInteger++;
    return _ret;
 }

 /**
  * f0 -> NoOpStmt()
  *       | ErrorStmt()
  *       | CJumpStmt()
  *       | JumpStmt()
  *       | HStoreStmt()
  *       | HLoadStmt()
  *       | MoveStmt()
  *       | PrintStmt()
  */
 public String visit(Stmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    isv0used = false;
    isv1used = false;
    return _ret;
 }

 /**
  * f0 -> "NOOP"
  */
 public String visit(NoOpStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    codeout("NOOP");
    return _ret;
 }

 /**
  * f0 -> "ERROR"
  */
 public String visit(ErrorStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    codeout("ERROR");
    return _ret;
 }

 /**
  * f0 -> "CJUMP"
  * f1 -> Temp()
  * f2 -> Label()
  */
 public String visit(CJumpStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    String temp = n.f1.accept(this, argu);
    labellookup = true;
    String label = n.f2.accept(this, argu);
    labellookup = false;
    String reg = getreg(temp, false);
    codeout("CJUMP " + reg + " " + label);
    isv0used = false;
    isv1used = false;
    return _ret;
 }

 /**
  * f0 -> "JUMP"
  * f1 -> Label()
  */
 public String visit(JumpStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    labellookup = true;
    String label = n.f1.accept(this, argu);
    labellookup = false;
    codeout("JUMP " + label);
    return _ret;
 }

 /**
  * f0 -> "HSTORE"
  * f1 -> Temp()
  * f2 -> IntegerLiteral()
  * f3 -> Temp()
  */
 public String visit(HStoreStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    String t1 = n.f1.accept(this, argu);
    String t2 = n.f2.accept(this, argu);
    String t3 = n.f3.accept(this, argu);
    t1 = getreg(t1, false);
    t3 = getreg(t3, false);
    codeout("HSTORE " + t1 + " " + t2 + " " + t3);
    isv0used = false;
    isv1used = false;
    return _ret;
 }

 /**
  * f0 -> "HLOAD"
  * f1 -> Temp()
  * f2 -> Temp()
  * f3 -> IntegerLiteral()
  */
 public String visit(HLoadStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    String t1 = n.f1.accept(this, argu);
    String t2 = n.f2.accept(this, argu);
    String t3 = n.f3.accept(this, argu);
    t1 = getreg(t1, true);
    t2 = getreg(t2, false);
    codeout("HLOAD " + t1 + " " + t2 + " " + t3);
    if(t1.equals("v0") || t1.equals("v1") || t1.equals("t9")) {
        codeout("ASTORE SPILLEDARG " + curusage.get(t1).location + " " + t1);
    }
    isv0used = false;
    isv1used = false;
    return _ret;
 }

 /**
  * f0 -> "MOVE"
  * f1 -> Temp()
  * f2 -> Exp()
  */
 public String visit(MoveStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    String t = n.f1.accept(this, argu);
    movelookup = true;
    n.f2.accept(this, t);
    movelookup = false;
    isv0used = false;
    isv1used = false;
    return _ret;
 }

 /**
  * f0 -> "PRINT"
  * f1 -> SimpleExp()
  */
 public String visit(PrintStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    _ret = n.f1.accept(this, argu);
    if(_ret.startsWith("TEMP ")) {
        _ret = getreg(_ret, false);
    }
    codeout("PRINT " + _ret);
    return _ret;
 }

 /**
  * f0 -> Call()
  *       | HAllocate()
  *       | BinOp()
  *       | SimpleExp()
  */
 public String visit(Exp n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    isv0used = false;
    isv1used = false;
    return _ret;
 }

 /**
  * f0 -> "BEGIN"
  * f1 -> StmtList()
  * f2 -> "RETURN"
  * f3 -> SimpleExp()
  * f4 -> "END"
  */
 public String visit(StmtExp n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    _ret = n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    if(isv0used) {
        LiveInterval l0 = curusage.get("v0");
        codeout("ASTORE SPILLEDARG " + l0.location + " v0");
        isv0used = false;
    }
    if(_ret.startsWith("TEMP "))
    _ret = getreg(_ret, false);
    codeout("MOVE v0 " + _ret);
    return _ret;
 }

 /**
  * f0 -> "CALL"
  * f1 -> SimpleExp()
  * f2 -> "("
  * f3 -> ( Temp() )*
  * f4 -> ")"
  */
 public String visit(Call n, String argu) {
    String dest = argu;
    argu = null;
    String _ret=null;
    callersave();
    // if(isv0used) {
    //     codeout("ASTORE SPILLEDARG " + curusage.get("v0").location + " v0");
    // }
    n.f0.accept(this, argu);
    Boolean save = movelookup;
    movelookup = false;
    String fn = n.f1.accept(this, argu);
    movelookup = save;
    n.f2.accept(this, argu);
    calllookup = true;
    currarg = 0;
    n.f3.accept(this, argu);
    calllookup = false;
    n.f4.accept(this, argu);
    if(fn.startsWith("TEMP ")) {
        fn = getreg(fn, false);
    }
    codeout("CALL " + fn);
    callerrestore();
    dest = getreg(dest, true);
    codeout("MOVE " + dest + " v0");
    // if(isv0used) {
    //     // Caution! very very risky, be really sure to do this
    //     codeout("ALOAD v0 SPILLEDARG " + curusage.get("v0").location);
    // }
    if(dest.equals("v0") || dest.equals("v1")) {
        codeout("ASTORE SPILLEDARG " + curusage.get(dest).location + " " + dest);
    }
    // if(dest.equals("v0") || dest.equals("v1") || dest.equals("t9")) {
    //     codeout("ASTORE SPILLEDARG " + curusage.get(dest).location + " " + dest);
    // }
    return _ret;
 }

 /**
  * f0 -> "HALLOCATE"
  * f1 -> SimpleExp()
  */
 public String visit(HAllocate n, String argu) {
    String dest = argu;
    argu = null;
    String _ret=null;
    n.f0.accept(this, argu);
    Boolean save = movelookup;
    movelookup = false;
    String t2 = n.f1.accept(this, argu);
    movelookup = save;
    if(t2.startsWith("TEMP ")) {
        t2 = getreg(t2, false);
    }
    dest = getreg(dest, true);
    codeout("MOVE " + dest + " HALLOCATE " + t2);
    if(dest.equals("v0") || dest.equals("v1")) {
        codeout("ASTORE SPILLEDARG " + curusage.get(dest).location + " " + dest);
    }
    // if(dest.equals("v0") || dest.equals("v1") || dest.equals("t9")) {
    //     codeout("ASTORE SPILLEDARG " + curusage.get(dest).location + " " + dest);
    // }
    return _ret;
 }

 /**
  * f0 -> Operator()
  * f1 -> Temp()
  * f2 -> SimpleExp()
  */
 public String visit(BinOp n, String argu) {
    String dest = argu;
    argu = null;
    String _ret=null;
    String binop = n.f0.accept(this, argu);
    String t = n.f1.accept(this, argu);
    Boolean save = movelookup;
    movelookup = false;
    String t2 = n.f2.accept(this, argu);
    movelookup = save;
    if(t2.startsWith("TEMP ")) {
        t2 = getreg(t2, false);
    }
    t = getreg(t, false);
    dest = getreg(dest, true);
    codeout("MOVE " + dest + " " + binop + " " + t + " " + t2);
    if(dest.equals("v0") || dest.equals("v1")) {
        codeout("ASTORE SPILLEDARG " + curusage.get(dest).location + " " + dest);
    }
    // if(dest.equals("v0") || dest.equals("v1") || dest.equals("t9")) {
    //     codeout("ASTORE SPILLEDARG " + curusage.get(dest).location + " " + dest);
    // }
    return _ret;
 }

 /**
  * f0 -> "LE"
  *       | "NE"
  *       | "PLUS"
  *       | "MINUS"
  *       | "TIMES"
  *       | "DIV"
  */
 public String visit(Operator n, String argu) {
    String _ret=null;
    _ret = n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> Temp()
  *       | IntegerLiteral()
  *       | Label()
  */
 public String visit(SimpleExp n, String argu) {
    String _ret=null;
    labellookup = true;
    _ret = n.f0.accept(this, argu);
    labellookup = false;
    if(movelookup) {
        String dest = argu;
        if(_ret.startsWith("TEMP "))
        _ret = getreg(_ret, false);
        dest = getreg(dest, true);
        if(!_ret.equals(dest))
        codeout("MOVE " + dest + " " + _ret);
        if(dest.equals("v0") || dest.equals("v1")) {
            codeout("ASTORE SPILLEDARG " + curusage.get(dest).location + " " + dest);
        }
        // if(dest.equals("v0") || dest.equals("v1") || dest.equals("t9")) {
        //     codeout("ASTORE SPILLEDARG " + curusage.get(dest).location + " " + dest);
        // }
    }
    return _ret;
 }

 /**
  * f0 -> "TEMP"
  * f1 -> IntegerLiteral()
  */
 public String visit(Temp n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    _ret = "TEMP "+n.f1.accept(this, argu);
    if(calllookup) {
        _ret = getreg(_ret, false);
        if(currarg < 4) {
            codeout("MOVE a" + currarg + " " + _ret);
        } else {
            codeout("PASSARG " + (currarg-3) + " " + _ret);
        }
        currarg++;
        isv0used = false;
        isv1used = false;
    }
    return _ret;
 }

 /**
  * f0 -> <INTEGER_LITERAL>
  */
 public String visit(IntegerLiteral n, String argu) {
    String _ret=null;
    _ret = n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> <IDENTIFIER>
  */
 public String visit(Label n, String argu) {
    String _ret=null;
    _ret = n.f0.accept(this, argu);
    if(!labellookup) {
        // curStatement = new Statement();
        // curStatement.fullstmt = _ret;
        // curStatement.opcode = "LABEL";
        // curStatement.addr1 = _ret;
        // try{stmts.add(curStatement);}
        // catch (Exception e) {
        //     // a little too extra, don't you think??
        //     e.printStackTrace();
        //     stmts = new ArrayList<>();
        //     stmts.add(curStatement);
        // }
        codeout(_ret);
    }
    return _ret;
 }
}
