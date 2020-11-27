#!/bin/dash

# generic test on subset 0

rm output1.txt 2>/dev/null
rm output2.txt 2>/dev/null

rm -rf .shrug 2>/dev/null
shrug-init >> output1.txt
touch a b c 
echo hello >a
echo hello >b
shrug-add a b 
shrug-commit -m "1st com" >> output1.txt
echo world >> a
shrug-add a
shrug-show :a >> output1.txt
shrug-show :b >> output1.txt
shrug-show 0:a >> output1.txt
shrug-show 0:b >> output1.txt
shrug-log >> output1.txt

rm -rf .shrug 2>/dev/null
2041 shrug-init>> output2.txt
touch a b c 
echo hello >a
echo hello >b
2041 shrug-add a b 
2041 shrug-commit -m "1st com" >> output2.txt
echo world >> a
2041 shrug-add a
2041 shrug-show :a >> output2.txt
2041 shrug-show :b >> output2.txt
2041 shrug-show 0:a >> output2.txt
2041 shrug-show 0:b >> output2.txt
2041 shrug-log >> output2.txt

f=`basename -- "$0"`
f="${f%.*}"

if diff output1.txt output2.txt
then
    echo $f passed
else
    echo $f failed
fi
    
rm output1.txt 2>/dev/null
rm output2.txt 2>/dev/null



