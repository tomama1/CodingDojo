from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index),
    url(r'add$', views.add),
    url(r'delete/(?P<id>\d+)$', views.delete),
    url(r'goback$', views.goback),
    url(r'delete_process/(?P<id>\d+)$', views.delete_process),
    url(r'search$', views.search),
]
