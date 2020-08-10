from django import forms
from .models import Newsletter


class ContactForm(forms.Form):
    name = forms.CharField(max_length=100)
    email = forms.EmailField()
    subject = forms.CharField(max_length=200)
    message = forms.CharField(widget=forms.Textarea)


class Newsletterform(forms.ModelForm):
    class Meta:
        model = Newsletter
        fields = ['email']

    def clean_email(self):
        email = self.cleaned_data.get('email')
        return email
