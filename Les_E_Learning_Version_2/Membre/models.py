from django.db import models
from django.contrib.auth.models import User

class Membre(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    niveau = models.CharField(max_length=50)
<<<<<<< HEAD
    def __str__(self):
            return self.user.username
    
=======
    def __unicode__(self, ):
        return self.user.username  
>>>>>>> 5e67fc755225c7bdda9363cc838d3bda9669748a
