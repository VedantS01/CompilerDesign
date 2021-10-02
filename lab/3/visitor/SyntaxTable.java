package visitor;

import java.util.ArrayList;

public class SyntaxTable {
    public ArrayList<Class_> classes;
    public SyntaxTable() {
        classes = new ArrayList<>();
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
        classes.add(c);
    }
}


class Class_ {
    public String name;
    public ArrayList<Variable_> members;
    public ArrayList<Method_> methods;
    public Class_ father;
    public Class_() {
        members = new ArrayList<>();
        methods = new ArrayList<>();
        father = null;
    }
    public Class_(String name) {
        members = new ArrayList<>();
        methods = new ArrayList<>();
        this.name = name;
        father = null;
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
        methods.add(m);
    }
    public void addVariable(Variable_ v) {
        if(members == null) members = new ArrayList<>();
        members.add(v);
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
    public Integer size;
    public Integer tcount;   //? what was this again ?
    public void print() {
        System.out.println("----"+name+" : "+type.name);
    }
}

class Method_ {
    public String name;
    public Type_ rettype;
    public String access;
    public ArrayList<Variable_> formals;
    // ArrayList<Type_> formaltypes;
    public ArrayList<Variable_> locals;
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
        formals.add(v);
    }

    public void addFormal(Variable_ v) {
        if(formals == null) formals = new ArrayList<>();
        formals.add(v);
    }

    public void addLocal(Variable_ v) {
        if(locals == null) locals = new ArrayList<>();
        locals.add(v);
    }
}