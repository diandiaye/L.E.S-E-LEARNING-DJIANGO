from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from Membre.models import *

# Create your views here.

def Cours_niveau(request):
    return render(request, "Cours/course_niveau.html")

def Cours_cat(request):
    categorie = Cours.objects.values('categorie').distinct()
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


def Cours_liste(request):
    cours = Cours.objects.all()
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

def Cours_details(request):
    return render(request, "Cours/course_details.html")

