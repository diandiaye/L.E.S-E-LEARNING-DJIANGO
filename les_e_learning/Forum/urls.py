from django.contrib import admin
from django.urls import path, include
from Forum import views

urlpatterns = [
    path("blog",views.posts,name="home"),
    path("detail_publication/<int:id>",views.detail_post,name="detail_post"),
    path("like_post",views.like_post,name="like_post")
]
