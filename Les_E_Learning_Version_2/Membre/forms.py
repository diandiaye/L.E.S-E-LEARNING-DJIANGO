from .models import *
from django.forms import ModelForm
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

#####################Formulaire Du User#######################         
class  UserForm(UserCreationForm):
    class Meta:
        model=User
        fields=["username","first_name","last_name","email"]
        
    def __init__(self,*args,**kwargs):
            super(UserCreationForm,self).__init__(*args,**kwargs)
            self.fields['username'].widget.attrs['class']='form-control'
            self.fields['first_name'].widget.attrs['class']='form-control'
            self.fields['last_name'].widget.attrs['class']='form-control'
            self.fields['email'].widget.attrs['class']='form-control'
            self.fields['password1'].widget.attrs['class']='form-control' 
            self.fields['password2'].widget.attrs['class']='form-control'             
            self.fields['username'].help_text=''
            self.fields['password1'].help_text=''
            self.fields['password2'].help_text=''
######################Formulaire pour completer le premier##########################
class MembreForm(ModelForm):
    class Meta:
        model=Membre
        fields=["niveau"]
    def __init__(self, *args, **kwargs):
        super(ModelForm, self).__init__(*args, **kwargs)
        self.fields['niveau'].widget.attrs['class']="form-control"
class ConnectForm(forms.Form):
    username=forms.CharField(max_length=50)
    password=forms.CharField(widget=forms.PasswordInput())

    def __init__(self,*args,**kwargs):
        super(ConnectForm,self).__init__(*args,**kwargs)
        self.fields['username'].widget.attrs['class']='form-control'
        self.fields['password'].widget.attrs['class']='form-control'
class ModifForm(forms.Form):
    email=forms.EmailField()
    username=forms.CharField(max_length=50)
    password=forms.CharField(widget=forms.PasswordInput())  
    
    def __init__(self,*args,**kwargs):
        super(ModifForm,self).__init__(*args,**kwargs)
        self.fields['username'].widget.attrs['class']='form-control'
        self.fields['password'].widget.attrs['class']='form-control'     
        self.fields['email'].widget.attrs['class']='form-control'   
    