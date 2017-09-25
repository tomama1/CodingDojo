
var students = [
  {first_name: 'Michael', last_name: 'Jordan'},
  {first_name: 'John', last_name: 'Rosales'},
  {first_name: 'Mark', last_name: 'Guillen'},
  {first_name: 'KB', last_name: 'Tonel'}
]

function printNames(arr){
  for(i=0;i<arr.length;i++){
    console.log(arr[i].first_name+" "+arr[i].last_name);
  }
}

var users = {
  'Students' : [
    {first_name: 'Michael', last_name: 'Jordan'},
    {first_name: 'John', last_name: 'Rosales'},
    {first_name: 'Mark', last_name: 'Guillen'},
    {first_name: 'KB', last_name: 'Tonel'}
  ],
  'Instructors' : [
    {first_name: 'Michael', last_name: 'Choi'},
    {first_name: 'Martin', last_name: 'Puryear'},
  ]
}



function printNamefromDict(arr){
  for(var key in arr){
    console.log(key);
    for(i=0;i<arr[key].length;i++){
      console.log(i+" - "+ arr[key][i].first_name+" "+arr[key][i].last_name + " - " + (arr[key][i].first_name.length+arr[key][i].last_name.length));
      }
  }
}

printNames(students);

printNamefromDict(users);