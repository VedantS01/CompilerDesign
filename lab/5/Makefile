all:
	javac A5.java

clean:
	rm -f *.class
	rm -f syntaxtree/*.class
	rm -f visitor/*.class

pack:
	rm -f *.class
	rm -f syntaxtree/*.class
	rm -f visitor/*.class
	cp -r . ../~5
	rm -f -r ../CS19B074 ../CS19B074.zip
	mkdir ../CS19B074
	mkdir ../CS19B074/A5
	cp -r . ../CS19B074/A5
	rm -f -r ../CS19B074/A5/interpreter ../CS19B074/A5/tests ../CS19B074/A5/src
	rm -f ../CS19B074/A5/*.sh 
	rm -f ../CS19B074/A5/*.microIR ../CS19B074/A5/*.RA 
	rm -f ../CS19B074/A5/Makefile
	rm -f ../CS19B074/A5/*.zip
	cd ../ && zip -r CS19B074.zip CS19B074 && cd 5