
from django.contrib import admin
from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [

    path('',views.Cours_niveau, name = "Cours_niveau" ),
    path('cm2/categorie',views.Cours_cat, name = "Cours_cat" ),
    path('cours_details',views.Cours_details, name = "Cours_details" ),
    path('cours/liste',views.Cours_liste, name = "Cours_liste" ),
    
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
