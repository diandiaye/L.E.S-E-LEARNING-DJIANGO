from django.db import models
from Membre.models import *
from Visiteur.models import *

# Create your models here.
class Cours(models.Model):
    titre = models.CharField(max_length=50)
    description = models.TextField()
    categorie = models.CharField(max_length=50)
    niveau = models.CharField(max_length=50)
    def __str__(self):
        return self.titre
    
class Membre_Cours(models.Model):
    membre = models.ForeignKey(Membre, on_delete=models.CASCADE)
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    
class Documents_Cours(models.Model):
    nom = models.CharField(max_length=50)
    format_fichier = models.CharField(max_length=50)
    fichier = models.FileField(upload_to='', max_length=100)
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    def __str__(self):
        return self.nom
 