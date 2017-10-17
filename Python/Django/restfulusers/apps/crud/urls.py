from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index),
    url(r'add$',views.add),
    url(r'adduser$',views.process_add),
    url(r'^edit/(?P<id>\d+)$',views.edit),
    url(r'edituser/(?P<id>\d+)$', views.process_edit),
    url(r'^delete/(?P<id>\d+)$',views.remove),
    url(r'^show/(?P<id>\d+)$',views.show)
]
