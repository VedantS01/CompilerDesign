# test.sh -- by Vedant

for file in tests/tc/*
do
    echo "Running $(basename "$file")..."
    java Main < "$file" > tests/exp/$(basename "$file").out
done