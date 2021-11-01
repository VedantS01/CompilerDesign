package visitor;

import java.util.Comparator;

public class LiveInterval {
    public Proc whichproc;
    public Integer start;
    public Integer end;
    public String label; // why need this, again? maybe to rep temporary

    public String register; // assigned register
    public String location; // stacklocation, this is parseable to integer
    public String argregister; // if this is an argument, this is where it maps [a0..a3]
    public Boolean isstacked = false;
    


    public static class ComparatorByStart implements Comparator<LiveInterval> {
        @Override
        public int compare(LiveInterval x, LiveInterval y) {
            return x.start.compareTo(y.start);
        }
    }

    public static class ComparatorByEnd implements Comparator<LiveInterval> {
        @Override
        public int compare(LiveInterval x, LiveInterval y) {
            return x.end.compareTo(y.end);
        }
    }
}