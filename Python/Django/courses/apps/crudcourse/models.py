from __future__ import unicode_literals

from django.db import models


class Course(models.Model):
    name = models.CharField(max_length=255, default="0000")
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    def __str__(self):
        return "<{} {}>".format(self.name,self.created_at)

class Description(models.Model):
    description = models.TextField()
    course = models.OneToOneField(Course, primary_key=True)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    
    def __str__(self):
        return "{}".format(self.description)