from django.http import HttpResponse
from django.views.generic import View
from Blog_Forum.models import *
from Les_E_Learning_Version_2.utils import render_to_pdf 
from django.shortcuts import render,get_object_or_404

from django.http import HttpResponse
from django.views.generic import View

from .utils import render_to_pdf 

class GeneratePdf(View):
    def get(self, request,id,*args, **kwargs):
        pm = Poeme.objects.get(id=id)
        data = {
            'pm':pm,
        }
        pdf = render_to_pdf('Blog_Forum/single_poeme.html', data)
        return HttpResponse(pdf, content_type='application/pdf')