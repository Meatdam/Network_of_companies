from django.contrib import admin

from suppliers.models import Supplier


def clear_debt(queryset):
    for obj in queryset:
        obj.debt = 0
        obj.save()


clear_debt.short_description = "Очистить задолженность"

fields_display = [
    'supplier_name',
    'debt',
    'company_customer',
    'supplier_company',
    'owner',
]


@admin.register(Supplier)
class SupplierAdmin(admin.ModelAdmin):
    """Admin interface for supplier."""
    list_display = fields_display
    actions = [clear_debt]
