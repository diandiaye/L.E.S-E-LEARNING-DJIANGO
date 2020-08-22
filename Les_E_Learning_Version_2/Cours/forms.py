from django.forms import ModelForm
from .models import *

class Membre_Cours_Form(ModelForm):
    class Meta:
       model = Membre_Cours
       fields = ['membre', 'cours']
       
       
       
# class LikeCours_Form(ModelForm):
#     class Meta:
#        model = LikeCours
#        fields = ['membre', 'cours']
       
