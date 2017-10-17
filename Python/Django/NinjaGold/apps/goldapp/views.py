from django.shortcuts import render, redirect 
import random
import time

# Create your views here.
def index(request):
    if 'activities' not in request.session:
        request.session['activities'] = [0]

    if 'gold' not in request.session:
        request.session['gold'] = 0
    return render(request, 'goldapp/index.html')

def process_money(request, place_id):
    if place_id == 'farm':
        num = random.randrange(10,21)
        request.session['gold'] += num
        currentlist = request.session['activities']
        currentlist.insert(0,str(time.strftime("%H:%M:%S"))+" Earned {} gold from the farm!".format(num))
        request.session['activities'] = currentlist

    elif place_id == 'cave':
        num = random.randrange(5,11)
        request.session['gold'] += num
        currentlist = request.session['activities']
        currentlist.insert(0,str(time.strftime("%H:%M:%S"))+" Earned {} gold from the cave!".format(num))
        request.session['activities'] = currentlist

    elif place_id == 'house':
        num = random.randrange(2,6)
        request.session['gold'] += num
        currentlist = request.session['activities']
        currentlist.insert(0,str(time.strftime("%H:%M:%S"))+" Earned {} gold from the house!".format(num))
        request.session['activities'] = currentlist

    elif place_id == 'casino':
        num = random.randrange(10,21)
        wl = random.randrange(0,2)
        if wl == 0:
            request.session['gold'] += num
            currentlist = request.session['activities']
            currentlist.insert(0,str(time.strftime("%H:%M:%S"))+" Entered a casino and won {} gold!".format(num))
            request.session['activities'] = currentlist
        else:
            request.session['gold'] -= num
            currentlist = request.session['activities']
            currentlist.insert(0,str(time.strftime("%H:%M:%S"))+" Entered a casino and lost {} gold!".format(num))
            request.session['activities'] = currentlist

    return redirect('/')
    