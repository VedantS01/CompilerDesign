package visitor;
import syntaxtree.*;
import java.util.*;

public class MiniJavaTypeChecker extends GJDepthFirst<String, String> implements GJVisitor<String, String>{

    // Following class data members essentially represent the symbol table as a whole
    
    // divide the program in scopes, associate variables and methods to a scope

    
    // for each variable, map it to a type
    // for each method, map it to return type, and function parameters (types)
    // for each inherited class or scope, map it to its parent (maybe not for now, later)
    // for the parser, maintain a general stack for scopes like visitor > MiniJavaTypeChecker.java > MiniJavaTypeChecker
    // if needed, add counts and variables and so on
    // override each method you need in here, add new methods
    // So until next time, Sayonara

    private Stack<String> currentScopeStack;
    private HashMap<String,HashSet<String>> scopes;
    private HashMap<String,String> vars;
    private HashMap<String,ArrayList<String>> fnargs;

    //helpers
    boolean idastype = false;
    ArrayList<String> tempArgTypes = new ArrayList<>();

    /**
     * Public empty constructor
     */
    public MiniJavaTypeChecker() {
        if(currentScopeStack != null) {
            currentScopeStack.clear();
        } else {
            currentScopeStack = new Stack<String>();
        }
        if(scopes != null) {
            scopes.clear();
        } else {
            scopes = new HashMap<String,HashSet<String>>();
        }
        vars = new HashMap<String, String>();
        fnargs = new HashMap<String, ArrayList<String>>();
    }

    /**
     * stack up new scope
     **/
    public void startScope(String s) {
        currentScopeStack.add(s);
        String scope = getScope();
        if(!scopes.containsKey(scope)) {
            scopes.put(scope,new HashSet<String>());
        }
    }

    /**
     * stack out a scope
     **/
    public void endScope() {
        currentScopeStack.pop();
    }

    /**
     * get current scope
     **/
    public String getScope() {
        String str = "";
        for(String s : currentScopeStack) {
            str += s + "::";
        }
        return str;
    }

    /**
     * report error and exit
     **/
    public void error() {
        System.out.println("Type error");
        System.exit(0);
    }

    /**
     * add a variable in current scope
     **/
    public void addVariable(String var, String type) {
        String scope = getScope();
        if(scopes.get(scope).contains(var)) {
            error();
        }
        scopes.get(scope).add(var);
        vars.put(scope+var,type);
    }

    public void addFnArgs(String fullMethod, ArrayList<String> argTypes) {
        if(fnargs.containsKey(fullMethod)) {
            error();
        }
        fnargs.put(fullMethod, new ArrayList<>(argTypes));
    }

    /**
     * print the symbol table
     */
    public void printSymbolTable() {
        System.out.println("Symbol Table:");
        System.out.println(scopes.toString());
        System.out.println(vars.toString());
        System.out.println(fnargs.toString());
    }








    //overriden methods from GJDepthFirst

    @Override
    public String visit(NodeToken n, String argu) { return n.tokenImage; }

