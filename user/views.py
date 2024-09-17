
from rest_framework import viewsets
from rest_framework.permissions import AllowAny, IsAuthenticated

from user.models import User
from user.permissions import IsUser
from user.serializers import UserSerializer, UserListSerializer


class UserViewSet(viewsets.ModelViewSet):
    """User view set."""
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def get_permissions(self):
        """Checking user access."""
        if self.action == "create":
            self.permission_classes = [AllowAny]
            self.serializer_class = UserSerializer
        if self.action in ["list"]:
            self.permission_classes = [IsAuthenticated]
            self.serializer_class = UserListSerializer
        if self.action in ["retrieve"]:
            self.permission_classes = [IsAuthenticated, IsUser]
            self.serializer_class = UserSerializer
        if self.action in ["update", "partial_update", "destroy"]:
            self.permission_classes = [IsAuthenticated, IsUser]
            self.serializer_class = UserSerializer
        return super().get_permissions()

    def perform_create(self, serializer):
        """Hashes the password created during registration."""
        instance = serializer.save(is_active=True)
        instance.set_password(instance.password)
        instance.save()

    def perform_update(self, serializer):
        """Hashes the edited password."""
        instance = serializer.save()
        instance.set_password(instance.password)
        instance.save()
