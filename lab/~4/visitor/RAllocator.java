package visitor;
import java.util.ArrayList;
import java.util.HashMap;
import java.io.ObjectInput;
import java.text.ParseException;
import java.util.*;

import syntaxtree.*;

public class RAllocator extends GJDepthFirst<String, String> {
   private Boolean debug = false;
    
   public ArrayList<Proc> procs = new ArrayList<>();
   private ArrayList<Statement> stmts;
   private Proc curProc;
   private Statement curStatement;

   private Boolean labellookup = false;
   private Boolean movelookup = false;
   private Boolean callargslookup = false;

   public void error() {
      System.err.println("// ERROR ");
      System.exit(0);
   }
   public void error(String line) {
      System.err.println("// ERROR: AT LINE " + line);
      System.exit(0);
   }

   public void printIRback() {
      for (Proc p : procs) {
         System.out.println(p.label + " [" + p.argc + "]");
         for (Statement line : p.allstmts) {
               System.out.println(line.fullstmt);
         }
         System.out.println("END");
      }
   }
   public void printallcfgs() {
      for (Proc proc : procs) {
         System.out.println("++PROC: " + proc.label);
         // printcfg(proc);
         // printcfgdefuse(proc);
         // printcfglive(proc);
         // printliveness(proc);
         printalloc(proc);
      }
   }
   public void printcfg(Proc proc) {
      for (Statement statement : proc.allstmts) {
         System.out.println("----Line:" + statement.lno + " : " + statement.fullstmt + " :: PRED=" + statement.pred.toString() + " ; SUCC=" + statement.succ.toString());
      }
   }
   public void printcfgdefuse(Proc proc) {
      for (Statement statement : proc.allstmts) {
         System.out.println("----Line:" + statement.lno + " : " + statement.fullstmt + " :: DEF=" + statement.def.toString() + " ; USE=" + statement.use.toString());
      }
   }
   public void printcfglive(Proc proc) {
      for (Statement statement : proc.allstmts) {
         System.out.println("----Line:" + statement.lno + " : " + statement.fullstmt + " :: IN=" + statement.livein.toString() + " ; OUT=" + statement.liveout.toString());
      }
   }
   public void printalloc(Proc proc) {
      for (LiveInterval l : proc.liveintervals) {
         if(!l.isstacked)
         System.out.println("----T: " + l.label + " is allocated " + l.register);
         else
         System.out.println("----T: " + l.label + " is spilled at loc " + l.location);
      }
   }
   public void printliveness(Proc proc) {
      for (LiveInterval l : proc.liveintervals) {
         System.out.println("---Interval of T: " + l.label + " starts at lno " + l.start + " and ends at lno " + l.end);
      }
   }

   public void buildallcfgs() {
      for (Proc proc : procs) {
         buildstatementcfg(proc);
         setdefanduse(proc);
         livenessanalysis(proc);
         genliveintervals(proc);
      }
   }

   public void allocate() {
      Integer totalspilled = 0;
      Integer totalnotspilled = 0;
      for (Proc proc : procs) {
         ArrayList<LiveInterval> liveIntervals = proc.liveintervals;
         ArrayList<LiveInterval> args = new ArrayList<LiveInterval>();
		   for(int i = 0; i < liveIntervals.size(); i++){
			   if(Integer.parseInt(liveIntervals.get(i).label.substring(5, liveIntervals.get(i).label.length())) < proc.argc)
				   args.add(liveIntervals.get(i));
		   }
		   
		   int stackLoc = 0;
		   ArrayList<LiveInterval> argsFinal = new ArrayList<LiveInterval>();
		   for(LiveInterval l: args){
            String t = l.label;
            Integer index = Integer.parseInt(t.substring(5, t.length()));
			   if(index <= 3){
				   l.argregister = "a" + index;
				   argsFinal.add(l);
			   }
			   else{
				   l.isstacked = true;
				   l.location = Integer.toString(index-4);
				   // stackLoc++;
			   }
		   }
         if(proc.argc > 4) {
            stackLoc += (proc.argc - 4);
         }
		   args.removeAll(argsFinal);
		   liveIntervals.removeAll(args);
		   
		   int finalspillcount = linearscan(proc, stackLoc);
		   liveIntervals.addAll(args);
		   
		   proc.spillcount = finalspillcount;
		   proc.args = argsFinal;
         
         // what to do??
         proc.stackspace = proc.spillcount;

         totalnotspilled += proc.notspilled;
         totalspilled += proc.spillcount;
      }
      if(debug) {
         System.err.println("// SPILLED = " + totalspilled + " ; NOTSPILLED = " + totalnotspilled);
      }
   }

