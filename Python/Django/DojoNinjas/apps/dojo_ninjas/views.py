from django.shortcuts import render, HttpResponse
from .models import Dojo, Ninja

def index(request):

    a = Dojo.objects.create(name="CodingDojo Silicon Valley", city="Moutain View", state="CA")
    b = Dojo.objects.create(name="CodingDojo Seattle", city="Seattle", state="WA")
    c = Dojo.objects.create(name="CodingDojo New York", city="New York", state="NY")
    Ninja.objects.create(first_name="Matthew", last_name="Toma", dojo=a)

    return HttpResponse("New Data Model !")