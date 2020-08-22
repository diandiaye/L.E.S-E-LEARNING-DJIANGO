from django.db import models
from django.contrib.auth.models import User

# Les tags (mots-clés)
class Tag(models.Model):
    word = models.CharField(max_length=250)

    def __str__(self):
        return self.word
    
# Les publications 
class Post(models.Model):
    catgs = (
        ("Réalisations","réalisations"),
        ("E-learning","e-learning"),
        ("Activités","activités")
    )
    author_name = models.CharField(blank=True, null=True, max_length=50)
    author_desc = models.CharField(blank=True, null=True, max_length=100)
    title = models.CharField(max_length=250)
    content = models.TextField()
    photo = models.ImageField(upload_to="posts/")
    created = models.DateTimeField(auto_now=True)
    updated = models.DateTimeField(auto_now_add=True)
    likes = models.ManyToManyField(User,related_name="like")
    tags = models.ManyToManyField(Tag,related_name="tags")
    categorie = models.CharField(max_length=15,choices=catgs,null=True)

    def __str__(self):
        return self.author_name

    def total_likes(self):
        return self.likes.count()

# Les commentaires 
class Comments(models.Model):
    post = models.ForeignKey(Post,on_delete=models.CASCADE)
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    comment_content = models.TextField()
    added = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.user.username


############################### Forum ##################################

class Message(models.Model):
    sjt = (
        ("Politique","politique"),
        ("Education","education"),
        ("Economie","économie"),
        ("Santé","santé"),
        ("Sport","sport"),
        ("Religion","religion")
    )
    subjet = models.CharField(max_length=10,choices=sjt)
    message = models.TextField()
    likes = models.ManyToManyField(User,related_name="likes_message")
    added = models.DateTimeField(auto_now=True)
    author = models.ForeignKey(User,on_delete=models.CASCADE)

    def total_likes(self):
        return self.likes.count()

    def __str__(self):
        return self.author.username

class Reponse(models.Model):
    message = models.ForeignKey(Message,on_delete=models.CASCADE)
    author = models.ForeignKey(User,on_delete=models.CASCADE)
    reponse = models.TextField()
    added = models.DateTimeField(auto_now=True)
    likes = models.ManyToManyField(User,related_name="likes_reponse")

    def __str__(self):
        return self.message.subjet
    
    def total_likes(self):
        return self.likes.count()

############################## Belles plumes ##################################

# Les poemes 
class Poeme(models.Model):
    titre = models.CharField(max_length=300)
    contenu = models.TextField()
    author_name = models.CharField(blank=True, null=True, max_length=50)
    author_desc = models.CharField(blank=True, null=True, max_length=100)
    

    def __str__(self):
        return self.titre
