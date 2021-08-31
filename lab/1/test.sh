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
        javac -d out/MiniJava "$file" 
    fi
done

for file in out/MacroJava/*
do
    if [ "$file" != "MacroJava/A1" ]
    then
        echo "Comparing $file..."
        javac -d out/Result "$file"
    fi
done

for file1 in out/Result/*
do
    diff out/Result/$(basename "$file1") out/MiniJava/$(basename "$file1")
done