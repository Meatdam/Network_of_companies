from django.db import models

from company.models import Company

NULLABLE = {'blank': True, 'null': True}


class Product(models.Model):
    """Product model."""
    name = models.CharField(max_length=255, verbose_name='Название продукта')
    model = models.CharField(max_length=255, verbose_name='Модель')
    release_date = models.DateField(verbose_name='Дата релиза')
    company = models.ForeignKey(to=Company, on_delete=models.CASCADE, verbose_name='Компания')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Продукт'
        verbose_name_plural = 'Продукты'
