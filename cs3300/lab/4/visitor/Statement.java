package visitor;

import java.util.HashSet;

public class Statement {
    public Integer lno;

    public String fullstmt; // why we need this??
    public String opcode;
    public String addr1;
    public String addr2;
    public String addr3;

    public Expression moveexp;

    public HashSet<Statement> pred = new HashSet<>();
    public HashSet<Statement> succ = new HashSet<>();

    public HashSet<String> def = new HashSet<>();
    public HashSet<String> use = new HashSet<>();
    public HashSet<String> livein = new HashSet<>();
    public HashSet<String> liveout = new HashSet<>();

    public Proc whichproc;

    public String toString() {
        return "Line: " + lno + "; " + fullstmt;
    }
}
