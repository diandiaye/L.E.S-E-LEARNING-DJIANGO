from django.db import models
from django.contrib.auth.models import User

class Membre(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    niveau = models.CharField(max_length=50)
    
class Cours(models.Model):
    titre = models.CharField(max_length=50)
    # description = models.TextField()
    categorie = models.CharField(max_length=50)
    niveau = models.CharField(max_length=50)
    
class Membre_Cours(models.Model):
    enroll_date = models.DateTimeField(auto_now=False, auto_now_add=False)
    impression = models.TextField()
    nombre_like = models.IntegerField()
    nombre_dislike = models.IntegerField()
    Membre = models.ForeignKey(Membre, on_delete=models.CASCADE)
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    
class Annonces(models.Model):
    titre = models.CharField(max_length=50)
    categorie = models.CharField(max_length=50)
    contenu = models.TextField()
    date = models.DateTimeField(auto_now=False, auto_now_add=False)
    
class Documents(models.Model):
    nom = models.CharField(max_length=50)
    format_fichier = models.CharField(max_length=50)
    fichier = models.FileField(upload_to=None, max_length=100)
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    annonces = models.ForeignKey(Annonces, on_delete=models.CASCADE)
    
class Post(models.Model):
    thematique = models.CharField(max_length=50)
    contenu = models.CharField(max_length=50)
    
class Commentaire(models.Model):
    contenu = models.TextField()
    Membre = models.ForeignKey(Membre, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    
    

    
    
    
