from __future__ import unicode_literals
from django.db import models

class Dojo(models.Model):
    name = models.CharField(max_length=255)
    city = models.CharField(max_length=255)
    state = models.CharField(max_length=2)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __repr__(self):
        return "<{} {},{}>".format(self.name, self.city, self.state)
    def __str__(self):
        return "<{} {} {}>".format(self.name, self.city, self.state)
class Ninja(models.Model):
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    dojo = models.ForeignKey(Dojo, related_name = "ninjas")
    def __repr__(self):
        return "<Name: {} {}>".format(self.first_name, self.last_name)
    def __str__(self):
        return "<{} {}>".format(self.first_name, self.last_name)