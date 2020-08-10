from django.contrib import admin

# Register your models here.
from .models import Newsletter


class newsletterAdmin(admin.ModelAdmin):
    list_display = ('email', 'date_added')


admin.site.register(Newsletter,newsletterAdmin)
