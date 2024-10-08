from django.contrib import admin

from user.models import User


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    """User administration interface for admin."""
    list_display = ('id', 'username', 'first_name', 'last_name', 'email', 'is_active', 'is_staff',
                    'is_superuser')
