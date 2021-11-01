
class t12 {
    public static void main(String[] args) {
        System.out.println(new DLList().go());
    }    
}

class Node {
    int val;
    Node left;
    Node right;

    public int init(int v) {
        left = this;
        right = this;
        val = v;
        return 0;
    }

    public int addl(Node l) {
        left = l;
        return 0;
    }
    public int addr(Node r) {
        right = r;
        return 0;
    }

    public boolean hasright() {
        boolean ret;
        ret = false;
        if(right != this) ret = true;
        return ret;
    }

    public int getval() {
        return val;
    }

    public Node getright() {
        return right;
    }

    public Node getleft() {
        return left;
    }
}

class DLList {
    Node start;

    public int go() {
        int dump;
        dump = this.init(10);
        dump = this.print();
        dump = this.insert(1);
        dump = this.print();
        dump = this.insert(2);
        dump = this.print();
        dump = this.insert(3);
        dump = this.print();
        dump = this.insert(4);
        dump = this.print();
        dump = this.insert(5);
        dump = this.print();
        dump = this.insert(6);
        dump = this.print();
        dump = this.delete(4);
        dump = this.print();
        dump = this.delete(5);
        dump = this.print();
        dump = this.insert(6);
        dump = this.print();
        dump = this.delete(6);
        dump = this.print();
        return 10;
    }

    public int init(int n) {
        int i;
        int mark;
        int dump;
        Node newNode;
        Node refn;
        i = 0;
        mark = 1;
        if(!(n != 0)) {
            mark = 0;
        }
        if(mark != 0) {
            start = new Node();
            dump = start.init(12);
            refn = start;
            while (i <= (n - 2)) {
                newNode = new Node();
                dump = newNode.init(15 + (i * (i - 1)));
                dump = refn.addr(newNode);
                dump = newNode.addl(refn);
                refn = newNode;
                i = i + 1;
            }
        }
        return n;
    }

    public int insert(int v) {
        Node newNode;
        int dump;
        newNode = new Node();
        dump = newNode.init(v);
        dump = newNode.addr(start.getright());
        dump = (start.getright()).addl(newNode);
        dump = start.addr(newNode);
        dump = newNode.addl(start);
        return v;
    }

    public int delete(int v) {
        Node first;
        Node temp;
        int dump;
        first = start;
        if(!((first.getval()) != v)) {
            if(first.hasright()) {
                temp = first.getright();
                dump = temp.addl(temp);
                first = temp;
            } else {
                System.out.println(999);
            }
        }
        while(first.hasright()) {
            first = first.getright();
            if(!((first.getval()) != v)) {
                if(first.hasright()) {
                    temp = first.getright();
                    dump = temp.addl(first.getleft());
                    dump = (first.getleft()).addr(temp);
                } else {
                    dump = (first.getleft()).addr(first.getleft());
                }
            }
        }
        return 0;
    }

    public int print() {
        Node first;
        first = start;
        System.out.println(first.getval());
        while(first.hasright()) {
            first = first.getright();
            System.out.println(first.getval());
        }
        return 0;
    }
}