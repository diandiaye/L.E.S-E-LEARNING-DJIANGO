from django.shortcuts import render, redirect, reverse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from Membre.models import *
from .models import *
from .forms import *
from django.utils.text import slugify 
from django.db.models import Q



def Cours_niveau(request):
    niveau = Membre.objects.values('niveau').distinct()
    som = niveau.count()
    paginator = Paginator(niveau, 6)
    page = request.GET.get('page', 1)
    try:
            
            niveau = paginator.page(page)
      
    except PageNotAnInteger:
            niveau = paginator.page(1)
    except EmptyPage:
            niveau = paginator.page(paginator.num_pages)
    return render(request, "Cours/cours_niveau.html", locals())

def Cours_module(request, niveau):
    
    categorie = Cours.objects.filter(niveau = niveau).values('categorie').distinct()
    som = categorie.count()
    paginator = Paginator(categorie, 6)
    page = request.GET.get('page', 1)
    try:
            
            categorie = paginator.page(page)
      
    except PageNotAnInteger:
            categorie = paginator.page(1)
    except EmptyPage:
            categorie = paginator.page(paginator.num_pages)
            
    return render(request, "Cours/cours_module.html", locals())


def Cours_liste(request, niveau, categorie):
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
    cours = Cours.objects.get(Q(titre = titre), Q(niveau = niveau), Q(categorie = categorie))
    documents = Documents_Cours.objects.filter(Q(cours = cours))
    som = documents.count()
    
    enrollCours = {
             'membre' : request.user.membre.id,
             'cours' : cours.id   
     }
    form = Membre_Cours_Form(enrollCours)
    form.save()
     
    paginator = Paginator(documents, 5)
    page = request.GET.get('page', 1)
    try:
            
            documents = paginator.page(page)
      
    except PageNotAnInteger:
            documents = paginator.page(1)
    except EmptyPage:
            documents = paginator.page(paginator.num_pages)
    return render(request, "Cours/cours-details.html", locals())


    
def Tableau_bord(request):
        
     return render(request, "Cours/tableau_bord.html")

        