"""Les_E_Learning_Version_2 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from . import views
from .views import *
from django.conf.urls import handler404
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from .views import GeneratePdf




urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('Visiteur.urls')),
    path('blog/', include('Blog_Forum.urls')),
    path('compte/', include('Membre.urls')),
    path('cours/', include('Cours.urls')),
    path('blog/poeme/<int:id>',GeneratePdf.as_view(),name="single_poeme")
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)



handler404 = "Les_E_Learning_Version_2.views.handler404"
handler500 = "Les_E_Learning_Version_2.views.handler500"