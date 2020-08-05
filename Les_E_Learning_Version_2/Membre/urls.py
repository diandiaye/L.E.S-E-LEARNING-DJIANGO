
from django.contrib import admin
from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [

    path('',views.OuvrirCompte, name = "OuvrirCompte" ),
    path('connection',views.Connection, name = "Connection" ),
    path('logout',views.Logout,name='Logout'),
    path('modif',views.ModifProfil,name="Modifier"),
    
]+  static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)