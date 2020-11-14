from django.urls import path

from . import views

urlpatterns = [
    path('image', views.image.as_view()),
    path('crowd', views.crowd.as_view()),
]
