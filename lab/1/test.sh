make clean
make all

for file in MacroJava/*
do
    if [ "$file" != "MacroJava/A1" ]
    then
        echo "Evaluating $file..."
        ./A1 < "$file" > out/"$file"
    fi
done

# for file in MiniJava/*
# do
#     if [ "$file" != "A1" ]
#     then
#         echo "Evaluating $file..."
#         ./A1 < "$file" > out/"$file"
#     fi
# done