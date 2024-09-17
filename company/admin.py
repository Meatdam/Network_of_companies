from django.contrib import admin

from company.models import Company


@admin.register(Company)
class CompanyAdmin(admin.ModelAdmin):
    """Company administration interface for admin."""
    list_display = ('id', 'name', 'email', 'country', 'city', 'type_company', 'house_number', 'street',
                    'owner')
    search_fields = ('city',)
