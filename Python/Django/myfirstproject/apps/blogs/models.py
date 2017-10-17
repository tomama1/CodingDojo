from __future__ import unicode_literals

from django.db import models

# Create your models here.
class User(models.Model):
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    email_address = models.CharField(max_length=255)
    age = models.SmallIntegerField()
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)
    def __repr__(self):
        return "<{} {} Age:{} {}>".format(self.first_name, self.last_name, self.age, self.id)
    def __str__(self):
        return "<Blog object: {} {}>".format(self.first_name, self.last_name)



    