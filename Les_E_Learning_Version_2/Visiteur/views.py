from django.shortcuts import render

# Create your views here.
def Accueil(request):
     return render(request, "Visiteur/index.html")
 
def About(request):
     return render(request, "Visiteur/about.html")

def Contact(request):
     return render(request, "Visiteur/contact.html")
