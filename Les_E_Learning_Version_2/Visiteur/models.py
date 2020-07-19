from django.db import models

# Create your models here.
class Annonces(models.Model):
    titre = models.CharField(max_length=50)
    categorie = models.CharField(max_length=50)
    contenu = models.TextField()
    date = models.DateTimeField(auto_now=False, auto_now_add=False)
    
class Documents(models.Model):
    nom = models.CharField(max_length=50)
    format_fichier = models.CharField(max_length=50)
    fichier = models.FileField(upload_to=None, max_length=100)
    annonces = models.ForeignKey(Annonces, on_delete=models.CASCADE)