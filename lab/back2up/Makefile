all:
	javac Main.java

test:
	rm *.class
	rm visitor/*.class
	rm syntaxtree/*.class
	javac Main.java
	bash tests/test.sh

gentest:
	bash testgen.sh

clean:
	rm *.class
	rm visitor/*.class
	rm syntaxtree/*.class