# This script use to map test data predict output label to 48 phones and map to 39 phones again


in_label = open("C:/MLDS_HW1_RELEASE_v1/sort/predict_test_out.txt","r")
in_dict = open("C:/MLDS_HW1_RELEASE_v1/sort/dictionary.txt","r")
in_dict2 = open("C:/MLDS_HW1_RELEASE_v1/sort/48_39.map","r")
in_data = open("C:/MLDS_HW1_RELEASE_v1/sort/test_out.txt","r")
out = open("C:/MLDS_HW1_RELEASE_v1/sort/test_final.csv","w")



map = []
while 1:
    d = in_dict.readline()
    if d=="" :
        break
    set = d.split()
    set[0], set[1] = set[1], set[0]
    map.append(set)
dic = dict(map)

map2 = []
while 1:
    d2 = in_dict2.readline()
    if d2=="" :
        break
    set2 = d2.split()
    map2.append(set2)
dic2 = dict(map2)

out.write("Id")
out.write(",")
out.write("Prediction")
out.write("\n")

label = in_label.readline()
label = label[:-1]
labelV = label.split(',')
i=0
while 1:
    data = in_data.readline()
    if data=="":
        break

    dataV = data.split()
    print(dataV[0])
    out.write(dataV[0])
    out.write(",")
    print(labelV[i])
    out.write(dic2[dic[labelV[i]]])
    out.write("\n")
    i=i+1
in_label.close()
in_dict.close()
in_data.close()
out.close()