from django.db import models
from django.contrib.auth.models import User


# Les tags (mots-clés)
class Tag(models.Model):
    word = models.CharField(max_length=300)

    def __str__(self):
        return self.word
    
# Les publications 
class Post(models.Model):
    catgs = (
        ("Réalisations","réalisations"),
        ("E-learning","e-learning"),
        ("Activités","activités")
    )
    author = models.ForeignKey(User,on_delete=models.CASCADE)
    title = models.CharField(max_length=250)
    content = models.TextField()
    photo = models.ImageField(upload_to="posts/")
    created = models.DateTimeField(auto_now=True)
    updated = models.DateTimeField(auto_now_add=True)
    likes = models.ManyToManyField(User,related_name="like")
    tags = models.ManyToManyField(Tag,related_name="tags")
    categorie = models.CharField(max_length=15,choices=catgs,null=True)

    def __str__(self):
        return self.author.username

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
    