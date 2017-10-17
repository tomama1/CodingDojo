from django.shortcuts import render, redirect
from .models import User

# Create your views here.
def index(request):
    users = User.objects.all()
    return render(request,"crud/index.html",{'users':users})

def edit(request, id):
    return render(request, "crud/edit.html", {'user': User.objects.get(id = id) })

def process_edit(request, id):
    user = User.objects.get(id = id)
    user.firstname = request.POST['firstname']
    user.lastname = request.POST['lastname']
    user.email = request.POST['email']
    user.save()
    return redirect('/')

def add(request):
    print "add"
    return render(request, "crud/new.html")

def process_add(request):
    user = User.objects.create()
    user.firstname = request.POST['firstname']
    user.lastname = request.POST['lastname']
    user.email = request.POST['email']
    user.save()
    return redirect('/')

def remove(request, id):
    User.objects.get(id = id).delete()
    return redirect('/')

def show(request, id):
    return render(request, "crud/show.html", {'user':User.objects.get(id = id)})

def goback(request):
    return redirect('/')