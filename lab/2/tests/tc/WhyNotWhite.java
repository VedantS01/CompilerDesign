class WhyNotWhite {
    //inline comment doesn't bother
    public static void main(String[] args) {
        System.out.println(new A().run(new C()));
    }    
}

class A extends C{
    Color what;
    public int run(C q) {
        Color randColor;
        int dump;
        randColor = new Color();
        dump= q.assign(randColor);
        return q.getval();
    }
}

class C {
    int c;
    Color Mcolor;
    public int getval() {
        return c;
    }

    protected int assign(Color _color) {
        int t;
        Mcolor = _color;
        t = new RandomInt().RandomInt();
        t = Mcolor.accept(t, ((true)));
        return 0;
    }

}

class Color {
    int colorid;
    boolean isRGB;

    public int accept(int _colorid, boolean _isRGB) {
        colorid = _colorid;
        isRGB = _isRGB;
        return 0;
    }
}

class RandomInt {
    int Mr;
    public int RandomInt() {
        Mr = ((Mr + 1)*(Mr + 1))/((Mr * Mr)+ (2*Mr));
        return Mr;
    }
}