   public void buildstatementcfg(Proc proc) {
      // version 1: each statement is a basic block*
      // allocate line numbers and find local labels
      HashMap<String,Statement> labelline = new HashMap<>();
      Integer n = 1;
      for (Statement statement : proc.allstmts) {
         statement.lno = n++;
         if(statement.opcode.equals("LABEL")) {
            labelline.put(statement.addr1, statement);
         }
         statement.whichproc = proc;
      }
      // form the blocks, eh? wait. no need to bother structure. we will add more to the Statement itself.
      // set up cfg, two NOOP statements, one before, one at the end.
      Statement s = new Statement();
      s.opcode = "ENTRY";
      s.fullstmt = "";
      s.lno = 0;
      proc.allstmts.add(0, s);
      Statement s1 = new Statement();
      s1.opcode = "EXIT";
      s1.fullstmt = "";
      s1.lno = n;
      proc.allstmts.add(s1);
      Statement p = null; // previous line
      for (Statement statement : proc.allstmts) {
         switch (statement.opcode) {
            case "ENTRY":
               p = statement;
               break;
            case "LABEL":
               if(p != null) {
                  statement.pred.add(p);
                  p.succ.add(statement);
               }
               p = statement;
               break;
            case "CJUMP":
               if(p != null) {
                  statement.pred.add(p);
                  p.succ.add(statement);
               }
               Statement jumpat = labelline.get(statement.addr2);
               if(jumpat == null) {
                  error("In builcstatementcfg: line 167: trying to get label line of " + statement.addr2);
               }
               statement.succ.add(jumpat);
               jumpat.pred.add(statement);
               p = statement;
               break;
            case "JUMP":
               if(p != null) {
                  statement.pred.add(p);
                  p.succ.add(statement);
               }
               Statement jumpat1 = labelline.get(statement.addr1);
               if(jumpat1 == null) {
                  error("In builcstatementcfg: line 119");
               }
               statement.succ.add(jumpat1);
               jumpat1.pred.add(statement);
               p = null;
               break;
            default:
               if(p != null) {
                  statement.pred.add(p);
                  p.succ.add(statement);
               }
               p = statement;
               break;
         }
      }
   }

   public void setdefanduse(Proc proc) {
      for (Statement statement : proc.allstmts) {
         switch (statement.opcode) {
            case "ENTRY":
            case "EXIT":
            case "LABEL":
            case "NOOP":
            case "ERROR":
            case "JUMP":
               break;
            case "MOVE":
               statement.def.add(statement.addr1);
               Expression e = statement.moveexp;
               if(e == null) {
                  error("MOVEEXPR NULL AT LINE 150");
               }
               for (String s : e.addrs) {
                  if(s.startsWith("TEMP ")) {
                     // its a temporary! add it in use
                     statement.use.add(s);
                  }
               }
               break;
            case "CJUMP":
               statement.use.add(statement.addr1);
               break;
            case "HSTORE":
               statement.use.add(statement.addr1);
               statement.use.add(statement.addr3);
               break;
            case "HLOAD":
               statement.def.add(statement.addr1);
               statement.use.add(statement.addr2);
               break;
            case "PRINT":
               if(statement.addr1.startsWith("TEMP ")) {
                  statement.use.add(statement.addr1);
               }
               break;
            case "RETURN":
               if(statement.addr1.startsWith("TEMP ")) {
                  statement.use.add(statement.addr1);
               }
               break;
            default:
               break;
         }
      }
   }

