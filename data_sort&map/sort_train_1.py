# This script is sorting data and label, and combine it together
# Convert train.ark and train.lab to train_out.txt
import sys

# Load train data train.ark
train = open("C:/MLDS_HW1_RELEASE_v1/fbank/train.ark","r")
# Load label data train.lab
label = open("C:/MLDS_HW1_RELEASE_v1/label/train.lab","r")
#Load train_out.txt to output comibed train data
out = open("C:/MLDS_HW1_RELEASE_v1/sort/train_out.txt","w")


i=0
while 1:
    # Load train.ark line by line
    trainD = train.readline()
    # Check data is end or not
    if trainD == "" :
        print(i)
        break
    # Split train data
    trainV = trainD.split()

    while 1:
        # Load label line by line
        labelD = label.readline()
        # Check label is end or not
        if labelD == "":
            # If EOF  open label file again
            label = open("C:/MLDS_HW1_RELEASE_v1/label/train.lab","r")
        else:
            # If not EOF, split label
            labelV = labelD.split(',')
            print(labelV[0])
            print(labelV[1])
            print(i)
            # Find same train data and label name
            if trainV[0] == labelV[0]:
                # Cut out the last character "\n"
                labelV[1] = labelV[1][:-1]
                # Combine data together
                trainD = labelV[1]+"\t"+trainD
                # Write data into file
                out.write(trainD)
                break

    i =i+1
    if trainD == "" :
        print(i)
        break
# Close file
train.close()
label.close()
out.close()

