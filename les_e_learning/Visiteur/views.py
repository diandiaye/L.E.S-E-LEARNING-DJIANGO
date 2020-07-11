from django.shortcuts import render

# Create your views here.

def Accueil(request):
     return render(request, "Visiteur/index.html")
 
 
def Signup(request):
     return render(request, "Visiteur/signup.html")
 
def About(request):
     return render(request, "Visiteur/about.html")