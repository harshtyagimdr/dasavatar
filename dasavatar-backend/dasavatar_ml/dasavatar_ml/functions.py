from rest_framework import status
from rest_framework.response import Response


def success(serializer):
    return Response(serializer.data, status.HTTP_201_CREATED)


def failure(serializer):
    return Response(serializer.errors, status.HTTP_400_BAD_REQUEST)


def update(serializer):
    return Response(serializer.data, status.HTTP_201_CREATED)


def remove():
    return Response(status=status.HTTP_204_NO_CONTENT)