   public void livenessanalysis(Proc proc) {
      Boolean cont = true;
      do {
         cont = false;
         for (Statement statement : proc.allstmts) {
            

            // for livein
            HashSet<String> out_ = new HashSet<>();
            HashSet<String> in_ = new HashSet<>();
            HashSet<String> temp = new HashSet<>();
            out_.addAll(statement.liveout);
            in_.addAll(statement.livein);
            temp.addAll(statement.liveout);
            temp.removeAll(statement.def);
            temp.addAll(statement.use);
            statement.livein.clear();
            statement.livein.addAll(temp);
            statement.liveout.clear();
            // for liveout
            for (Statement s : statement.succ) {
               statement.liveout.addAll(s.livein);
            }
            // check updation
            if(!in_.equals(statement.livein) || !out_.equals(statement.liveout)) {
               cont = true;
            }

            // HashSet<String> temp_out = new HashSet<String>();
				//    for(Statement s: statement.succ)
				// 	   temp_out.addAll(s.livein);
				//    if(! statement.liveout.containsAll(temp_out)){
				// 	   cont = true;
				// 	   statement.liveout = temp_out;
				//    }
				   
				//    //Computing in
				//    HashSet<String> temp_in = new HashSet<String>();
				//    temp_in.addAll(statement.liveout);
				//    temp_in.removeAll(statement.def);
				//    temp_in.addAll(statement.use);
				//    if(! statement.livein.containsAll(temp_in)){
				// 	   cont = true;
				// 	   statement.livein = temp_in;
				//    }
         }
      } while(cont);
      // for (int i = proc.allstmts.size() - 1; i >= 0; i--) {
      //    Statement statement = proc.allstmts.get(i);

      // }
   }

   public void genliveintervals(Proc proc) {
      HashMap<String,Integer> start = new HashMap<>();
      HashMap<String,Integer> end = new HashMap<>();
      for (Statement statement : proc.allstmts) {
         HashSet<String> live = new HashSet<>();
         live.addAll(statement.livein);
         live.addAll(statement.def);
         for (String string : live) {
            if(start.containsKey(string)) {
               // update the interval Interval. increase it.
               if(start.get(string) > statement.lno) {
                  start.put(string, statement.lno);
               }
               if(end.get(string) < statement.lno){
                  end.put(string, statement.lno);
               }
            } else {
               // put initial values
               start.put(string, statement.lno);
               end.put(string, statement.lno);
            }
         }
      }

      // set up live intervals in the proc structure
      proc.liveintervals = new ArrayList<>();
	   for(String s: start.keySet()){
         LiveInterval temp = new LiveInterval();
		   temp.start = start.get(s);
		   temp.end = end.get(s);
		   temp.label = s;
         temp.whichproc = proc;
         proc.liveintervals.add(temp);
	   }
   }

   private void spillatinterval(ArrayList<LiveInterval> active, LiveInterval l, int newstacklocation) {
      active.sort(new LiveInterval.ComparatorByEnd());
      LiveInterval last = active.get(active.size()-1);
      if(last.end > l.end) {
         l.register = last.register;
         last.location = ""+newstacklocation;
         last.isstacked = true;
         active.remove(last);
         active.add(l);
         active.sort(new LiveInterval.ComparatorByEnd());
      } else {
         l.location = ""+newstacklocation;
         l.isstacked = true;
      }
   }

   private void expireoldintervals(ArrayList<String> freeregisters, LiveInterval l, ArrayList<LiveInterval> active) {
      active.sort(new LiveInterval.ComparatorByEnd());
      for (int i = 0; i < active.size(); i++) {
         LiveInterval liveInterval = active.get(i);
         if(liveInterval.end > l.start) return;
         active.remove(i--);
         freeregisters.add(0, liveInterval.register);
      }
   }

   public int linearscan(Proc proc, int stackbegin) {
      ArrayList<LiveInterval> active = new ArrayList<>();
      ArrayList<String> freeregisters = new ArrayList<>();
      Integer notspilled = 0;
      int stackloc = stackbegin;
      for (int i = 0; i < 8; i++) freeregisters.add("s"+i);
      for (int i = 0; i < 10; i++) freeregisters.add("t"+i);
      proc.liveintervals.sort(new LiveInterval.ComparatorByStart());
      for (LiveInterval liveInterval : proc.liveintervals) {
         expireoldintervals(freeregisters, liveInterval, active);
         if(active.size() >= 18) {
            spillatinterval(active, liveInterval, stackloc++);
         } else {
            liveInterval.register = freeregisters.get(0);
            freeregisters.remove(0);
            active.add(liveInterval);
            proc.usedregisters.add(liveInterval.register);
            notspilled++;
         }
      }

      // if(debug) {
      //    System.err.println("// SPILLED = " + (stackloc - stackbegin) + "; NOTSPILLED = " + notspilled);
      // }
      proc.notspilled = notspilled;
      return stackloc;
   }

    // auto generated
    public String visit(NodeToken n, String argu) { return n.tokenImage; }

   //
   // User-generated visitor methods below
   //

