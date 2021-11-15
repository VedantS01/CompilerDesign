package visitor;

import syntaxtree.*;

public class AssemblyGen extends GJDepthFirst<String, String> {

   private boolean labellookup = false;
   private boolean movelookup = false;
   private int argc = 0;
    

    private void labelout(String s) {
       System.out.println(s+":");
    }

    private void codeout(String s) {
       System.out.println("\t"+s);
    }

    private void error() {
       System.err.println("Error Detected.");
       System.exit(0);
    }


    private void printEpilogue() {
        System.out.println("\t.text\n"+ 
        "\t.globl _halloc\n"+ 
    "_halloc:\n"+ 
        "\tli $v0, 9\n"+ 
        "\tsyscall\n"+ 
        "\tjr $ra\n\n"+ 
    
   
        "\t.text\n"+ 
        "\t.globl _error\n"+ 
    "_error:\n"+ 
        "\tli $v0, 4\n"+
        "\tsyscall\n"+
        "\tli $v0, 10\n"+
        "\tsyscall\n\n"+
           "\t.text\n"+
        "\t.globl _print\n"+ 
   "_print:\n"+ 
        "\tli $v0, 1\n"+ 
        "\tsyscall\n"+ 
        "\tla $a0, newline\n"+ 
        "\tli $v0, 4\n"+ 
        "\tsyscall\n"+ 
        "\tjr $ra\n\n"+ 
        "\t.text\n"+ 
        "\t.globl _exitret\n"+ 
   "_exitret:\n"+ 
        "\tli $v0, 10\n"+
        "\tsyscall\n\n"+ 
        "\t.data\n"+
        "\t.align 0\n"+
   "newline: 	.asciiz \"\\n\"\n\n"+
        "\t.data\n"+
        "\t.align 0\n"+
   "error_msg:	.asciiz \" ERROR : Abnormally terminated!\\n \"");
    }


    public String visit(NodeToken n, String argu) { return n.tokenImage; }

   //
   // User-generated visitor methods below
   //

