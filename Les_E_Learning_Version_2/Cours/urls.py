from django.contrib import admin
from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    
    # path('<str:niveau>/<str:categorie>/<str:titre>',views.Cours_Feedback, name = "Cours_Feedback" ),

    path('',views.Cours_niveau, name = "Cours_niveau" ),
    path('tableau_de_bord/<int:id>',views.Delete_cours, name = "Delete_cours" ),
    path('tableau_de_bord',views.Tableau_bord, name = "Tableau_bord" ),
    path('<str:niveau>',views.Cours_module, name = "Cours_module" ),
    path('<str:niveau>/<str:categorie>',views.Cours_liste, name = "Cours_liste" ),
    path('<str:niveau>/<str:categorie>/<str:titre>',views.Cours_details, name = "Cours_details" ),
    
    
    
  
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
