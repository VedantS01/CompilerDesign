package visitor;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;


public class Proc {
    public Integer argc = 0;
    public Integer stackspace = 0;
    public Integer spillcount = 0;
    public Integer maxcallargs = 0;
    public Integer calleesavenumber = 0;
    public String label = "";

    public Integer notspilled = 0;

    // currently not in use
    public HashSet<BasicBlock> blocks = new HashSet<>();

    public ArrayList<Statement> allstmts = new ArrayList<>();

    public String out() {
        String s = label + " [" + argc + "] [" + stackspace + "] [" + maxcallargs + "]";
        System.out.println(s);
        Boolean isv0used = false;
        Boolean isv1used = false;
        for (Statement statement : allstmts) {
            switch(statement.opcode) {
                case "ENTRY":
                case "EXIT":
                break;
                case "LABEL":
                System.out.println(/*"__"+label+"__"+*/statement.addr1);
                break;
                case "NOOP":
                System.out.println("NOOP");
                break;
                case "ERROR":
                System.out.println("ERROR");
                break;
                case "PRINT":
                if(statement.addr1.startsWith("TEMP ")) {
                    String reg = getreg(statement.addr1);
                    System.out.println("PRINT " + reg);
                } else {
                    System.out.println("PRINT " + statement.addr1);
                }
                break;
                case "RETURN":
                if(statement.addr1.startsWith("TEMP ")) {
                    String reg = getreg(statement.addr1);
                    System.out.println("MOVE v0 " + reg);
                } else {
                    System.out.println("MOVE v0 " + statement.addr1);
                }
                break;
                case "CJUMP":
                String cond = getreg(statement.addr1);
                System.out.println("CJUMP " + cond + " " + statement.addr2);
                break;
                case "JUMP":
                System.out.println("JUMP " + statement.addr1);
                break;
                case "HLOAD":
                String ad1 = getreg(statement.addr1);
                String ad2 = getreg(statement.addr2);
                System.out.println("HLOAD " + ad1 +" " + ad2 +" "+ statement.addr3);
                break;
                case "HSTORE":
                String add1 = getreg(statement.addr1);
                String ad3 = getreg(statement.addr3);
                System.out.println("HSTORE " + add1 + " "+statement.addr2 +" "+ ad3);
                break;
                case "MOVE":
                switch (statement.moveexp.opcode) {
                    case "CALL":
                        Integer savestart = spillcount;
                        HashMap<String,Integer> regsavedat = new HashMap<>();
                        for (String save : usedregisters) {
                            System.out.println("ASTORE SPILLEDARG " + savestart + " " + save);
                            regsavedat.put(save, savestart);
                            savestart++;
                        }
                        // pass args
                        Integer argind = 0;
                        Boolean done = false;
                        for(int i = 0; i < 4; i++) {
                            if(argind >= argc) {
                                done = true;
                                break;
                            }
                            System.out.println("MOVE a" + argind + " " + getreg(statement.moveexp.addrs.get(argind+1)));
                            argind++;
                        }
                        if(argc > 4 && !done) {
                            System.out.println("PASSARG " + (argind - 3));
                            argind++;
                        }
                        System.out.println("CALL " + getreg(statement.moveexp.addrs.get(0)));
                        System.out.println("MOVE " + getreg(statement.addr1) + " v0");
                        for (String save : usedregisters) {
                            System.out.println("ALOAD " + save + " SPILLEDARG " + regsavedat.get(save));
                        }
                        break;
                    case "HALLOCATE":
                        String r1 = statement.moveexp.addrs.get(0);
                        if(r1.startsWith("TEMP ")) {
                            r1 = getreg(r1);
                        }
                        System.out.println("MOVE " + getreg(statement.addr1) + " HALLOCATE " + r1);
                        break;
                    case "SIMPLEEXPR":
                        String r2 = statement.moveexp.addrs.get(0);
                        if(r2.startsWith("TEMP ")) {
                            r2 = getreg(r2);
                        }
                        System.out.println("MOVE " + getreg(statement.addr1) + " " + r2);
                        break;
                    default:
                        // a binop
                        String r4 = getreg(statement.moveexp.addrs.get(0));
                        String r3 = statement.moveexp.addrs.get(1);
                        if(r3.startsWith("TEMP ")) {
                            r3 = getreg(r3);
                        }
                        System.out.println("MOVE " + getreg(statement.addr1) + " " + statement.moveexp.opcode + " " + r4 + " "+r3);
                        break;
                }
                break;
                default:
                break;
            }
        }
        System.out.println("END");
        s += "END\n";
        return s;
    }

    public ArrayList<LiveInterval> liveintervals = new ArrayList<>();
    public ArrayList<LiveInterval> args = new ArrayList<>();

    public HashSet<String> usedregisters = new HashSet<>();

    private String getreg(String temp) {
        String reg = "";
        for (LiveInterval l : liveintervals) {
            if(l.label.equals(temp)) {
                if(l.isstacked) {
                    ArrayList<String> allregs = new ArrayList<>();
                    for(int i = 0; i < 9; i++) allregs.add("t"+i);
                    for(int i = 0; i < 7; i++) allregs.add("s"+i);
                    allregs.removeAll(usedregisters);
                    if(allregs.isEmpty()) {
                        System.err.println("FATAL PROBLEM, NOTHING TO USE SPILLED ARGS WITH");
                        System.exit(1);
                    }
                    String replace = allregs.get(0);
                    System.out.println("ALOAD " + replace + " SPILLEDARG " + l.location);
                    reg = replace;
                } else
                reg = l.register;
            }
        }
        if(reg.equals("")) {
            System.err.println("PRINT failed due to register unavailable for T: " + temp);
            System.exit(1);
        }
        return reg;
    }
}
