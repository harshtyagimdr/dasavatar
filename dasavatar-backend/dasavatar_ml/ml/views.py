import urllib.request

import cv2
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from .serializers import UserSerializer, CrowdSerializer


class image(APIView):
    def post(self, request, format=None):
        serializer = UserSerializer(data=request.data)
        check = dict()
        if serializer.is_valid():
            url = request.data['image']
            length = len(url)
            p = url[length - 10:] + ".jpg"
            print(url[-1:5])
            urllib.request.urlretrieve(url, p)
            print(p)
            image = cv2.imread(p)
            gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
            Cascade1 = cv2.CascadeClassifier("ml/haarcascade_frontalcatface.xml")
            faces = Cascade1.detectMultiScale(
                gray,
                scaleFactor=1.3,
                minNeighbors=3,
                minSize=(30, 30)
            )
            check['status'] = True
            check['face'] = len(faces)
            return Response({'data': check}, status=status.HTTP_200_OK)
        check['status'] = False
        return Response({'data': check}, status=status.HTTP_200_OK)


class crowd(APIView):
    def post(self, request, format=None):
        serializer = CrowdSerializer(data=request.data)
        check = dict()
        if serializer.is_valid():
            url = request.data['image']
            length = len(url)
            p = url[length - 10:] + ".jpg"
            print(url[-1:5])
            urllib.request.urlretrieve(url, p)
            print(p)
            image = cv2.imread(p)
            gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
            Cascade1 = cv2.CascadeClassifier("ml/haarcascade_frontalcatface.xml")
            face = Cascade1.detectMultiScale(
                gray,
                scaleFactor=1.3,
                minNeighbors=3,
                minSize=(30, 30)
            )
            Cascade2 = cv2.CascadeClassifier("ml/haarcascade_eye.xml")
            eye = Cascade2.detectMultiScale(
                gray,
                scaleFactor=1.3,
                minNeighbors=3,
                minSize=(30, 30)
            )
            Cascade3 = cv2.CascadeClassifier("ml/haarcascade_fullbody.xml")
            body = Cascade3.detectMultiScale(
                gray,
                scaleFactor=1.3,
                minNeighbors=3,
                minSize=(30, 30)
            )
            check['status'] = True
            check['body'] = len(body)
            check['face'] = len(face)
            check['eye'] = len(eye)
            return Response({'data': check}, status=status.HTTP_200_OK)
        check['status'] = False
        return Response({'data': check}, status=status.HTTP_200_OK)