    /**
    * f0 -> MainClass()
    * f1 -> ( TypeDeclaration() )*
    * f2 -> <EOF>
    */
   public String visit(Goal n, String argu) {
    startScope("global");
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    endScope();
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
 public String visit(MainClass n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    String mainClassName = n.f1.accept(this, argu);
    if(argu.equals("build")) addVariable(mainClassName, "class");
    startScope(mainClassName);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    n.f6.accept(this, argu);
    String scope = getScope();
    if(argu.equals("build")) {
        addVariable("main()","void");
    }
    startScope("main");
    n.f7.accept(this, argu);
    n.f8.accept(this, argu);
    n.f9.accept(this, argu);
    n.f10.accept(this, argu);
    String args = n.f11.accept(this, argu);
    if(argu.equals("build")) {
        addVariable(args, "String[]");
    }
    n.f12.accept(this, argu);
    if(argu.equals("build")) {
        tempArgTypes.add("String[]");
        addFnArgs(scope+"main()",tempArgTypes);
        tempArgTypes.clear();
    }
    n.f13.accept(this, argu);
    n.f14.accept(this, argu);
    n.f15.accept(this, argu);
    endScope();
    n.f16.accept(this, argu);
    endScope();
    return _ret;
 }

 /**
  * f0 -> ClassDeclaration()
  *       | ClassExtendsDeclaration()
  */
 public String visit(TypeDeclaration n, String argu) {
    String _ret=null;
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
 public String visit(ClassDeclaration n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    String classname = n.f1.accept(this, argu);
    if(argu.equals("build")) addVariable(classname, "class");
    startScope(classname);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
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
 public String visit(ClassExtendsDeclaration n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    n.f6.accept(this, argu);
    n.f7.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> Type()
  * f1 -> Identifier()
  * f2 -> ";"
  */
 public String visit(VarDeclaration n, String argu) {
    String _ret=null;
    String type = n.f0.accept(this, argu);
    String var = n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    if(argu.equals("build")) {
        addVariable(var, type);
    }
    return _ret;
 }

 /**
  * f0 -> "public"
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
 public String visit(MethodDeclaration n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    String rettype = n.f1.accept(this, argu);
    String methodname = n.f2.accept(this, argu);
    if(argu == "build") addVariable(methodname+"()",rettype);
    String scope = getScope();
    if(argu=="build" && fnargs.containsKey(scope + methodname+"()")) {
        error();
    }
    startScope(methodname);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    if(argu.equals("build")) {
        addFnArgs(scope+methodname+"()",tempArgTypes);
    }
    tempArgTypes.clear();
    n.f6.accept(this, argu);
    n.f7.accept(this, argu);
    n.f8.accept(this, argu);
    n.f9.accept(this, argu);
    n.f10.accept(this, argu);
    n.f11.accept(this, argu);
    n.f12.accept(this, argu);
    endScope();
    return _ret;
 }

 /**
  * f0 -> FormalParameter()
  * f1 -> ( FormalParameterRest() )*
  */
 public String visit(FormalParameterList n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> Type()
  * f1 -> Identifier()
  */
 public String visit(FormalParameter n, String argu) {
    String _ret=null;
    String argType = n.f0.accept(this, argu);
    if(argu.equals("build"))tempArgTypes.add(argType);
    String var = n.f1.accept(this, argu);
    if(argu.equals("build")) {
        addVariable(var, argType);
    }
    return _ret;
 }

 /**
  * f0 -> ","
  * f1 -> FormalParameter()
  */
 public String visit(FormalParameterRest n, String argu) {
    String _ret=null;
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
 public String visit(syntaxtree.Type n, String argu) {
    String _ret=null;
    _ret = n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "int"
  * f1 -> "["
  * f2 -> "]"
  */
 public String visit(ArrayType n, String argu) {
    String _ret="int[]";
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "boolean"
  */
 public String visit(BooleanType n, String argu) {
    String _ret="boolean";
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "int"
  */
 public String visit(IntegerType n, String argu) {
    String _ret="int";
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
 public String visit(Statement n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "{"
  * f1 -> ( Statement() )*
  * f2 -> "}"
  */
 public String visit(Block n, String argu) {
    String _ret=null;
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
 public String visit(AssignmentStatement n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
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
 public String visit(ArrayAssignmentStatement n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    n.f6.accept(this, argu);
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
 public String visit(IfStatement n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    n.f6.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "while"
  * f1 -> "("
  * f2 -> Expression()
  * f3 -> ")"
  * f4 -> Statement()
  */
 public String visit(WhileStatement n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "System.out.println"
  * f1 -> "("
  * f2 -> Expression()
  * f3 -> ")"
  * f4 -> ";"
  */
 public String visit(PrintStatement n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    String type = n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> AndExpression()
  *       | CompareExpression()
  *       | PlusExpression()
  *       | MinusExpression()
  *       | TimesExpression()
  *       | ArrayLookup()
  *       | ArrayLength()
  *       | MessageSend()
  *       | TernaryExpression()
  *       | PrimaryExpression()
  */
 public String visit(Expression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "&"
  * f2 -> PrimaryExpression()
  */
 public String visit(AndExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "<"
  * f2 -> PrimaryExpression()
  */
 public String visit(CompareExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "+"
  * f2 -> PrimaryExpression()
  */
 public String visit(PlusExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "-"
  * f2 -> PrimaryExpression()
  */
 public String visit(MinusExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "*"
  * f2 -> PrimaryExpression()
  */
 public String visit(TimesExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "["
  * f2 -> PrimaryExpression()
  * f3 -> "]"
  */
 public String visit(ArrayLookup n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "."
  * f2 -> "length"
  */
 public String visit(ArrayLength n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
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
 public String visit(MessageSend n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "?"
  * f2 -> PrimaryExpression()
  * f3 -> ":"
  * f4 -> PrimaryExpression()
  */
 public String visit(TernaryExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> Expression()
  * f1 -> ( ExpressionRest() )*
  */
 public String visit(ExpressionList n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> ","
  * f1 -> Expression()
  */
 public String visit(ExpressionRest n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
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
 public String visit(PrimaryExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> <INTEGER_LITERAL>
  */
 public String visit(IntegerLiteral n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "true"
  */
 public String visit(TrueLiteral n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "false"
  */
 public String visit(FalseLiteral n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> <IDENTIFIER>
  */
 public String visit(Identifier n, String argu) {
    String _ret = null;
    _ret = n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "this"
  */
 public String visit(ThisExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "new"
  * f1 -> "int"
  * f2 -> "["
  * f3 -> Expression()
  * f4 -> "]"
  */
 public String visit(ArrayAllocationExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "new"
  * f1 -> Identifier()
  * f2 -> "("
  * f3 -> ")"
  */
 public String visit(AllocationExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "!"
  * f1 -> Expression()
  */
 public String visit(NotExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "("
  * f1 -> Expression()
  * f2 -> ")"
  */
 public String visit(BracketExpression n, String argu) {
    String _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

    
}