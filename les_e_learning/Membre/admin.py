from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Membre)
admin.site.register(Annonces)
admin.site.register(Documents)
admin.site.register(Post)
admin.site.register(Commentaire)
admin.site.register(Cours)
admin.site.register(Membre_Cours)