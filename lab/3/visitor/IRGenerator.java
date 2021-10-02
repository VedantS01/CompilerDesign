/**
 *  IRGenerator v1.0
 *  Author - Vedant Ashish Saboo, CS19B074
 */

package visitor;
import syntaxtree.*;
import java.util.*;

public class IRGenerator extends GJDepthFirst<AttrSynthesized, AttrInherited> implements GJVisitor<AttrSynthesized, AttrInherited>{
    
   public SyntaxTable table;
   public Integer tempcount = 0;
   public Integer labelcount = 0; 
   public IRGenerator() {
      table = new SyntaxTable();
   }

   public void printsyntaxtable() {
      table.print();
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
      AttrSynthesized _ret=null;
      n.f0.accept(this, argu);
      n.f1.accept(this, argu);
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
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    n.f6.accept(this, argu);
    n.f7.accept(this, argu);
    n.f8.accept(this, argu);
    n.f9.accept(this, argu);
    n.f10.accept(this, argu);
    n.f11.accept(this, argu);
    n.f12.accept(this, argu);
    n.f13.accept(this, argu);
    n.f14.accept(this, argu);
    n.f15.accept(this, argu);
    n.f16.accept(this, argu);
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
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
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
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
    n.f5.accept(this, argu);
    n.f6.accept(this, argu);
    n.f7.accept(this, argu);
    n.f8.accept(this, argu);
    n.f9.accept(this, argu);
    n.f10.accept(this, argu);
    n.f11.accept(this, argu);
    n.f12.accept(this, argu);
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
    n.f0.accept(this, argu);
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
 public AttrSynthesized visit(ArrayAssignmentStatement n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
  * f0 -> IfthenElseStatement()
  *       | IfthenStatement()
  */
 public AttrSynthesized visit(IfStatement n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "if"
  * f1 -> "("
  * f2 -> Expression()
  * f3 -> ")"
  * f4 -> Statement()
  */
 public AttrSynthesized visit(IfthenStatement n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    n.f3.accept(this, argu);
    n.f4.accept(this, argu);
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
 public AttrSynthesized visit(IfthenElseStatement n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(WhileStatement n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(PrintStatement n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
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
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "&&"
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(AndExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "||"
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(OrExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "<="
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(CompareExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "!="
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(neqExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(PlusExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(MinusExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(TimesExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> PrimaryExpression()
  * f1 -> "/"
  * f2 -> PrimaryExpression()
  */
 public AttrSynthesized visit(DivExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(ArrayLookup n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(ArrayLength n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(MessageSend n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(TernaryExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(ExpressionList n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
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
 public AttrSynthesized visit(PrimaryExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> <INTEGER_LITERAL>
  */
 public AttrSynthesized visit(IntegerLiteral n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "true"
  */
 public AttrSynthesized visit(TrueLiteral n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "false"
  */
 public AttrSynthesized visit(FalseLiteral n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> <IDENTIFIER>
  */
 public AttrSynthesized visit(Identifier n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "this"
  */
 public AttrSynthesized visit(ThisExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(ArrayAllocationExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(AllocationExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
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
 public AttrSynthesized visit(NotExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> "("
  * f1 -> Expression()
  * f2 -> ")"
  */
 public AttrSynthesized visit(BracketExpression n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    n.f2.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> Identifier()
  * f1 -> ( IdentifierRest() )*
  */
 public AttrSynthesized visit(IdentifierList n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    return _ret;
 }

 /**
  * f0 -> ","
  * f1 -> Identifier()
  */
 public AttrSynthesized visit(IdentifierRest n, AttrInherited argu) {
    AttrSynthesized _ret=null;
    n.f0.accept(this, argu);
    n.f1.accept(this, argu);
    return _ret;
 }
}
