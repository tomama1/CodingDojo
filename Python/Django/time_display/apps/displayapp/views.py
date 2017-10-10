from django.shortcuts import render, HttpResponse, redirect
from time import gmtime, strftime

def index(request):
    context = {
        "time": strftime("%a, %d %b %Y %H:%M:%S", gmtime())
    }
    return render(request,'displayapp/index.html', context)


# Create your views here.