   /**
    * f0 -> "MAIN"
    * f1 -> StmtList()
    * f2 -> "END"
    * f3 -> ( Procedure() )*
    * f4 -> <EOF>
    */
   public String visit(Goal n, String argu) {
    String _ret=null;
    curProc = new Proc();
    curProc.label = "MAIN";
    curProc.argc = 0;
    stmts = new ArrayList<>();
    curStatement = new Statement();
    procs.add(curProc);
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    curProc.allstmts.addAll(stmts);
    curProc = null;
    stmts = null;
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);

    buildallcfgs();
    allocate();
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
    String name, argc;
    labellookup = true;
    name = n.f0.accept(this, argu);
    labellookup = false;
    n.f1.accept(this, argu);
    argc = n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    curProc = new Proc();
    curProc.label = name;
    curProc.argc = Integer.parseInt(argc);
    stmts = new ArrayList<>();
    curStatement = new Statement();
    procs.add(curProc);

    n.f4.accept(this, argu);

    curProc.allstmts.addAll(stmts);
    curProc = null;
    stmts = null;
    return null;
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
    return _ret;
 }

 /**
  * f0 -> "NOOP"
  */
 public String visit(NoOpStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    curStatement = new Statement();
    curStatement.fullstmt = "NOOP";
    curStatement.opcode = "NOOP";
    stmts.add(curStatement);
    return _ret;
 }

 /**
  * f0 -> "ERROR"
  */
 public String visit(ErrorStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    curStatement = new Statement();
    curStatement.fullstmt = "ERROR";
    curStatement.opcode = "ERROR";
    stmts.add(curStatement);
    return _ret;
 }

 /**
  * f0 -> "CJUMP"
  * f1 -> Temp()
  * f2 -> Label()
  */
 public String visit(CJumpStmt n, String argu) {
    String ad1, ad2;
    n.f0.accept(this, argu);
    ad1 = n.f1.accept(this, argu);
    labellookup = true;
    ad2 = n.f2.accept(this, argu);
    labellookup = false;

    curStatement = new Statement();
    curStatement.opcode = "CJUMP";
    curStatement.addr1 = ad1;
    curStatement.addr2 = ad2;
    curStatement.fullstmt = "CJUMP " + ad1 + " " + ad2;
    stmts.add(curStatement);
    return null;
 }

 /**
  * f0 -> "JUMP"
  * f1 -> Label()
  */
 public String visit(JumpStmt n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    labellookup = true;
    _ret = n.f1.accept(this, argu);
    labellookup = false;

    curStatement = new Statement();
    curStatement.opcode = "JUMP";
    curStatement.addr1 = _ret;
    curStatement.fullstmt = "JUMP " + _ret;
    stmts.add(curStatement);
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
    String ad1, ad2, ad3;
    n.f0.accept(this, argu);
    ad1 = n.f1.accept(this, argu);
    ad2 = n.f2.accept(this, argu);
    ad3 = n.f3.accept(this, argu);

    curStatement = new Statement();
    curStatement.opcode = "HSTORE";
    curStatement.addr1 = ad1;
    curStatement.addr2 = ad2;
    curStatement.addr3 = ad3;
    curStatement.fullstmt = "HSTORE " + ad1 + " " + ad2 + " " + ad3;
    stmts.add(curStatement);
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
   String ad1, ad2, ad3;
   n.f0.accept(this, argu);
   ad1 = n.f1.accept(this, argu);
   ad2 = n.f2.accept(this, argu);
   ad3 = n.f3.accept(this, argu);

   curStatement = new Statement();
   curStatement.opcode = "HLOAD";
   curStatement.addr1 = ad1;
   curStatement.addr2 = ad2;
   curStatement.addr3 = ad3;
   curStatement.fullstmt = "HLOAD " + ad1 + " " + ad2 + " " + ad3;
   stmts.add(curStatement);
   return _ret;
}

 /**
  * f0 -> "MOVE"
  * f1 -> Temp()
  * f2 -> Exp()
  */
public String visit(MoveStmt n, String argu) {
   String _ret=null;
   String ad1, ad2;
   n.f0.accept(this, argu);
   ad1 = n.f1.accept(this, argu);

   curStatement = new Statement();
   curStatement.opcode = "MOVE";
   curStatement.addr1 = ad1;
   ad2 = n.f2.accept(this, argu);
   if(ad2 == "") {
      ad2 = curStatement.moveexp.fullexpr;
   }
   curStatement.fullstmt = "MOVE " + ad1 + " " + ad2;
   stmts.add(curStatement);
   return _ret;
}

 /**
  * f0 -> "PRINT"
  * f1 -> SimpleExp()
  */
