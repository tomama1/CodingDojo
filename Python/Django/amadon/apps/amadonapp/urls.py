from django.conf.urls import url
from . import views
urlpatterns = [
    url(r'^$', views.index),
    url(r'tshirtprocess$', views.tshirtprocess),
    url(r'sweaterprocess$', views.sweaterprocess),
    url(r'cupprocess$', views.cupprocess),
    url(r'checkout$', views.checkout),
    url(r'goback',views.goback)
]