from django.shortcuts import render, redirect, reverse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from Membre.models import *
from .models import *
from .forms import *
from django.utils.text import slugify 
from django.db.models import Q
import datetime
from django.contrib import messages
from django.contrib.auth.decorators import login_required


@login_required(login_url='/compte/connection')
def Cours_niveau(request):
    niveau = Niveau.objects.all()
    som = niveau.count()
    
    paginator = Paginator(niveau, 6)
    page = request.GET.get('page', 1)
    try:
            
            niveau = paginator.page(page)
      
    except PageNotAnInteger:
            niveau = paginator.page(1)
    except EmptyPage:
            niveau = paginator.page(paginator.num_pages)
            
    
    query_ = request.GET.get("q")
    

    
    if query_:
        query = Niveau.objects.filter(niveau__icontains=query_)
        som_q = query.count()
        
        if som_q !=0:
                messages.success(request,'{0} classes trouvées'.format(som_q))
        if som_q == 0:
                messages.warning(request,'0 classes trouvées')
                
        # paginator = Paginator(query, 1)
        # page = request.GET.get('page', 1)
        # try:
        #     query = paginator.page(page)
        # except PageNotAnInteger:
        #     query = paginator.page(1)
        # except EmptyPage:
        #     query = paginator.page(paginator.num_pages)
 


    return render(request, "Cours/cours_niveau.html", locals())


      

def Cours_module(request, niveau):
    niveau_ = Niveau.objects.get(niveau=niveau)
    niveau_id = niveau_.id
    categorie = Cours.objects.filter(niveau = niveau_id).values('categorie').distinct()
    som = categorie.count()
    paginator = Paginator(categorie, 6)
    page = request.GET.get('page', 1)
    try:
            
            categorie = paginator.page(page)
      
    except PageNotAnInteger:
            categorie = paginator.page(1)
    except EmptyPage:
            categorie = paginator.page(paginator.num_pages)
            
            
    query_ = request.GET.get("q")
    if query_:
        query = Cours.objects.filter(categorie__icontains=query_)
        som_q = query.count()
        
        if som_q !=0:
                messages.success(request,'{0} modules trouvées'.format(som_q))
        if som_q == 0:
                messages.warning(request,'0 modules trouvées')
            
    return render(request, "Cours/cours_module.html", locals())


def Cours_liste(request, niveau, categorie):
    niveau = Niveau.objects.get(niveau=niveau)
    niveau_id = niveau.id
    cours = Cours.objects.filter(Q(niveau = niveau_id), Q(categorie = categorie))
    som = cours.count()
    
    cours_populaires = Cours.objects.filter(Q(niveau = niveau_id), Q(categorie = categorie)).order_by("-likes").exclude(likes=0).distinct()[:10]
 
    
    
    

        
    paginator = Paginator(cours, 12)
    page = request.GET.get('page', 1)
    try:
            
            cours = paginator.page(page)
      
    except PageNotAnInteger:
            cours = paginator.page(1)
    except EmptyPage:
            cours = paginator.page(paginator.num_pages)
            
            
    query_ = request.GET.get("q")
    if query_:
        query = Cours.objects.filter(titre__icontains=query_)
        som_q = query.count()
        
        if som_q !=0:
                messages.success(request,'{0} cours trouvées'.format(som_q))
        if som_q == 0:
                messages.warning(request,'0 cours trouvées')
            
 
            

            
    return render(request, "Cours/cours_liste.html", locals())

  


def Cours_details(request,niveau, categorie, titre):
    niveau_ = Niveau.objects.get(niveau=niveau)
    niveau_id = niveau_.id
    cours = Cours.objects.get(Q(titre = titre), Q(niveau = niveau_id), Q(categorie = categorie))
    feedbacks = CoursFeedback.objects.filter(cours=cours).order_by('-id').distinct()
    documents = Documents_Cours.objects.filter(Q(cours = cours))
    som = documents.count()


    
    cours_enroll =Cours.objects.filter(membre_cours__membre__id=request.user.membre.id).distinct()
    
    if Membre_Cours.objects.filter(Q(membre=request.user.membre), Q(cours=cours)).exists():
            messages.error(request,'Vous avez deja suivi le cours !!!')
           
    else:
    
                enrollCours = {
                        'membre' : request.user.membre.id,
                        'cours' : cours.id ,
                       
                }
                form = Membre_Cours_Form(enrollCours)
                form.save()
                
        

    
              
          
    if request.method  == "POST":
           feed = request.POST["feedback"]
           feedB = CoursFeedback()
           
           niveau_ = Niveau.objects.get(niveau=niveau)
           niveau_id = niveau_.id
           cours_feed = Cours.objects.get(Q(titre = titre), Q(niveau = niveau_id), Q(categorie = categorie))

           feedB.feedback = feed
           feedB.membre = request.user.membre
           feedB.cours = cours_feed
     
           feedB.save()
   
    

    paginator = Paginator(documents, 5)
    page = request.GET.get('page', 1)
    try:
            
            documents = paginator.page(page)
      
    except PageNotAnInteger:
            documents = paginator.page(1)
    except EmptyPage:
            documents = paginator.page(paginator.num_pages)
            
    paginator = Paginator(feedbacks, 5)
    page = request.GET.get('page', 1)
    try:
            
            feedbacks = paginator.page(page)
      
    except PageNotAnInteger:
            feedbacks = paginator.page(1)
    except EmptyPage:
            feedbacks = paginator.page(paginator.num_pages)
            
    return render(request, "Cours/cours-details.html", locals())


# def Cours_Feedback(request,niveau, categorie, titre):
        
#      if request.method  == "POST":
#            feed = request.POST["feedback"]
#            feedB = CoursFeedback()
           
#            niveau_ = Niveau.objects.get(niveau=niveau)
#            niveau_id = niveau_.id
#            cours_feed = Cours.objects.get(Q(titre = titre), Q(niveau = niveau_id), Q(categorie = categorie))

#            feedB.feedback = feed
#            feedB.membre = request.user.membre
#            feedB.cours = cours_feed
     
#            feedB.save()
           
#      return redirect(Cours_details, locals())






@login_required(login_url='/compte/connection')
def Tableau_bord(request):
     cours_enroll =Cours.objects.filter(membre_cours__membre__id=request.user.membre.id).distinct()
     som = cours_enroll.count()
     paginator = Paginator(cours_enroll, 4)
     page = request.GET.get('page', 1)
     try:
            
            cours_enroll = paginator.page(page)
      
     except PageNotAnInteger:
            cours_enroll = paginator.page(1)
     except EmptyPage:
            cours_enroll = paginator.page(paginator.num_pages)
        
     return render(request, "Cours/tableau_bord.html", locals())



def Delete_cours(request, id):
        cours_sel = Cours.objects.get(id=id)
        cours_del = Membre_Cours.objects.get(Q(membre=request.user.membre), Q(cours=cours_sel))
        cours_del.delete()
        return redirect(Tableau_bord)

def Like_Cours(request, niveau, categorie, titre ):
    niveau_ = Niveau.objects.get(niveau=niveau)
    niveau_id = niveau_.id
    cours = Cours.objects.get(Q(titre = titre), Q(niveau = niveau_id), Q(categorie = categorie))
    is_liked = False
    if cours.likes.filter(id=request.user.membre.id).exists():
        cours.likes.remove(request.user.membre)
        is_liked = False
    else:
        cours.likes.add(request.user.membre)
        is_liked = True
         
    return render(request, "Cours/cours-details.html", locals())





