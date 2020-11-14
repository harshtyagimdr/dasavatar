import 'package:dasavatar_app/service/auth_service.dart';
import 'package:dasavatar_app/service/prefernce_service.dart';
import 'package:dasavatar_app/service/upload_file_firebase.dart';
import 'package:dasavatar_app/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final PreferenceService preferenceService = PreferenceService.getInstance();
final UserService userService = UserService.getInstance();
final AuthService authService = AuthService.getInstance();
final UploadFileFirebase uploadFileFirebase = UploadFileFirebase.getInstance();

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