public String visit(PrintStmt n, String argu) {
   String _ret=null;
   String ad1;
   n.f0.accept(this, argu);
   ad1 = n.f1.accept(this, argu);

   curStatement = new Statement();
   curStatement.opcode = "PRINT";
   curStatement.addr1 = ad1;
   curStatement.fullstmt = "PRINT " + ad1;
   stmts.add(curStatement);
   return _ret;
}

 /**
  * f0 -> Call()
  *       | HAllocate()
  *       | BinOp()
  *       | SimpleExp()
  */
 public String visit(Exp n, String argu) {
    String _ret="";
    movelookup = true;
    _ret = n.f0.accept(this, argu);
    movelookup = false;
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
   String ad1;
   n.f0.accept(this, argu);
   n.f1.accept(this, argu);
   n.f2.accept(this, argu);
   ad1 = n.f3.accept(this, argu);
   n.f4.accept(this, argu);

   curStatement = new Statement();
   curStatement.opcode = "RETURN";
   curStatement.addr1 = ad1;
   curStatement.fullstmt = "RETURN " + ad1;
   stmts.add(curStatement);
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
   String _ret="";
   curStatement.moveexp = new Expression();
   curStatement.moveexp.opcode = "CALL";
   n.f0.accept(this, argu);
   Boolean save = movelookup;
   movelookup = false;
   _ret = n.f1.accept(this, argu);
   movelookup = save;
   curStatement.moveexp.addrs.add(_ret);
   n.f2.accept(this, argu);
   callargslookup = true;
   n.f3.accept(this, argu);
   callargslookup = false;
   Integer numargs = curStatement.moveexp.addrs.size() - 1;
   if(curProc.maxcallargs < numargs) {
      curProc.maxcallargs = numargs;
   }
   n.f4.accept(this, argu);

   curStatement.moveexp.fullexpr = "CALL " + _ret + " ( " ;
   for (int i = 1; i < curStatement.moveexp.addrs.size(); i++) {
   curStatement.moveexp.fullexpr += curStatement.moveexp.addrs.get(i).toString() + " ";
   }
   curStatement.moveexp.fullexpr += ")";
   return curStatement.moveexp.fullexpr;
}

/**
* f0 -> "HALLOCATE"
* f1 -> SimpleExp()
*/
public String visit(HAllocate n, String argu) {
   String _ret="";
   curStatement.moveexp = new Expression();
   curStatement.moveexp.opcode = "HALLOCATE";
   n.f0.accept(this, argu);
   Boolean save = movelookup;
   movelookup = false;
   _ret = n.f1.accept(this, argu);
   movelookup = save;
   curStatement.moveexp.addrs.add(_ret);
   curStatement.moveexp.fullexpr = "HALLOCATE " + _ret;
   return curStatement.moveexp.fullexpr;
}

/**
* f0 -> Operator()
* f1 -> Temp()
* f2 -> SimpleExp()
*/
public String visit(BinOp n, String argu) {
   String _ret="";
   String binop, ad1, ad2;
   curStatement.moveexp = new Expression();
   binop = n.f0.accept(this, argu);
   curStatement.moveexp.opcode = binop;
   ad1 = n.f1.accept(this, argu);
   Boolean save = movelookup;
   movelookup = false;
   ad2 = n.f2.accept(this, argu);
   movelookup = save;
   curStatement.moveexp.addrs.add(ad1);
   curStatement.moveexp.addrs.add(ad2);
   curStatement.moveexp.fullexpr = binop + " " + ad1 + " " + ad2;
   return binop + " " + ad1 + " " + ad2;
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
      curStatement.moveexp = new Expression();
      curStatement.moveexp.opcode = "SIMPLEEXPR";
      curStatement.moveexp.addrs.add(_ret);
      curStatement.moveexp.fullexpr = _ret;
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
    _ret = "TEMP " + n.f1.accept(this, argu);
    if(callargslookup) {
       curStatement.moveexp.addrs.add(_ret);
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
        curStatement = new Statement();
        curStatement.fullstmt = _ret;
        curStatement.opcode = "LABEL";
        curStatement.addr1 = _ret;
        try{stmts.add(curStatement);}
        catch (Exception e) {
            // a little too extra, don't you think??
            e.printStackTrace();
            stmts = new ArrayList<>();
            stmts.add(curStatement);
        }
    }
    return _ret;
 }
}
