from django.shortcuts import render, redirect

# Create your views here.

def index(request):
    return render(request, 'surveyapp/index.html')

def process(request):
    if 'count' not in request.session:
        request.session['count'] = 1
    else:
        request.session['count'] += 1

    request.session['name'] = request.POST['name']
    request.session['location'] = request.POST['location']
    request.session['language'] = request.POST['language']
    request.session['comment'] = request.POST['comment']
    return redirect('/result')

def result(request):
    return render(request, 'surveyapp/result.html')

def goback(request):
    return redirect("/")