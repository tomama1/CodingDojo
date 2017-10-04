import random

# words = "It's thanksgiving day. It's my birthday,too!"
# number_one = words.find("day")
# print(number_one)

# new_string = "month"
# words = words.replace("day","month",1)
# print(words)

# x = [2,54,-2,7,12,98]
# print(min(x),max(x))

# x = ["hello",2,54,-2,7,12,98,"world"]
# newlist = []
# newlist.append(x[0])
# newlist.append(x[len(x)-1])
# print (newlist)

# x = [19,2,54,-2,7,12,98,32,10,-3,6]
# x.sort()
# firsthalf = []
# newlist = []
# for i in range(0,(len(x)/2)+1):
#     firsthalf.append(x[i])
# newlist.append(firsthalf)
# for i in range(len(x)/2+1,len(x)):
#     newlist.append(x[i])
# print (newlist)


# for i in range(1,1000,2):
#     print(i)
# for i in range(5,1000001):
#     print(i)
# a = [1,2,5,10,25,3]
# a_sum = 0
# for i in a:
#     a_sum+=i
# print(a_sum)
# print(a_sum/len(a))

# val = [4,34,22,68,9,13,3,5,7,9,2,12,45,923]
# if (type(val)==str):
#     if (len(val)>=50):
#         print("Long sentence")
#     else:
#         print("Short sentence")
# elif (type(val)==int):
#     if val >=100:
#         print("That's a big number!")
#     else:
#         print("That's a small number")
# elif(type(val)==list):
#     if (len(val)>=10):
#         print("Big list!")
#     else:
#         print("Short list")

input1 = ['magical unicorns',19,'hello',98.98,'world']
count = 0
finalstring = ""
finalsum = 0
for item in input1:
    if isinstance(item,str):
        finalstring=finalstring + " "+ item
        count+=1
    elif isinstance(item,float) or isinstance(item,int):
        finalsum+=item
        count+=2
if (count==len(input1)):
    print("The list you entered is of string type")
    print("String:"+finalstring)
elif (count ==(len(input1)*2)):
    print("The list you entered is of integer type")
    print("Sum: "+str(finalsum))
else:
    print ("The list you entered is of mixed type")
    print("String:"+finalstring)
    print("Sum: "+str(finalsum))

# list_one= ["hello","world"]
# list_two= ["hello","world"]
# if(list_one==list_two):
#     print "The lists are the same"
# else:
#     print "the lists are not the same"

# new_list = []
# word_list = ['hello','world','my','name','is','Anna']
# char = 'o'
# for word in word_list:
#     if char in word:
#         new_list.append(word)
#         continue;
# print(new_list)

# string1 = "* * * *"
# string2 = " * * * *"
# for i in range(0,10):
#     if (i%2==0):
#         print (string1)
#     else:
#         print (string2)

# a = ["x",1,2,3,4,5,6,7,8,9,10,11,12]
# first_column = ''
# for x in a:
#     first_column += (str(x) + " ")
# print (first_column)
# for i in range(1,13):
#     print(str(i)+" "+str(a[1]*i)+" "+str(a[2]*i)+" "+str(a[3]*i)+" "+str(a[4]*i)+" "+str(a[5]*i)+" "+str(a[6]*i)+" "+str(a[7]*i)+" "+str(a[8]*i)+" "+str(a[9]*i)+" "+str(a[10]*i)+" "+str(a[11]*i)+" "+str(a[12]*i))     


# def oddeven():
#     for i in range(1,2001):
#         if (i%2==0):
#             print("Number is "+str(i)+". This is an even number.")
#         else:
#             print("Number is "+str(i)+". This is an odd number.")
# def multiply(a,num):
#     for i in range(0,len(a)):
#         a[i] = a[i]*num
#     return a
# def layered_multiples(arr):
#     new_array = []
#     for x in arr:
#         temp_array = []
#         for i in range(0,x):
#             temp_array.append(1)
#         new_array.append(temp_array)
#     return new_array

# oddeven()
# a = [2,4,10,16]
# b = multiply(a,5)
# c = layered_multiples(multiply([2,4,5],3))
# print c

