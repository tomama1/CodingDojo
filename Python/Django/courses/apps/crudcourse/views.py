from django.shortcuts import render, redirect, HttpResponse
from .models import Course, Description

# Create your views here.
def index(request):
    courses = Course.objects.all()
    descs = Description.objects.all()
    return render(request, "crudcourse/index.html", {'courses' : courses, 'descriptions' : descs})

def add(request):
    newcourse = Course(name = request.POST['name'])
    newcourse.save()
    newdescription = Description(description=request.POST['description'], course=newcourse)
    newdescription.save()

    return redirect('/')

def delete(request, id):
    course = Course.objects.get(id = id)
    return render(request, "crudcourse/delete.html", {'course' : course})

def delete_process(request, id):
    a = Course.objects.get(id=id)
    a.description.delete()
    a.save()
    Course.objects.get(id=id).delete()
    return redirect('/')

def goback(request):
    return redirect('/')

def search(request):
    courses = Course.objects.filter(name__startswith=request.POST['search'])
    print courses
    return render(request, "crudcourse/ajax.html", {"courses":courses})