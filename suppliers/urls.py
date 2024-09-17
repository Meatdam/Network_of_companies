from rest_framework import routers

from suppliers.apps import SuppliersConfig
from suppliers.views import SupplierViewSet

app_name = SuppliersConfig.name

router = routers.DefaultRouter()
router.register(r"supplier", SupplierViewSet, basename="supplier")

urlpatterns = [] + router.urls
