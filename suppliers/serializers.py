from rest_framework import serializers

from suppliers.models import Supplier


class SupplierSerializer(serializers.ModelSerializer):
    """Supplier object serializer."""

    class Meta:
        model = Supplier
        fields = "__all__"


class SupplierUpdateSerializer(serializers.ModelSerializer):
    """Supplier update object serializer."""
    class Meta:
        model = Supplier
        fields = ('company_customer', 'supplier_company')


class SupplierListSerializer(serializers.ModelSerializer):
    """Supplier list object serializer."""
    class Meta:
        model = Supplier
        fields = ('supplier_name', 'owner', 'id')
