from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

from company.models import Company
from user.models import User


class TestCaseCompany(APITestCase):
    """Test Company."""
    def setUp(self):
        self.user = User.objects.create(email="test@mail.ru", password="test")
        self.client.force_authenticate(user=self.user)
        self.data = {
            'name': 'Updated Test Company',
            'email': 'test@example.com',
            'country': 'Updated Test Country',
            'city': 'Updated Test City',
            'type_company': 'individual',
            'house_number': 50,
            'street': 'Updated Test Street',
            'owner': self.user}
        self.company = Company.objects.create(**self.data)

    def test_company_create(self):
        """Test Company create."""
        url = reverse('company:company-list')
        data = {
            'name': 'Updated Test',
            'email': 'test@examp.com',
            'country': 'Updated Test Country',
            'city': 'Updated Test City',
            'type_company': 'individual',
            'house_number': 50,
            'street': 'Updated Test Street',
            'owner': self.user.id,
        }
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Company.objects.all().count(), 2)

    def test_company_update(self):
        """Test Company update."""
        url = reverse('company:company-detail', kwargs={'pk': self.company.id})
        data = {
            'name': 'Updated Test',
            'email': 'test@examp.com',
            'country': 'Updated Test Country',
            'city': 'Updated Test City',
            'type_company': 'individual',
            'house_number': 50,
            'street': 'Updated Test Street',
            'owner': self.user.id,
        }
        response = self.client.put(url, data)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(Company.objects.get(id=self.company.id).name, 'Updated Test')

    def test_company_list(self):
        """Test Company list."""
        url = reverse('company:company-list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.json()), 1)
        self.assertEqual(response.json()[0]['email'], 'test@example.com')

    def test_company_detail(self):
        """Test Company detail."""
        url = reverse('company:company-detail', kwargs={'pk': self.company.id})
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.json()['email'], 'test@example.com')
        self.assertEqual(response.json()['owner'], self.user.id)

    def test_company_delete(self):
        """Test Company delete."""
        url = reverse('company:company-detail', kwargs={'pk': self.company.id})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Company.objects.all().count(), 0)
