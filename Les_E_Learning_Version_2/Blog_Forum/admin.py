from django.contrib import admin
from Blog_Forum.models import *

class PostAdmin(admin.ModelAdmin):
    list_display = ("author","title","photo","created","updated")

class CommentAdmin(admin.ModelAdmin):
    list_display = ("post","user","added")

class TagAdmin(admin.ModelAdmin):
    list_display = ("word",)

admin.site.register(Post,PostAdmin)
admin.site.register(Comments,CommentAdmin)
admin.site.register(Tag,TagAdmin)

