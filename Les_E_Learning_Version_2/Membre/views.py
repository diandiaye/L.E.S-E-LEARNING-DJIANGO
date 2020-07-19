from django.shortcuts import render

# Create your views here.

def OuvrirCompte(request):
    return render(request, 'Membre/ouvrirCompte.html')

def Connection(request):
    return render(request, 'Membre/connection.html')