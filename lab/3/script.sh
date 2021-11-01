#!/bin/bash
    COUNT=0
    PASS=0
    javac A3.java
    rm TestFolder/out/*
    rm TestFolder/exp/*
    rm TestFolder/microIR/*
    for f in TestFolder/MiniJava/*
    do
        java A3 < "TestFolder/MiniJava/$(basename "$f")" > "TestFolder/microIR/$(basename "$f").microIR"
        java -jar TestFolder/Tester/pgi.jar < "TestFolder/microIR/$(basename "$f").microIR" > "TestFolder/out/$(basename "$f").out"
        java "TestFolder/MiniJava/$(basename "$f")" > "TestFolder/exp/$(basename "$f").out"
        # diff TestFolder/out/$(basename "$f").out TestFolder/exp/$(basename "$f").out
        if ! diff -q "TestFolder/out/$(basename "$f").out" "TestFolder/exp/$(basename "$f").out" >> /tmp/out.txt  
        then 
            echo "Match Failure - "$f""
        else 
            echo "Match Success - "$f""
            PASS=$(( PASS+1 ))
        fi
        COUNT=$(( COUNT+1 ))
    done
    echo "Total ${PASS}/${COUNT} cases passed"