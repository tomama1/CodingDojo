from django.shortcuts import render, HttpResponse, redirect

def index(request):
    response = "Hello, I am your first request!"
    return HttpResponse(response)


# Create your views here.
def test(request):
    response = "This is the test page!!"
    return HttpResponse(response)
