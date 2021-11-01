package visitor;

import java.util.ArrayList;
import java.util.HashSet;

public class BasicBlock {
    public Proc whichproc;
    public String label;
    public ArrayList<Statement> lines;
    public Statement leader;

    public HashSet<BasicBlock> pred = new HashSet<>();
    public HashSet<BasicBlock> succ = new HashSet<>();
}
