from django.db import models
from django.contrib.auth.models import User

class Membre(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    niveau = models.CharField(max_length=50)

    def __unicode__(self, ):
        return self.user.username  

