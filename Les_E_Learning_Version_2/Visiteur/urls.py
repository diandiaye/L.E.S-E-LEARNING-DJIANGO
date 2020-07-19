
from django.contrib import admin
from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [

    path('', views.Accueil, name = "Accueil" ),
    path('about', views.About, name = "About" ),
    path('contact/',views.Contact, name = "Contact" ),
    
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
