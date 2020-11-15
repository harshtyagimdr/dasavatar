import 'package:dasavatar_app/service/auth_service.dart';
import 'package:dasavatar_app/service/location_service.dart';
import 'package:dasavatar_app/service/post_service.dart';
import 'package:dasavatar_app/service/prefernce_service.dart';
import 'package:dasavatar_app/service/upload_file_firebase.dart';
import 'package:dasavatar_app/service/user_service.dart';
import 'package:dasavatar_app/service/verify_serivce.dart';
import 'package:dasavatar_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location_permissions/location_permissions.dart';

final PreferenceService preferenceService = PreferenceService.getInstance();
final UserService userService = UserService.getInstance();
final AuthService authService = AuthService.getInstance();
final VerifyService verifyService = VerifyService.getInstance();
final PostService postService = PostService.getInstance();
final LocationService locationService = LocationService.getInstance();
final UploadFileFirebase uploadFileFirebase = UploadFileFirebase.getInstance();

String validateEmail(String email) {
  String required = requiredString(email);
  if (required != null) return required;
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(email)) ? 'Valid Email!!' : null;
}

String validateName(String name) {
  String required = requiredString(name);
  if (required != null) return required;
  Pattern pattern = r'^[ a-zA-Z]*$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(name)) ? 'Valid Name!!' : null;
}

String validatePhone(String phone) {
  String required = requiredString(phone);
  if (required != null) return required;
  Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(phone)) ? 'Valid Phone Number!!' : null;
}

String requiredString(String value) {
  if (value == null || value.isEmpty) return 'Required !!!';
  return null;
}

Widget showSnackbar(
  String text,
  BuildContext context,
) {
  if (context != null) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            text,
          ),
          backgroundColor: Styles.BLACK_COLOR,
          duration: Duration(milliseconds: 2500),
        ),
      );
  } else {
    return SizedBox();
  }
}

Future<bool> locationPermission() async {
  print("check location permission");
  PermissionStatus checkPermission =
      await LocationPermissions().checkPermissionStatus();
  print(checkPermission.toString());
  if (checkPermission != PermissionStatus.granted) {
    print("check location permission");
    PermissionStatus permission =
        await LocationPermissions().requestPermissions();
    print(permission.toString());
    if (permission == PermissionStatus.granted)
      return true;
    else
      return false;
  } else {
    return true;
  }
}

showToast({String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
