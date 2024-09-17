import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:rose_delivery/features/order/controllers/order_controller.dart';
import 'package:rose_delivery/features/profile/controllers/profile_controller.dart';
import 'package:rose_delivery/utill/app_constants.dart';

class NotificationHelper {

  static Future<void> initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = const AndroidInitializationSettings('notification_icon');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationsSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationsSettings);


    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      AndroidInitializationSettings androidInitialize = const AndroidInitializationSettings('notification_icon');

      var initializationsSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
      flutterLocalNotificationsPlugin.initialize(initializationsSettings);

      Get.find<OrderController>().getCurrentOrders();
      Get.find<ProfileController>().getProfile();

      NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin, true);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("onMessageOpenedApp: ${message.data}");
      Get.find<OrderController>().getCurrentOrders();


    });


  }

  static Future<void> showNotification(RemoteMessage message, FlutterLocalNotificationsPlugin? fln, bool data,{ bool notificationSound = true}) async {
    String? _title;
    String? _body;
    String? _orderID;
    String? _image;
    if(data) {
      _title = message.data['title'];
      _body = message.data['body'];
      _orderID = message.data['order_id'];
      _image = (message.data['image'] != null && message.data['image'].isNotEmpty)
          ? message.data['image'].startsWith('http') ? message.data['image']
          : '${AppConstants.baseUri}/storage/app/public/notification/${message.data['image']}' : null;
    }else {
      _title = message.notification!.title;
      _body = message.notification!.body;
      _orderID = message.notification!.titleLocKey;
      if(GetPlatform.isAndroid) {
        _image = (message.notification!.android!.imageUrl != null && message.notification!.android!.imageUrl!.isNotEmpty)
            ? message.notification!.android!.imageUrl!.startsWith('http') ? message.notification!.android!.imageUrl
            : '${AppConstants.baseUri}/storage/app/public/notification/${message.notification!.android!.imageUrl}' : null;
      }else if(GetPlatform.isIOS) {
        _image = (message.notification!.apple!.imageUrl != null && message.notification!.apple!.imageUrl!.isNotEmpty)
            ? message.notification!.apple!.imageUrl!.startsWith('http') ? message.notification!.apple!.imageUrl
            : '${AppConstants.baseUri}/storage/app/public/notification/${message.notification!.apple!.imageUrl}' : null;
      }
    }

    if(_image != null && _image.isNotEmpty) {
      try{
        await showBigPictureNotificationHiddenLargeIcon(_title, _body, _orderID, _image, fln!);
      }catch(e) {
        await showBigTextNotification(_title, _body!, _orderID, fln!);
      }
    }else {
      await showBigTextNotification(_title, _body!, _orderID, fln!);
    }
  }

  static Future<void> showTextNotification(String title, String body, String orderID, FlutterLocalNotificationsPlugin fln, {bool playSound = true}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '6valley_delivery', '6valley_delivery name', playSound:  true,
      importance: Importance.max, priority: Priority.max, sound: RawResourceAndroidNotificationSound('notification'),
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<void> showBigTextNotification(String? title, String body, String? orderID, FlutterLocalNotificationsPlugin fln, {bool playSound = true}) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      body, htmlFormatBigText: true,
      contentTitle: title, htmlFormatContentTitle: true,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '6valley_delivery channel id', '6valley_delivery name', importance: Importance.max,
      styleInformation: bigTextStyleInformation, priority: Priority.max, playSound: true,
      sound: const RawResourceAndroidNotificationSound('notification'),
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<void> showBigPictureNotificationHiddenLargeIcon(String? title, String? body, String? orderID, String image, FlutterLocalNotificationsPlugin fln,{bool playSound = true}) async {
    final String largeIconPath = await _downloadAndSaveFile(image, 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(image, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath), hideExpandedLargeIcon: true,
      contentTitle: title, htmlFormatContentTitle: true,
      summaryText: body, htmlFormatSummaryText: true,
    );
    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '6valley_delivery', '6valley_delivery name',
      largeIcon: FilePathAndroidBitmap(largeIconPath), priority: Priority.max, playSound: playSound? true: false,
      styleInformation: bigPictureStyleInformation, importance: Importance.max,
      sound: const RawResourceAndroidNotificationSound('notification'),
    );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

}

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  debugPrint("onBackground: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");
  // var androidInitialize = const AndroidInitializationSettings('notification_icon');
  // var iOSInitialize = const IOSInitializationSettings();
  // var initializationsSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  // NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin, true);
}