#!/bin/dash

# generic test on subset 1, focus on commit -a

rm output1.txt 2>/dev/null
rm output2.txt 2>/dev/null

rm -rf .shrug 2>/dev/null
shrug-init >> output1.txt
touch a b c 
echo hello >a
echo hello >b
shrug-add a b >> output1.txt 
shrug-commit -m "1st com" >> output1.txt
echo world >> a
shrug-commit -a -m "2nd com with -a" >> output1.txt
touch d e f 
shrug-commit -a -m "3rd com with -a" >> output1.txt
shrug-add d e f
echo dddd>d
echo eeee>e
echo ffff>f
shrug-commit -a -m "4rd com with -a" >> output1.txt
shrug-log >>output1.txt



rm -rf .shrug 2>/dev/null
2041 shrug-init >> output2.txt
touch a b c 
echo hello >a
echo hello >b
2041 shrug-add a b 
2041 shrug-commit -m "1st com" >> output2.txt
echo world >> a
2041 shrug-commit -a -m "2nd com with -a" >> output2.txt
2041 touch d e f 
2041 shrug-commit -a -m "3rd com with -a" >> output2.txt
2041 shrug-add d e f
2041 echo dddd>d
2041 echo eeee>e
2041 echo ffff>f
2041 shrug-commit -a -m "4rd com with -a" >> output2.txt
2041 shrug-log >>output2.txt

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



