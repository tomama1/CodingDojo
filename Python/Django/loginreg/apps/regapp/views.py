from django.shortcuts import render, redirect
from django.contrib import messages
from .models import User
import re
import bcrypt

# Create your views here.
def index(request):
    return render(request, "regapp/index.html")

def register(request):
    noerrors = False
    EMAIL_REGEX = re.compile(r"[^@]+@[^@]+\.[^@]+")
    firstname = request.POST['firstname']
    lastname = request.POST['lastname']
    email = request.POST['email']
    password = request.POST['password']
    hashedpassword = bcrypt.hashpw(password.encode(), bcrypt.gensalt())
    pwconf = request.POST['pwconf']
    if(len(firstname)<3):
        noerrors = True
        messages.error(request, "First Name must be longer than 3 characters", extra_tags="firstname")
    if(len(lastname)<3):
        noerrors = True
        messages.error(request, "Last Name must be longer than 3 characters", extra_tags="lastname")
    if not EMAIL_REGEX.match(email):
        noerrors = True
        messages.error(request, "Must be a Valid Email", extra_tags = "email")
    if(len(password) < 8):
        noerrors = True
        messages.error(request, "Password must be longer than 8 characters", extra_tags ="password")
    if(password != pwconf):
        noerrors = True
        messages.error(request, "Your passwords do not match", extra_tags = "pwconf")
    if noerrors:
        return redirect('/')
    else:
        newuser = User.objects.create(firstname=firstname, lastname=lastname, email = email, password = hashedpassword)
        return render(request, 'regapp/regsuccess.html', {"newuser": newuser})

def login(request):
    email = request.POST['login_email']
    password = request.POST['login_password']
    user = User.objects.filter(email = email)
    usercheck = user[0]
    print usercheck.password
    if bcrypt.checkpw(password.encode(), usercheck.password.encode()):
        return render(request, 'regapp/loginsuccess.html', {"user" : usercheck})
    else:
        return redirect('/')