   /**
    * f0 -> "MAIN"
    * f1 -> "["
    * f2 -> IntegerLiteral()
    * f3 -> "]"
    * f4 -> "["
    * f5 -> IntegerLiteral()
    * f6 -> "]"
    * f7 -> "["
    * f8 -> IntegerLiteral()
    * f9 -> "]"
    * f10 -> StmtList()
    * f11 -> "END"
    * f12 -> ( SpillInfo() )?
    * f13 -> ( Procedure() )*
    * f14 -> <EOF>
    */
   public String visit(Goal n, String argu) {
      String _ret=null;
      codeout(".text");
      codeout(".globl main");
      labelout("main");
      String t1 = n.f2.accept(this, argu);
      argc = Integer.parseInt(t1);
      String t2 = n.f5.accept(this, argu);
      Integer ss = Integer.parseInt(t2);
      String t3 = n.f8.accept(this, argu);
      Integer mc = Integer.parseInt(t3);
      codeout("move $fp, $sp");
      codeout("sw $ra, -4($sp)");
      codeout("subu $sp, $sp, "+Integer.toString(argc<4? 4*(ss+mc+1):4*(ss-argc+5+mc)));
      argc = argc<4? 4: argc;
      n.f10.accept(this, argu);
      codeout("addu $sp, $sp, "+Integer.toString(argc<4? 4*(ss+mc+1):4*(ss-argc+5+mc)));
      codeout("lw $ra, -4($sp)");
      codeout("jal _exitret");
      n.f13.accept(this, argu);
      printEpilogue();
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
    * f4 -> "["
    * f5 -> IntegerLiteral()
    * f6 -> "]"
    * f7 -> "["
    * f8 -> IntegerLiteral()
    * f9 -> "]"
    * f10 -> StmtList()
    * f11 -> "END"
    * f12 -> ( SpillInfo() )?
    */
   public String visit(Procedure n, String argu) {
      String _ret=null;
      labellookup = true;
      String name = n.f0.accept(this, argu);
      labellookup = false;
      codeout(".text");
      codeout(".globl "+name);
      labelout(name);
      String t1 = n.f2.accept(this, argu);
      argc = Integer.parseInt(t1);
      String t2 = n.f5.accept(this, argu);
      Integer ss = Integer.parseInt(t2);
      String t3 = n.f8.accept(this, argu);
      Integer mc = Integer.parseInt(t3);
      codeout("sw $fp, -8($sp)");
      codeout("move $fp, $sp");
      codeout("sw $ra, -4($sp)");
      codeout("subu $sp, $sp, "+Integer.toString(argc<4? 4*(ss+mc+1):4*(ss-argc+5+mc)));
      argc = argc<4? 4: argc;
      n.f10.accept(this, argu);
      codeout("addu $sp, $sp, "+Integer.toString(argc<4? 4*(ss+mc+1):4*(ss-argc+5+mc)));
      codeout("lw $ra, -4($sp)");
      codeout("lw $fp, -8($sp)");
      codeout("jr $ra");
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
    *       | ALoadStmt()
    *       | AStoreStmt()
    *       | PassArgStmt()
    *       | CallStmt()
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
      codeout("nop");
      return _ret;
   }

   /**
    * f0 -> "ERROR"
    */
   public String visit(ErrorStmt n, String argu) {
      String _ret=null;
      codeout("jal _error");
      return _ret;
   }

   /**
    * f0 -> "CJUMP"
    * f1 -> Reg()
    * f2 -> Label()
    */
   public String visit(CJumpStmt n, String argu) {
      String _ret=null;
      n.f0.accept(this, argu);
      String reg = n.f1.accept(this, argu);
      labellookup = true;
      String addr = n.f2.accept(this, argu);
      labellookup = false;
      codeout("beqz "+ reg+ ", " + addr);
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
      String addr = n.f1.accept(this, argu);
      labellookup = false;
      codeout("b " + addr);
      return _ret;
   }

   /**
    * f0 -> "HSTORE"
    * f1 -> Reg()
    * f2 -> IntegerLiteral()
    * f3 -> Reg()
    */
   public String visit(HStoreStmt n, String argu) {
      String _ret=null;
      String base = n.f1.accept(this, argu);
      String offset = n.f2.accept(this, argu);
      String reg = n.f3.accept(this, argu);
      codeout("sw " + reg + ", " + offset + "(" + base + ")");
      return _ret;
   }

   /**
    * f0 -> "HLOAD"
    * f1 -> Reg()
    * f2 -> Reg()
    * f3 -> IntegerLiteral()
    */
   public String visit(HLoadStmt n, String argu) {
      String _ret=null;
      String reg = n.f1.accept(this, argu);
      String base = n.f2.accept(this, argu);
      String offset = n.f3.accept(this, argu);
      codeout("lw " + reg + ", " + offset + "(" + base + ")");
      return _ret;
   }

   /**
    * f0 -> "MOVE"
    * f1 -> Reg()
    * f2 -> Exp()
    */
   public String visit(MoveStmt n, String argu) {
      String _ret=null;
      String dest = n.f1.accept(this, argu);
      movelookup = true;
      n.f2.accept(this, dest);
      movelookup = false;
      return _ret;
   }

   /**
    * f0 -> "PRINT"
    * f1 -> SimpleExp()
    */
   public String visit(PrintStmt n, String argu) {
      String _ret=null;
      String reg = n.f1.accept(this, argu);
      if(reg.startsWith("$"))
      codeout("move $a0, " + reg);
      else
      codeout("li $a0, " + reg);
      codeout("jal _print");
      return _ret;
   }

   /**
    * f0 -> "ALOAD"
    * f1 -> Reg()
    * f2 -> SpilledArg()
    */
   public String visit(ALoadStmt n, String argu) {
      String _ret=null;
      String reg = n.f1.accept(this, argu);
      String pos = n.f2.accept(this, argu);
      Integer index = Integer.parseInt(pos);
      if(index < argc-4)
    	  _ret = Integer.toString(index*4) + "($fp)";
      else
    	  _ret = Integer.toString((index-argc+4)*-4 + -12) + "($fp)";
      codeout("lw " + reg + ", " + _ret);
      return null;
   }

   /**
    * f0 -> "ASTORE"
    * f1 -> SpilledArg()
    * f2 -> Reg()
    */
   public String visit(AStoreStmt n, String argu) {
      String _ret=null;
      String pos = n.f1.accept(this, argu);
      String reg = n.f2.accept(this, argu);
      Integer index = Integer.parseInt(pos);
      if(index < argc-4)
    	  _ret = Integer.toString(index*4) + "($fp)";
      else
    	  _ret = Integer.toString((index-argc+4)*-4 + -12) + "($fp)";
      codeout("sw " + reg + ", " + _ret);
      return null;
   }

   /**
    * f0 -> "PASSARG"
    * f1 -> IntegerLiteral()
    * f2 -> Reg()
    */
   public String visit(PassArgStmt n, String argu) {
      String _ret=null;
      String pos = n.f1.accept(this, argu);
      Integer index = (Integer.parseInt(pos) - 1)*4;
      String reg = n.f2.accept(this, argu);
      codeout("sw " + reg + ", " + index + "($sp)");
      return _ret;
   }

   /**
    * f0 -> "CALL"
    * f1 -> SimpleExp()
    */
   public String visit(CallStmt n, String argu) {
      String _ret=null;
      boolean backup = movelookup;
      movelookup = false;
      String addr = n.f1.accept(this, argu);
      movelookup = backup;
      if(addr.startsWith("$")) {
         codeout("jalr " + addr);
      } else {
         codeout("jal " + addr);
      }
      return _ret;
   }

   /**
    * f0 -> HAllocate()
    *       | BinOp()
    *       | SimpleExp()
    */
   public String visit(Exp n, String argu) {
      String _ret=null;
      n.f0.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> "HALLOCATE"
    * f1 -> SimpleExp()
    */
   public String visit(HAllocate n, String argu) {
      String _ret=null;
      n.f0.accept(this, argu);
      boolean backup = movelookup;
      movelookup = false;
      String addr = n.f1.accept(this, argu);
      movelookup = backup;
      if(addr.startsWith("$")) {
         codeout("move $a0, " + addr);
      } else {
         codeout("li $a0, "+ addr);
      }
      codeout("jal _halloc");
      codeout("move " + argu + ", $v0");
      return _ret;
   }

   /**
    * f0 -> Operator()
    * f1 -> Reg()
    * f2 -> SimpleExp()
    */
   public String visit(BinOp n, String argu) {
      String _ret=null;
      String op = n.f0.accept(this, argu);
      String oper1 = n.f1.accept(this, argu);
      boolean backup = movelookup;
      movelookup = false;
      String oper2 = n.f2.accept(this, argu);
      movelookup = backup;
      String instr = "";
      switch(op) {
         case "LE": instr = (oper2.startsWith("$"))?"sle":"slei"; break;
         case "NE": instr = (oper2.startsWith("$"))?"xor":"xori"; break;
         case "PLUS": instr = (oper2.startsWith("$"))?"add":"addi"; break;
         case "MINUS": instr = (oper2.startsWith("$"))?"sub":"subi"; break;
         case "TIMES": instr = (oper2.startsWith("$"))?"mul":"mul"; break;
         case "DIV": instr = (oper2.startsWith("$"))?"div":"divi"; break;
         default: error();
      }
      codeout(instr + " " + argu + ", " + oper1 + ", " + oper2);
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
    * f0 -> "SPILLEDARG"
    * f1 -> IntegerLiteral()
    */
   public String visit(SpilledArg n, String argu) {
      String _ret=null;
      n.f0.accept(this, argu);
      _ret = n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> Reg()
    *       | IntegerLiteral()
    *       | Label()
    */
   public String visit(SimpleExp n, String argu) {
      String _ret=null;
      labellookup = true;
      _ret = n.f0.accept(this, argu);
      labellookup = false;
      if(movelookup) {
         if(_ret.startsWith("$")) {
            // reg
            codeout("move " + argu + ", " + _ret);
         } else {
            try {
               Integer.parseInt(_ret);
               // integer literal
               codeout("li " + argu + ", " + _ret);
            } catch (Exception e) {
               // label
               codeout("la " + argu + ", " + _ret);
            }
         }
      }
      return _ret;
   }

   /**
    * f0 -> "a0"
    *       | "a1"
    *       | "a2"
    *       | "a3"
    *       | "t0"
    *       | "t1"
    *       | "t2"
    *       | "t3"
    *       | "t4"
    *       | "t5"
    *       | "t6"
    *       | "t7"
    *       | "s0"
    *       | "s1"
    *       | "s2"
    *       | "s3"
    *       | "s4"
    *       | "s5"
    *       | "s6"
    *       | "s7"
    *       | "t8"
    *       | "t9"
    *       | "v0"
    *       | "v1"
    */
   public String visit(Reg n, String argu) {
      String _ret=null;
      _ret = "$"+n.f0.accept(this, argu);
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
         labelout(_ret);
      }
      return _ret;
   }

   /**
    * f0 -> "//"
    * f1 -> SpillStatus()
    */
   public String visit(SpillInfo n, String argu) {
      String _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
      return _ret;
   }

   /**
    * f0 -> <SPILLED>
    *       | <NOTSPILLED>
    */
   public String visit(SpillStatus n, String argu) {
      String _ret=null;
      n.f0.accept(this, argu);
      return _ret;
   }
    
}
