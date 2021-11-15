package visitor;

import java.util.*;

public class ObjectAllocationManager {

    public HashMap<Object, Class_> isInstanceOf = new HashMap<>();
    public HashMap<Object, String> tempassigned = new HashMap<>();

    public HashMap<Class_, HashMap<Object, Integer>> classmaps; // get refference from IRGenerator

    // what really??
    // shut it up, man!    
    
}