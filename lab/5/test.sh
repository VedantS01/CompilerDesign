#!/bin/bash
    COUNT=0
    PASS=0
    make clean
    make
    rm tests/out/*
    rm tests/exp/*
    rm tests/s/*
    for f in tests/miniRA/*
    do
        java A4 < "tests/miniRA/$(basename "$f")" > "tests/s/$(basename "$f").s"
        java -jar tests/interpreters/mars.jar < "tests/s/$(basename "$f").s" > "tests/out/$(basename "$f").out"
        java -jar tests/interpreters/kgi.jar < "tests/miniRA/$(basename "$f")" > "tests/exp/$(basename "$f").out"
        # diff tests/out/$(basename "$f").out tests/exp/$(basename "$f").out
        if ! diff -q "tests/out/$(basename "$f").out" "tests/exp/$(basename "$f").out" >> /tmp/out.txt  
        then 
            echo Match Failure - "$f"
        else 
            echo Match Success - "$f"
            PASS=$(( PASS+1 ))
        fi
        COUNT=$(( COUNT+1 ))
    done
    echo "Total ${PASS}/${COUNT} cases passed"