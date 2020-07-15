from django.shortcuts import render

# Create your views here.

def Cours(request):
    return render(request, "Cours/courses.html")

def Cours_details(request):
    return render(request, "Cours/course_details.html")