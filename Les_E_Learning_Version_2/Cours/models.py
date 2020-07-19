from django.db import models
from Membre.models import *

# Create your models here.
class Cours(models.Model):
    titre = models.CharField(max_length=50)
    description = models.TextField()
    categorie = models.CharField(max_length=50)
    niveau = models.CharField(max_length=50)
    
class Membre_Cours(models.Model):
    enroll_date = models.DateTimeField(auto_now=False, auto_now_add=False)
    impression = models.TextField()
    nombre_like = models.IntegerField()
    nombre_dislike = models.IntegerField()
    Membre = models.ForeignKey(Membre, on_delete=models.CASCADE)
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)