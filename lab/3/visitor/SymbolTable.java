package visitor;

import java.util.ArrayList;

public class SymbolTable {
    public ArrayList<Class_> classes;
    public ArrayList<Method_> allmethods;
    public ArrayList<Variable_> allvariables;
    public SymbolTable() {
        classes = new ArrayList<>();
        allmethods = new ArrayList<>();
    }
    public void print() {
        System.out.println("Classes");
        for (Class_ c : classes) {
            c.print();
        }
        System.out.println("++++++++++++++++++++++++++++++++");
    } 
    public void addClass(Class_ c) {
        if(classes == null) classes = new ArrayList<>();
        c.ownertable = this;
        classes.add(c);
    }

}


class Class_ {
    public String name;
    public ArrayList<Variable_> members;
    public ArrayList<Method_> methods;
    public Class_ parent;
    public SymbolTable ownertable;
    public Integer size;
    public Boolean isstored;
    public Class_() {
        members = new ArrayList<>();
        methods = new ArrayList<>();
        parent = null;
    }
    public Class_(String name) {
        members = new ArrayList<>();
        methods = new ArrayList<>();
        this.name = name;
        parent = null;
    }
    public void print() {
        System.out.println(name);
        System.out.println("--Variables");
        for (Variable_ variable_ : members) {
            variable_.print();
        }
        System.out.println("--Methods");
        for (Method_ m : methods) {
            m.print();
        }
    }
    public void addMethod(Method_ m) {
        if(methods == null) methods = new ArrayList<>();
        m.owner = this;
        methods.add(m);
        this.ownertable.allmethods.add(m);
    }
    public void addVariable(Variable_ v) {
        if(members == null) members = new ArrayList<>();
        v.ownerclass = this;
        v.ownermethod = null;
        members.add(v);
        this.ownertable.allvariables.add(v);
    }
}

class Type_ {
    public Boolean isclass;
    public String name;
    public Type_() {
        isclass = false;
        name = "void";
    }
}

class Variable_ {
    public String name;
    public Type_ type;
    public Integer size = 0;
    public String lexeme = null;
    public Boolean used = false;
    public Class_ ownerclass = null;
    public Method_ ownermethod = null;
    public Boolean islocal;
    public Integer offset;
    public void print() {
        System.out.println("----"+name+" : "+type.name);
    }
}

class Method_ {
    public String name;
    public Type_ rettype;
    public String access;
    public ArrayList<Variable_> formals;
    public ArrayList<Variable_> locals;
    public Class_ owner;
    public Integer offset;
    public Method_() {
        formals = new ArrayList<>();
        locals = new ArrayList<>();
    }
    public void print() {
        System.out.println("----"+name+" : "+rettype.name);
        System.out.println("------Formals");
        for (Variable_ var : formals) {
            System.out.print("---------");
            var.print();
        }
        System.out.println("------Locals");
        for (Variable_ var : locals) {
            System.out.print("---------");
            var.print();
        }
    }

    public void addFormal(String nam, String type) {
        if(formals == null) formals = new ArrayList<>();
        Type_ t = new Type_();
        if(type == "String[]" || type == "int" || type == "int[]" || type == "boolean") {
            t.isclass = false;
        } else {
            t.isclass = true;
        }
        t.name = type;
        Variable_ v = new Variable_();
        v.name = nam;
        v.type = t;
        v.islocal = false;
        v.ownermethod = this;
        v.ownerclass = null;
        formals.add(v);
        this.owner.ownertable.allvariables.add(v);
    }

    public void addFormal(Variable_ v) {
        if(formals == null) formals = new ArrayList<>();
        v.islocal = false;
        v.ownermethod = this;
        v.ownerclass = null;
        formals.add(v);
        this.owner.ownertable.allvariables.add(v);
    }

    public void addLocal(Variable_ v) {
        if(locals == null) locals = new ArrayList<>();
        v.islocal = true;
        v.ownermethod = this;
        v.ownerclass = null;
        locals.add(v);
        this.owner.ownertable.allvariables.add(v);
    }
}