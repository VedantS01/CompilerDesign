all:
	javac A4.java

clean:
	rm -f *.class
	rm -f syntaxtree/*.class
	rm -f visitor/*.class

pack:
	rm -f *.class
	rm -f syntaxtree/*.class
	rm -f visitor/*.class
	cp -r . ../~4
	rm -f -r ../CS19B074 ../CS19B074.zip
	mkdir ../CS19B074
	mkdir ../CS19B074/A4
	cp -r . ../CS19B074/A4
	rm -r ../CS19B074/A4/interpreter ../CS19B074/A4/tests ../CS19B074/A4/src
	rm -f ../CS19B074/A4/*.sh 
	rm -f ../CS19B074/A4/*.microIR ../CS19B074/A4/*.RA 
	rm -f ../CS19B074/A4/Makefile
	cd ../ && zip -r CS19B074.zip CS19B074 && cd 4