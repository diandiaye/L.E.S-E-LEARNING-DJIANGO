from django.contrib import admin
from django.urls import path, include
from Blog_Forum import views

urlpatterns = [
    path("home",views.posts,name="list_posts"),
    path("publication/<int:id>",views.detail_post,name="detail_post"),
    path("like_post",views.like_post,name="like_post")
]