# def scores_grades(x):
#     if (70>x>59):
#         print ("Score: "+str(x)+"; Your grade is D")
#     elif (80>x>69):
#         print ("Score: "+str(x)+"; Your grade is C")
#     elif (90>x>79):
#         print ("Score: "+str(x)+"; Your grade is B")
#     elif (101>x>89):
#         print ("Score: "+str(x)+"; Your grade is A")
#     else:
#         print ("Out of range")
# random_num = random.randint(60,100)
# scores_grades(random_num)

# def coin_toss():
#     head_count = 0
#     tail_count = 0
#     for i in range(0,5001):
#         toss = round(random.random())
#         if (toss == 0):
#             head_count+=1
#             print("Attempt #"+str(i)+": Throwing a coin... It's a head! ... Got "+str(head_count)+" head(s) so far and "+str(tail_count)+" tail(s) so far")
#         else:
#             tail_count+=1
#             print("Attempt #"+str(i)+": Throwing a coin... It's a tail! ... Got "+str(head_count)+" head(s) so far and "+str(tail_count)+" tail(s) so far")
#     print("Ending the program, thank you!")
# coin_toss()

# x = [4,6,1,3,5,7,25,"tom"]
# def draw_stars(x):
#     for val in x:
#         if isinstance(val,str):
#             str1 = val[0].lower()
#             for i in range(0,len(val)):
#                 str1 += val[0].lower()
#             print (str1)
#         if isinstance(val,int):
#             str2 = ""
#             for i in range(0,val):
#                 str2+="*"
#             print (str2)
# draw_stars(x)

# my_dict = { 'name': 'Matthew', 'age': '21', 'country of birth':'United States','favorite language':'Python'}
# def print_dict(dict):
#     for key in dict.keys():
#         print("My "+key+" is "+dict[key])
# print_dict(my_dict)

# students = [
#      {'first_name':  'Michael', 'last_name' : 'Jordan'},
#      {'first_name' : 'John', 'last_name' : 'Rosales'},
#      {'first_name' : 'Mark', 'last_name' : 'Guillen'},
#      {'first_name' : 'KB', 'last_name' : 'Tonel'}
# ]
# users = {
#  'Students': [
#      {'first_name':  'Michael', 'last_name' : 'Jordan'},
#      {'first_name' : 'John', 'last_name' : 'Rosales'},
#      {'first_name' : 'Mark', 'last_name' : 'Guillen'},
#      {'first_name' : 'KB', 'last_name' : 'Tonel'}
#   ],
#  'Instructors': [
#      {'first_name' : 'Michael', 'last_name' : 'Choi'},
#      {'first_name' : 'Martin', 'last_name' : 'Puryear'}
#   ]
#  }
# def print_studentlist(list):
#     for student in students:
#         str1 = ""
#         for value in student.values():
#             str1 = str1 + value + " "
#         print str1
# def print_studentdict(users):
#     for category in users.keys():
#         count = 0
#         print category
#         for obj in users[category]:
#             str1 = ""
#             count +=1
#             for value in obj.values():
#                 str1 = str1 + value + " "
#             print (str(count)+" - "+str1+" - "+str(len(str1)-2))
# print_studentlist(students)
# print_studentdict(users)

# my_dict = {
#   "Speros": "(555) 555-5555",
#   "Michael": "(999) 999-9999",
#   "Jay": "(777) 777-7777"
# }
# def dict_to_tuple(dict):
#     return dict.items()

# print(dict_to_tuple(my_dict))

# name = ["Anna", "Eli", "Pariece", "Brendan", "Amy", "Shane", "Oscar"]
# favorite_animal = ["horse", "cat", "spider", "giraffe", "ticks", "dolphins", "llamas"]
# def make_dict(arr1, arr2):
#     new_dict = {}
#     arr1_len = len(arr1)
#     arr2_len = len(arr2)
#     shorter_len = 0;
#     if (arr1_len<=arr2_len):
#         shorter_len = arr1_len
#         keys = arr1
#         values = arr2
#     else:
#         shorter_len = arr2_len
#         keys = arr2
#         values = arr1
#     for i in range(0,shorter_len):
#         new_dict[keys[i]] = values[i]
#     return new_dict

# print make_dict(name,favorite_animal)