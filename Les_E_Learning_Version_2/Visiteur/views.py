from django.shortcuts import render
from django.http import HttpResponse
from django.core.mail import send_mail

from .forms import ContactForm


# Create your views here.
def Accueil(request):
    return render(request, "Visiteur/index.html")


def About(request):
    return render(request, "Visiteur/about.html")


def Contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            sender_name = form.cleaned_data['name']
            sender_email = form.cleaned_data['email']

            message = "{0} has sent you a new message:\n\n{1}".format(sender_name, form.cleaned_data['message'])
            send_mail('New Enquiry', message, sender_email, ['biranbirane@gmail.com'])

            return HttpResponse('Thanks for contacting us!')
    else:
        form = ContactForm()

    return render(request, 'Visiteur/contact.html', {'form': form})
