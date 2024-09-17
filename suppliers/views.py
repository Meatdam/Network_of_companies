from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from company.models import Company

from suppliers.models import Supplier
from suppliers.permissions import IsSupplierOwner
from suppliers.serializers import SupplierSerializer, SupplierUpdateSerializer, SupplierListSerializer


class SupplierViewSet(viewsets.ModelViewSet):
    """Supplier view set."""
    queryset = Supplier.objects.all()
    serializer_class = SupplierSerializer

    def get_permissions(self):
        """Checking supplier access."""
        if self.action == "create":
            self.permission_classes = [IsAuthenticated]
        if self.action == "list":
            self.permission_classes = [IsAuthenticated]
            self.serializer_class = SupplierListSerializer
        if self.action in ["retrieve"]:
            self.permission_classes = [IsAuthenticated, IsSupplierOwner]
            self.serializer_class = SupplierSerializer
        if self.action in ["update", "partial_update", "destroy"]:
            self.permission_classes = [IsAuthenticated, IsSupplierOwner]
            self.serializer_class = SupplierUpdateSerializer
        return super().get_permissions()

    def perform_create(self, serializer):
        """Before saving the supplier, add the owner."""
        supplier = serializer.save()
        company_customer = Company.objects.get(id=supplier.company_customer)
        supplier.owner = self.request.user
        supplier.owner = self.request.user
        supplier.save()

        if company_customer.type_company == 'individual' or company_customer.type_company == 'retail':
            Company.objects.filter(id=company_customer).update(
                level=2, supplier_company_name=supplier.supplier_company.name,
                supplier_company_id=supplier.supplier_company.id,
            )
            supplier.supplier_name = company_customer.name
            supplier.owner = self.request.user
            supplier.save()
        elif company_customer.type_company == 'factory':
            supplier.supplier_name = company_customer.name
            supplier.save()
            Company.objects.filter(id=company_customer.id).update(
                level=1, supplier_company_name=supplier.supplier_company.name,
                supplier_company_id=supplier.supplier_company.id
            )
        return supplier

    def perform_update(self, serializer):
        """Before saving the supplier, add the owner."""
        supplier = serializer.save()
        company_customer = Company.objects.get(id=supplier.company_customer)

        if company_customer.type_company == 'individual' or company_customer.type_company == 'retail':
            supplier.supplier_name = company_customer.name
            supplier.owner = self.request.user
            supplier.save()
            Company.objects.filter(id=company_customer).update(
                level=2, supplier_company_name=supplier.supplier_company.name,
                supplier_company_id=supplier.supplier_company.id,
            )
        elif company_customer.type_company == 'factory':
            supplier.supplier_name = company_customer.name
            supplier.owner = self.request.user
            supplier.save()
            Company.objects.filter(id=company_customer.id).update(
                level=1, supplier_company_name=supplier.supplier_company.name,
                supplier_company_id=supplier.supplier_company.id
            )
        return supplier
