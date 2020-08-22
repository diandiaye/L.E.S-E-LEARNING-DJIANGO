from django.shortcuts import render, redirect, HttpResponse
from .forms import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth import login, authenticate,logout
from django.contrib.auth.forms import UserChangeForm

# Create your views here.
###################Inscription###########################""""
def OuvrirCompte(request):
    if request.method=="POST":
        form0=UserForm(request.POST)
        form1=MembreForm(request.POST)
        if all((form0.is_valid(),form1.is_valid())):
            user=form0.save()
            newform=form1.save(commit=False)
            newform.user=user
            newform.save()
            return redirect("Connection")
    form0=UserForm()
    form1=MembreForm()       
    return render(request, 'Membre/ouvrirCompte.html',locals())
##########################La connection#########################""
def Connection(request):
    if request.method=='POST':
        form=ConnectForm(request.POST)
        if form.is_valid():
            username=form.cleaned_data['username']
            password=form.cleaned_data['password']
            user=authenticate(request, username=username, password=password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return redirect('Cours_niveau')
    form=ConnectForm()        
    return render(request, 'Membre/connection.html',locals())
def Logout(request):
    logout (request)
    return redirect('Accueil')
def ModifProfil(request):
    if request.method=='POST':
        form=ModifForm(request.POST)
        if form.is_valid():
            password=form.cleaned_data['password']
            username=form.cleaned_data['username']
            email=form.cleaned_data['email']
            user=User.objects.get(email=email)
            user.username=username
            user.set_password(password) 
            user.save()  
            messages.success(request,"vos informations ont bien été modifiées")   
            return redirect('Connection')    
        
    form=ModifForm()
    return render(request, 'Membre/profil.html', locals())
def ResetPassword(request):
    if request.method=='POST':
        form=ResetForm(request.POST)
        if form.is_valid():
            password=form.cleaned_data['password']
            email=form.cleaned_data['email']
            user=User.objects.get(email=email)
            user.set_password(password) 
            user.save()  
            messages.success(request,"votre mot de passe a bien été modifié")   
            return redirect('Connection')    
        
    form=ResetForm()
    return render(request, 'Membre/password.html', locals())