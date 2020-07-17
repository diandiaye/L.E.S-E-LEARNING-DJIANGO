from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from Membre.models import *
from django.utils.text import slugify 
from django.db.models import Q

# Create your views here.

def Cours_niveau(request):
    niveau = Membre.objects.all().distinct()
    return render(request, "Cours/course_niveau.html", locals())

def Cours_cat(request, niveau):
    
    categorie = Cours.objects.filter(niveau = niveau)
    som = categorie.count()
    paginator = Paginator(categorie, 5)
    page = request.GET.get('page', 1)
    try:
            
            categorie = paginator.page(page)
      
    except PageNotAnInteger:
            categorie = paginator.page(1)
    except EmptyPage:
            categorie = paginator.page(paginator.num_pages)
            
    return render(request, "Cours/courses.html", locals())


def Cours_liste(request, niveau, categorie):
    niveau = niveau
    categorie = categorie
    cours = Cours.objects.filter(Q(niveau = niveau), Q(categorie = categorie))
    som = cours.count()
    paginator = Paginator(cours, 12)
    page = request.GET.get('page', 1)
    try:
            
            cours = paginator.page(page)
      
    except PageNotAnInteger:
            cours = paginator.page(1)
    except EmptyPage:
            cours = paginator.page(paginator.num_pages)
            
    return render(request, "Cours/cours_liste.html", locals())

def Cours_details(request,niveau, categorie, titre):
    niveau = niveau
    categorie = categorie
    cours = Cours.objects.filter(Q(titre = titre), Q(niveau = niveau), Q(categorie = categorie))
    return render(request, "Cours/course_details.html", locals())

