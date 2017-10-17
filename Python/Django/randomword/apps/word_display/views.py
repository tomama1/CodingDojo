from django.shortcuts import render
from django.utils.crypto import get_random_string


def index(request):
    if 'count' not in request.session:
        request.session['count'] = 0
    else:
        request.session['count'] = request.session['count'] + 1
    randomword = str(get_random_string(length=14))
    tempdict = {'randomword': randomword}
    return render(request, 'word_display/index.html', tempdict)
