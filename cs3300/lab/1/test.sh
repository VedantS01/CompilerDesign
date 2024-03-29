make clean
make all

rm out/MacroJava/*
rm out/MiniJava/*
rm out/Result/*

for file in MacroJava/*
do
    if [ "$file" != "MacroJava/A1" ]
    then
        echo "Evaluating $file..."
        ./A1 < "$file" > out/"$file"
    fi
done

for file in MiniJava/*
do
    if [ "$file" != "MiniJava/A1" ]
    then
        java "$file" > out/MiniJava/$(basename "$file")
    fi
done

for file in out/MacroJava/*
do
    if [ "$file" != "MacroJava/A1" ]
    then
        echo "Comparing $file..."
        java "$file" > out/Result/$(basename "$file")
    fi
done

for file1 in out/Result/*
do
    echo "Evaluating $(basename "$file1")..."
    # DIFF=$(diff out/Result/$(basename "$file1") out/MiniJava/$(basename "$file1"))
    if ! diff -q out/Result/$(basename "$file1") out/MiniJava/$(basename "$file1")
    then
        echo "Match failed for $(basename "$file1")."
    else
        echo "Match success for $(basename "$file1")."
    fi
done