from django.db import models


class User(models.Model):
    image = models.CharField(max_length=200, default='')

    def __str__(self):
        return self.image


class Crowd(models.Model):
    image = models.CharField(max_length=200, default='')

    def __str__(self):
        return self.image
