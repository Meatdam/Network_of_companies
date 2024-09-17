from rest_framework import serializers

from user.models import User


class UserSerializer(serializers.ModelSerializer):
    """User model serializer."""
    class Meta:
        model = User
        fields = ("email", "password",)


class UserListSerializer(serializers.ModelSerializer):
    """User list serializer."""
    class Meta:
        model = User
        fields = ("email",)
