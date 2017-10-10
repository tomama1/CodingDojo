from django.shortcuts import render, HttpResponse, redirect

def index(request):
    response = "Hello, My Name is Matthew Toma"
    return HttpResponse(response)

def new(request):
    return HttpResponse("placeholder to display a new form to create a new blog")

def create(request):
    return redirect('/')

def show(request,blog_id):
    return HttpResponse('placeholder to display blog {}'.format(blog_id))

def edit(request,blog_id):
    return HttpResponse("placeholder to edit blog {}".format(blog_id))

def destroy(request,blog_id):
    return redirect('/')



