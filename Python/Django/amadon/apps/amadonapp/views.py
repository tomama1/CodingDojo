from django.shortcuts import render, redirect
import math

# Create your views here.
def index(request):
    if 'shoppingcart' not in request.session:
        request.session['shoppingcart'] = int(0)
    if 'totalcost' not in request.session:
        request.session['totalcost'] = 0
    return render(request, 'amadonapp/index.html')

def tshirtprocess(request):
    price = float(request.POST['tshirt'])
    numitems = float(request.POST['tshirtquantity'])
    totalprice = price * numitems/100
    request.session['shoppingcart'] += int(numitems)
    totalcost = float(request.session['totalcost'])
    request.session['totalcost'] = totalcost+ totalprice
    request.session['curritem'] = totalprice
    return redirect('/checkout')

def sweaterprocess(request):
    price = float(request.POST['sweater'])
    numitems = float(request.POST['sweaterquantity'])
    totalprice = price * numitems/100
    request.session['shoppingcart'] += int(numitems)
    totalcost = float(request.session['totalcost'])
    request.session['totalcost'] = totalcost+ totalprice
    request.session['curritem'] = totalprice
    return redirect('/checkout')

def cupprocess(request):
    price = float(request.POST['cup'])
    numitems = float(request.POST['cupquantity'])
    totalprice = price * numitems/100
    request.session['shoppingcart'] += int(numitems)
    totalcost = float(request.session['totalcost'])
    request.session['totalcost'] = totalcost+ totalprice
    request.session['curritem'] = totalprice
    return redirect('/checkout')

def checkout(request):
    return render(request, 'amadonapp/checkout.html')

def goback(request):
    return redirect('/')

