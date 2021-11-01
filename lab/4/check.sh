#!/bin/bash
java A4 < "$1".microIR > $(basename "$1").RA
java -jar tests/interpreters/kgi.jar < $(basename "$1").RA > $(basename "$1").out
java -jar tests/interpreters/pgi.jar < "$1".microIR > $(basename "$1").exp
if ! diff -q $(basename "$1").out $(basename "$1").exp >> /tmp/out.txt  
then 
    echo Match Failure - $(basename "$1")
else 
    # java -jar tests/interpreters/pgi.jar < "$1"
    echo Match Success - $(basename "$1")
fi
rm -f $(basename "$1").out $(basename "$1").exp