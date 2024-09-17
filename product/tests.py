from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

from company.models import Company
from product.models import Product
from user.models import User


class TestCaseProduct(APITestCase):
    """Test Product."""
    def setUp(self):
        self.user = User.objects.create(email="test@mail.ru", password="test")
        self.company = Company.objects.create(name="test", email="test@mail.ru", country="US",
                                              city="New York", type_company="individual", house_number=100,
                                              street="123 Main St", owner=self.user
                                              )
        self.product = Product.objects.create(name="test", model="test", release_date="2015-05-20",
                                              company=self.company)
        self.client.force_authenticate(user=self.user)

    def test_product_create(self):
        """Test create a new product."""
        data = {
            'name': 'Updated Test Product',
            'model': 'Updated Test Model',
            'release_date': '2020-05-20',
            'company': self.company.id
        }
        response = self.client.post(reverse('product:product-list'), data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Product.objects.count(), 2)

    def test_product_list(self):
        """Test product list."""
        url = reverse('product:product-list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.json()), 1)
        self.assertEqual(response.json()[0]['name'], 'test')

    def test_product_update(self):
        """Test product update."""
        url = reverse('product:product-detail', kwargs={'pk': self.product.id})
        data = {
            'name': 'Updated Test Product',
            'model': 'Updated Test Model',
            'release_date': '2020-05-20',
            'company': self.company.id
        }
        response = self.client.put(url, data)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(Product.objects.get(id=self.product.id).name, 'Updated Test Product')

    def test_product_detail(self):
        """Test product detail."""
        url = reverse('product:product-detail', kwargs={'pk': self.product.id})
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.json()['name'], 'test')
        self.assertEqual(response.json()['company'], self.company.id)

    def test_product_delete(self):
        """Test product delete."""
        url = reverse('product:product-detail', kwargs={'pk': self.product.id})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Product.objects.count(), 0)
