from django.shortcuts import render, HttpResponse, redirect
from time import gmtime, strftime
import datetime

def index(request):
    now = datetime.datetime.now()
    context = {
        "time": datetime.datetime.now()
    }
    return render(request,'displayapp/index.html', context)


# Create your views here.
