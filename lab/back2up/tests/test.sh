# test.sh -- by Vedant

for file in tests/tc/*
do
    echo "Running $(basename "$file")..."
    java Main < "$file" > tests/out/$(basename "$file").out
done

count=0

for file1 in tests/out/*
do
    echo "Evaluating $(basename "$file1")..."
    # DIFF=$(diff out/Result/$(basename "$file1") out/MiniJava/$(basename "$file1"))
    if ! diff -q tests/out/$(basename "$file1") tests/exp/$(basename "$file1") >> /tmp/out.txt
    then
        echo "Match failed for $(basename "$file1")."
        ((count=count+1))
    else
        echo "Match success for $(basename "$file1")."
    fi
done

echo Total testcases failed : $count

rm tests/out/*