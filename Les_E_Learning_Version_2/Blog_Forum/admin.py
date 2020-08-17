from django.contrib import admin
from Blog_Forum.models import *

class PostAdmin(admin.ModelAdmin):
    list_display = ("author_name","title","photo","created","updated")

class CommentAdmin(admin.ModelAdmin):
    list_display = ("post","user","added")

class TagAdmin(admin.ModelAdmin):
    list_display = ("word",)

class PoemeAdmin(admin.ModelAdmin):
    list_display = ("author_name","titre","id")

class MessageAdmin(admin.ModelAdmin):
    list_display = ("author","subjet","added")

class ReponseAdmin(admin.ModelAdmin):
    list_display = ("message","author","added")

admin.site.register(Post,PostAdmin)
admin.site.register(Comments,CommentAdmin)
admin.site.register(Tag,TagAdmin)
admin.site.register(Poeme,PoemeAdmin)
admin.site.register(Message,MessageAdmin)
admin.site.register(Reponse,ReponseAdmin)

