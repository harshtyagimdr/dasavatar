from django.urls import path

from . import views

urlpatterns = [
    path('image/<slug:pk>', views.image.as_view()),
    path('crowd/<slug:pk>', views.crowd.as_view()),
]
