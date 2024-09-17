from django.db import models

from user.models import User

NULLABLE = {'blank': True, 'null': True}

TYPE_ORGANIZATION = [
    ('individual', 'индивидуальный'),
    ('factory', 'завод'),
    ('retail', 'розница'),
]


class Company(models.Model):
    """Company model."""
    name = models.CharField(max_length=255, verbose_name='Название компании', unique=True)
    email = models.EmailField(verbose_name='Email', unique=True)
    country = models.CharField(max_length=255, verbose_name='Страна')
    city = models.CharField(max_length=255, verbose_name='Город')
    street = models.CharField(max_length=255, verbose_name='Улица')
    house_number = models.CharField(max_length=255, verbose_name='Номер дома')
    level = models.IntegerField(default=0, verbose_name='Уровень в сети')
    type_company = models.CharField(max_length=30, choices=TYPE_ORGANIZATION, verbose_name="Тип Компании")
    supplier_company_name = models.CharField(max_length=100, verbose_name="Имя компании поставщика", **NULLABLE)
    supplier_company_id = models.IntegerField(verbose_name="ID компании поставщика", **NULLABLE)
    owner = models.ForeignKey(to=User, on_delete=models.CASCADE, verbose_name='Владелец', **NULLABLE)

    def __str__(self):
        return self.email

    class Meta:
        verbose_name = 'Контактные данные'
        verbose_name_plural = 'Контактные данные'
