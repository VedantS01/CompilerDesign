package visitor;
import java.util.*;

import syntaxtree.*;

public class MiniJavaTypeChecker extends GJNoArguDepthFirst<String> implements GJNoArguVisitor<String>{
    // Following class data members essentially represent the symbol table as a whole
    
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
    private HashMap<String,String> vars; //maintains symbol table
    private HashMap<String,ArrayList<String>> fnargs; //maintains signature of a function
    private HashMap<String,String> inheritance; //maintain inheritance information

    //helpers
    public boolean typecheck = false; //when typecheck is false, it builds symbol table, and when it is true, it type checks
    boolean idastype = false; //when an identifier is parsed as type, this is set, else reset
    ArrayList<String> tempArgTypes = new ArrayList<>(); //for recording fn arg types

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
        inheritance = new HashMap<String, String>();
        typecheck = false;
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

    /**
     * add parameter type list of a function
     * @param fullMethod
     * @param argTypes
     */
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
        System.out.println(inheritance.toString());
    }

    /**
     * Associate child class with a parent
     * @param child
     * @param parent
     */
    public void addParent(String child, String parent) {
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
    public String lookupname(String name) {
        ArrayList<String> lookupscopes = new ArrayList<>();
        String str = "";
        int size = currentScopeStack.size();
        for(int i = 0; i < size; i++) {
            str += currentScopeStack.get(i) + "::";
            lookupscopes.add(str);
        }
        for (int i = size-1; i >= 0; i--) {
            String fullname = lookupscopes.get(i)+name;
            if(vars.containsKey(fullname)) {
                return vars.get(fullname);
            }
        }
        // System.out.println("Error: lookup error: "+name);
        error();
        return null;
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
        startScope("global");
        String _ret=null;
        String mClass = n.f0.accept(this);
        if(!typecheck) {
            addVariable(mClass, "MainClass");
        }
        n.f1.accept(this);
        n.f2.accept(this);
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
            addFnArgs(pscope+"main()", tempArgTypes);
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
            addParent(classname, parent);
        }
        n.f4.accept(this);
        startScope(classname);
        n.f5.accept(this);
        n.f6.accept(this);
        n.f7.accept(this);
        endScope();
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
        //     if(lookupname(type) != "class") {
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
     public String visit(MethodDeclaration n) {
        String _ret=null;
        n.f0.accept(this);
        String rettype = n.f1.accept(this);
        // if(typecheck && idastype) {
        //     if(lookupname(rettype) != "class") {
        //         // error();
        //     }
        // }
        // idastype = false;
        String fnname = n.f2.accept(this);
        if(!typecheck) {
            addVariable(fnname+"()", rettype);
        }
        String pscope = getScope();
        startScope(fnname+"()");
        n.f3.accept(this);
        tempArgTypes.clear();
        n.f4.accept(this);
        if(!typecheck) {
            addFnArgs(pscope+fnname+"()", tempArgTypes);
        }
        tempArgTypes.clear();
        n.f5.accept(this);
        n.f6.accept(this);
        n.f7.accept(this);
        n.f8.accept(this);
        n.f9.accept(this);
        n.f10.accept(this);
        n.f11.accept(this);
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
        //     if(lookupname(type) != "class") {
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
            if(lookupname(_ret) != "class") {
                error();
            }
        }
        idastype = false;
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
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
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
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
        n.f3.accept(this);
        n.f4.accept(this);
        n.f5.accept(this);
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
        n.f2.accept(this);
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
        n.f2.accept(this);
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
        n.f2.accept(this);
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
        n.f2.accept(this);
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
        n.f0.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "&&"
      * f2 -> PrimaryExpression()
      */
     public String visit(AndExpression n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "||"
      * f2 -> PrimaryExpression()
      */
     public String visit(OrExpression n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "<="
      * f2 -> PrimaryExpression()
      */
     public String visit(CompareExpression n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> PrimaryExpression()
      * f1 -> "!="
      * f2 -> PrimaryExpression()
      */
     public String visit(neqExpression n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
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
            switch(t1){
                case "boolean":
                case "String[]":
                case "int[]":
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
            switch(t1){
                case "boolean":
                case "String[]":
                case "int[]":
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
            switch(t1){
                case "boolean":
                case "String[]":
                case "int[]":
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
            switch(t1){
                case "boolean":
                case "String[]":
                case "int[]":
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
        n.f1.accept(this);
        String it = n.f2.accept(this);
        if(typecheck) {
            if(it != "int") error();
        }
        n.f3.accept(this);
        if(typecheck) {
            return elem+"[]";
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
            if(!elem.endsWith("[]")) error();
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
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
        n.f3.accept(this);
        n.f4.accept(this);
        n.f5.accept(this);
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
        n.f0.accept(this);
        n.f1.accept(this);
        n.f2.accept(this);
        n.f3.accept(this);
        n.f4.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> Expression()
      * f1 -> ( ExpressionRest() )*
      */
     public String visit(ExpressionList n) {
        String _ret=null;
        n.f0.accept(this);
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
        n.f1.accept(this);
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
                _ret = lookupname(_ret);
            }
            idastype = false;
            return _ret;
        }
        else {
            idastype = false;
            return null;
        }
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
        String _ret="this";
        n.f0.accept(this);
        return _ret;
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
        String t = n.f1.accept(this);
        if(typecheck) {
            if(lookupname(t) != "class") {
                error();
            }
        }
        n.f2.accept(this);
        n.f3.accept(this);
        return _ret;
     }
  
     /**
      * f0 -> "!"
      * f1 -> Expression()
      */
     public String visit(NotExpression n) {
        String _ret=null;
        n.f0.accept(this);
        n.f1.accept(this);
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
        n.f1.accept(this);
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