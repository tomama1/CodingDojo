from django.shortcuts import render, redirect
from datetime import date, datetime
# Create your views here.
def index(request):
    return render(request, "words/index.html")

def process(request):
    word = request.POST['word']
    color = request.POST['color']
    size = request.POST['size']
    if 'messages' not in request.session:
        request.session['messages'] = []
    messages = request.session['messages']
    messages.insert(0,[word,color,size,str(datetime.now())])
    request.session['messages'] = messages
    print messages[0][1]
    return redirect('/')

def clear(request):
    request.session.clear()
    return redirect('/')