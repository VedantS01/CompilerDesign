class Heritage {
    public static void main(String[] args) {
        System.out.println(new V().run());
    }
}

class V extends Ter{
    public int run() {
        Par p;
        Acc a;
        Chi c;
        Ter t;
        int d1;
        int d2;
        int d3;
        int d4;
        p = new Par();
        a = new Acc();
        c = new Chi();
        t = new Ter();
        c = p.inheri(t);
        d2 = 10;
        // d1 = a.inheri(d2);
        d3 = c.inheri(d1);
        d4 = t.inheri(d3);
        c = c.Chi(t);
        return 0;
    }
}

class Par {
    public Chi inheri(Ter c) {
        Chi c2;
        int dump;
        c2 = c;
        dump = c.inheri((10+0));
        return c2;
    }
}

class Acc extends Par {
    // public int inheri(int b) {
    //     return b;
    // }
}

class Chi {
    Chi c;
    public Chi Chi(Chi c1) {
        c = c1;
        return c;
    }
    public int inheri(int b) {
        return b;
    }
}

class Ter extends Chi{
    public int inheri(int b) {
        return b;
    }
}
