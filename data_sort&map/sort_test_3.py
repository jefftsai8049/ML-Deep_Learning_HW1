# This script use to sort test file

import sys

train = open("C:/MLDS_HW1_RELEASE_v1/fbank/test.ark","r")
out = open("C:/MLDS_HW1_RELEASE_v1/sort/test_out.txt","w")

i=0
while 1:
    trainD = train.readline()
    i = i+1
    if trainD == "" :
        print(i)
        break
    else:
        out.write(trainD)

train.close()
out.close()

