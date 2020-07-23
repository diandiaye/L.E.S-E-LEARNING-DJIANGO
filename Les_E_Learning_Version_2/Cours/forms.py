from django.forms import ModelForm
from .models import *

class Membre_Cours_Form(ModelForm):
    class Meta:
       model = Membre_Cours
       fields = ['membre', 'cours']
       
       
       
       
