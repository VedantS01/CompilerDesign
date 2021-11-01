#!/bin/bash
java A4 < "$1" > "(basename "$1").RA"
java -jar tests/interpreters/kgi.jar < "(basename "$1").RA" > "/tmp/$(basename "$1").out"
java -jar tests/interpreters/pgi.jar < "$1" > "/tmp/$(basename "$1").exp"
if ! diff -q "/tmp/$(basename "$1").out" "/tmp/$(basename "$1").exp" >> /tmp/out.txt  
then 
    echo "Match Failure - "$1""
else 
    # java -jar tests/interpreters/pgi.jar < "$1"
    echo "Match Success - "$1""
fi