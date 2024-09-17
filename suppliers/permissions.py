from rest_framework import permissions


class IsSupplierOwner(permissions.BasePermission):
    """Checks if the user is the owner of the supplier."""
    def has_object_permission(self, request, view, obj):
        if obj.owner == request.user:
            return True
        return False
