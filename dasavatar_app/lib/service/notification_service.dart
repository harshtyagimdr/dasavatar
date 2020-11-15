//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:meta/meta.dart';
//
//class NotificationService {
//  NotificationService._();
//
//  static final NotificationService _instance = NotificationService._();
//
//  factory NotificationService.getInstance() => _instance;
//
////  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//      new FlutterLocalNotificationsPlugin();
//  AndroidNotificationDetails _androidNotificationDetails =
//      AndroidNotificationDetails('repeatDailyAtTime channel id',
//          'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
//  IOSNotificationDetails _iosNotificationDetails = IOSNotificationDetails();
//
//  NotificationDetails _notificationDetails;
//
//  initNotificationService() {
//    AndroidInitializationSettings initializationSettingsAndroid =
//        new AndroidInitializationSettings('logo');
//
//    var initializationSettingsIOS = IOSInitializationSettings();
//
//    var initializationSettings = new InitializationSettings(
//        initializationSettingsAndroid, initializationSettingsIOS);
//    this._flutterLocalNotificationsPlugin.initialize(initializationSettings);
//    this._notificationDetails = NotificationDetails(
//        this._androidNotificationDetails, this._iosNotificationDetails);
//  }
//
//  showNow(String text) async {
//    print("DasAvatar " + text);
//    await _flutterLocalNotificationsPlugin.show(
//        0, "DasAvatar", text, _notificationDetails);
//  }
//
//  cancelAll() async {
//    await _flutterLocalNotificationsPlugin.cancelAll();
//  }
//}
//
//class NotificationInfo {
//  int id;
//  String title;
//  String description;
//  int hours;
//  int minutes;
//
//  DateTime dateTime;
//
//  NotificationInfo(
//      {@required this.id,
//      @required this.title,
//      this.description,
//      this.hours,
//      this.minutes,
//      this.dateTime});
//
//  Time getTime() {
//    return Time(hours, minutes, 0);
//  }
//}
