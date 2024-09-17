from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

from user.models import User


class TestCaseUser(APITestCase):
    """Test User."""

    def setUp(self):
        self.user = User.objects.create(email='admin@test.com')
        self.client.force_authenticate(user=self.user)

    def test_create_user(self):
        """Test create user."""
        url = reverse('user:users-list')
        data = {
            "email": "test@example.com",
            "password": 1234
        }
        response = self.client.post(
            url, data=data
        )
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(
            response.json(),
            {
                "password": response.json()['password'],
                "email": "test@example.com",
            })

        self.assertTrue(User.objects.all().count() == 2)

    def test_user_list(self):
        """Test user list."""
        url = reverse('user:users-list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.json()), 1)
        self.assertEqual(response.json()[0]['email'], 'admin@test.com')

    def test_update_user(self):
        """Test update user."""
        url = reverse('user:users-detail', kwargs={'pk': self.user.pk})
        data = {
            "email": "test@example.com",
            "password": "1234"
        }
        response = self.client.put(
            url, data=data
        )
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.json()['email'], 'test@example.com')
        self.assertEqual(response.json()['password'], response.json()['password'])

    def test_detail_user(self):
        """Test detail user."""
        url = reverse('user:users-detail', kwargs={'pk': self.user.pk})
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.json()['email'], 'admin@test.com')

    def test_delete_user(self):
        """Test delete user."""
        url = reverse('user:users-detail', kwargs={'pk': self.user.pk})
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(User.objects.all().count(), 0)
