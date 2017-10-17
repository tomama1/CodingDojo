from __future__ import unicode_literals

from django.db import models

# Create your models here.
class User(models.Model):
    firstname = models.CharField(max_length=30)
    lastname = models.CharField(max_length=30)
    email = models.CharField(max_length=50)
    password = models.CharField(max_length=255, default="000")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return "<{}{} {}>".format(self.firstname,self.lastname,self.created_at)