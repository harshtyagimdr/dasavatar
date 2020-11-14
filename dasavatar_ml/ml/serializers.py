from rest_framework import serializers

from .models import User, Crowd


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


class CrowdSerializer(serializers.ModelSerializer):
    class Meta:
        model = Crowd
        fields = '__all__'
