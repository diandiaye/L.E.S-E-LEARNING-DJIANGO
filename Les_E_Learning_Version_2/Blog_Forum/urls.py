from django.contrib import admin
from django.urls import path, include
from Blog_Forum import views

urlpatterns = [
    path("home",views.posts,name="list_posts"),
    path("publication/<int:id>",views.detail_post,name="detail_post"),
    path("like_post",views.like_post,name="like_post"),
    path("forum",views.home_forum,name="forum"),
    path("like_msg",views.like_msg,name="like_msg"),
    path("add_message",views.add_message,name="add_message"),
    path("add_reponse/<int:id>",views.add_reponse,name="add_reponse"),
    path("poemes",views.poemes,name="poemes"),
]
