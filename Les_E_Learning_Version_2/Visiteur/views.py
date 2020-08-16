from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.core.mail import send_mail
from Cours.models import *
from Membre.models import *
from .models import Newsletter
from .forms import ContactForm
from .forms import Newsletterform


# Create your views here.
def Accueil(request):
    nombre_classes = Niveau.objects.all().count()
    nombre_cours = Cours.objects.all().count()
    nombre_modules = Cours.objects.all().values("categorie").distinct().count()
    nombre_user = Membre.objects.all().count()

    cours_populaires = Cours.objects.all().order_by("-likes").exclude(likes=0).distinct()[:10]
    if request.method == 'POST':
            form = Newsletterform(request.POST)
            if form.is_valid():
                news = form.save(commit = False)
                news.save()
            return redirect('eleve_list')
        else:
            form = EleveCreateForm()
        context = {
            'form': form,
        }
    return render(request, "Visiteur/index.html", locals())


def About(request):
    return render(request, "Visiteur/about.html")


def Contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            sender_name = form.cleaned_data['name']
            sender_email = form.cleaned_data['email']

            message = "{0} has sent you a new message:\n\n{1}".format(sender_name, form.cleaned_data['message'])
            send_mail('New Enquiry', message, sender_email, ['leselitessenegalaises@gmail.com'])

            return HttpResponse('Thanks for contacting us!')
    else:
        form = ContactForm()

    return render(request, 'Visiteur/contact.html', {'form': form})


form})
