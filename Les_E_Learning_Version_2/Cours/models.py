from django.db import models
from Membre.models import *
from Visiteur.models import *

# Create your models here.
class Niveau(models.Model):
    niveau = models.CharField(max_length=50)
    photo = models.ImageField(upload_to="./Classes", height_field=None, width_field=None, max_length=None)

    def __str(self):
        return self.niveau



class Cours(models.Model):
    titre = models.CharField(max_length=50)
    description = models.TextField()
    categorie = models.CharField(max_length=50)
    niveau = models.ForeignKey(Niveau, on_delete=models.CASCADE)
    photo = models.ImageField(upload_to="./Cours", height_field=None, width_field=None, max_length=None)
    likes = models.ManyToManyField(Membre, blank=True, null=True)

    def __str__(self):
        return self.titre
    def nombre_likes(self):
            return self.likes.count()



    
class Membre_Cours(models.Model):
    membre = models.ForeignKey(Membre, on_delete=models.CASCADE)
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    
class CoursFeedback(models.Model):
    feedback = models.TextField()
    membre = models.ForeignKey(Membre, on_delete=models.CASCADE)
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    date = models.DateField(auto_now=True, auto_now_add=False)
    

    
   
    
class Documents_Cours(models.Model):
    nom = models.CharField(max_length=50)
    format_fichier = models.CharField(max_length=50)
    fichier = models.FileField(upload_to='', max_length=100)
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    def __str__(self):
        return self.nom
 