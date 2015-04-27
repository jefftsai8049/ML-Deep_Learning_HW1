# This script use to map character label to number
import sys

# Load dictionary file

fd = open("C:/MLDS_HW1_RELEASE_v1/sort/dictionary.txt","r")
map = []
while 1:
    # Read data line by line
    d = fd.readline()
    # Split data
    set = d.split()
    # Check is EOF or not
    if d=="" :
        break
    else:
        map.append(set)
# Establish a dictionary
dic = dict(map)
print (dic)
fd.close()

# Load sorted train file and output file
train = open("C:/MLDS_HW1_RELEASE_v1/sort/train_out.txt","r")
out = open("C:/MLDS_HW1_RELEASE_v1/sort/train_out_map.txt","w")

i=0
while 1:
    #Load file and split
    i=i+1
    trainD = train.readline()
    trainV = trainD.split()
    # Check is EOF or not
    if trainD =="":
        break
    # Map character to number
    trainV[0] = dic[trainV[0]]
    msg = ', '.join(trainV)
    # Write data and label to output file
    out.write(msg)
    out.write("\n")
train.close()
out.close()
print(i)