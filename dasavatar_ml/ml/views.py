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
            image = cv2.imread("one.jpg")
            gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

            Cascade1 = cv2.CascadeClassifier("haarcascade_frontalcatface.xml")

            face = Cascade1.detectMultiScale(
                gray,
                scaleFactor=1.3,
                minNeighbors=3,
                minSize=(30, 30)
            )

            return Response({'data': check}, status=status.HTTP_200_OK)
        check['status'] = False
        return Response({'data': check}, status=status.HTTP_200_OK)


class crowd(APIView):
    def post(self, request, format=None):
        serializer = CrowdSerializer(data=request.data)
        check = dict()
        if serializer.is_valid():
            image = cv2.imread("one.jpg")
            gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

            Cascade1 = cv2.CascadeClassifier("haarcascade_frontalcatface.xml")
            faces = Cascade1.detectMultiScale(
                gray,
                scaleFactor=1.3,
                minNeighbors=3,
                minSize=(30, 30)
            )

            print("[INFO] Found {} Faces.".format(len(faces)))

            Cascade2 = cv2.CascadeClassifier("haarcascade_eye.xml")
            eyes = Cascade2.detectMultiScale(
                gray,
                scaleFactor=1.3,
                minNeighbors=3,
                minSize=(30, 30)
            )

            print("[INFO] Found {} eyes.".format(len(eyes)))

            Cascade3 = cv2.CascadeClassifier("haarcascade_fullbody.xml")
            body = Cascade3.detectMultiScale(
                gray,
                scaleFactor=1.3,
                minNeighbors=3,
                minSize=(30, 30)
            )

            print("[INFO] Found {} body.".format(len(body)))

            return Response({'data': check}, status=status.HTTP_200_OK)
        check['status'] = False
        return Response({'data': check}, status=status.HTTP_200_OK)
