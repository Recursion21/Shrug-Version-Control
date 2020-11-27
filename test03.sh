#!/bin/dash

# test on subset 1, focus on shrug-rm and shrug status
# script doesn't work on my implementation because can't figure out how to redirect error
# msg correctly, shrug-status will contain output.txt diff files

rm output1.txt 2>/dev/null
rm output2.txt 2>/dev/null

rm -rf .shrug 2>/dev/null
shrug-init >> output1.txt
touch a b c d e f g h
echo aaaa>a
echo bbbb>b
echo cccc>c 
echo dddd>d
echo eeee>e
shrug-add a b c d e >> output1.txt 
shrug-commit -m "1st com" >> output1.txt
shrug-rm a >> output1.txt
echo bb >> b
echo cc >> c
echo dd >> d
shrug-rm b >> output1.txt
shrug-rm c >> output1.txt
shrug-rm d >> output1.txt
shrug-status >> output1.txt
shrug-rm --cached b >> output1.txt 2>&1
shrug-rm --cached c >> output1.txt 2>&1
shrug-rm --cached d >> output1.txt 2>&1
shrug-rm --cached e >> output1.txt 2>&1
shrug-status >> output1.txt
shrug-rm f >> output1.txt
shrug-rm --force --cached b >> output1.txt
shrug-rm --force --cached c >> output1.txt
shrug-rm --force --cached d >> output1.txt
shrug-rm --force --cached e >> output1.txt
shrug-status >> output1.txt


rm -rf .shrug 2>/dev/null
2041 shrug-init >> output2.txt
touch a b c d e f g h
echo aaaa>a
echo bbbb>b
echo cccc>c 
echo dddd>d
echo eeee>e
2041 shrug-add a b c d e >> output2.txt 
2041 shrug-commit -m "1st com" >> output2.txt
2041 shrug-rm a >> output2.txt
echo bb >> b
echo cc >> c
echo dd >> d
2041 shrug-rm b >> output2.txt
2041 shrug-rm c >> output2.txt
2041 shrug-rm d >> output2.txt
2041 shrug-status >> output2.txt
2041 shrug-rm --cached b >> output2.txt 2>&1 # for some reason this doesn't redirect
2041 shrug-rm --cached c >> output2.txt 2>&1 # to output2.txt
2041 shrug-rm --cached d >> output2.txt 2>&1 # cannot figure out how
2041 shrug-rm --cached e >> output2.txt 2>&1
2041 shrug-status >> output2.txt
2041 shrug-rm f >> output2.txt
2041 shrug-rm --force --cached b >> output2.txt
2041 shrug-rm --force --cached c >> output2.txt
2041 shrug-rm --force --cached d >> output2.txt
2041 shrug-rm --force --cached e >> output2.txt
2041 shrug-status >> output2.txt

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



