from django.db import models

from company.models import Company
from user.models import User

NULLABLE = {'blank': True, 'null': True}


class Supplier(models.Model):
    """Supplier model."""
    supplier_name = models.CharField(max_length=100, verbose_name='Имя компании поставщика', **NULLABLE)
    debt = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='Задолженность')
    create_date = models.DateTimeField(auto_now_add=True, verbose_name='Дата создания')
    company_customer = models.IntegerField(verbose_name='Компания заказчик')
    supplier_company = models.ForeignKey(to=Company, on_delete=models.CASCADE, verbose_name='Компания поставщик')
    owner = models.ForeignKey(to=User, on_delete=models.CASCADE, verbose_name='Владелец', **NULLABLE)

    def __str__(self):
        return f'{self.debt}'

    class Meta:
        verbose_name = 'Поставщик'
        verbose_name_plural = 'Поставщики'
