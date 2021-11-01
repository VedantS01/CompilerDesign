javac A3.java
java A3 < "$1".java > t.microIR
java -jar interpreter/pgi.jar < t.microIR
