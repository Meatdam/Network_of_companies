from rest_framework import serializers

from company.models import Company


class CompanySerializer(serializers.ModelSerializer):
    """Company object serializer."""

    class Meta:
        model = Company
        fields = "__all__"


class CompanyListSerializer(serializers.ModelSerializer):
    """Company list object serializer."""

    class Meta:
        model = Company
        fields = ("id", "name", "email", "country", "city", "street", "house_number", "owner")


class CompanyDetailSerializer(serializers.ModelSerializer):
    """Company detail object serializer."""

    class Meta:
        model = Company
        fields = "__all__"


class CompanyUpdateSerializer(serializers.ModelSerializer):
    """Company update object serializer."""

    class Meta:
        model = Company
        fields = "__all__"
