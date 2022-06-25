import 'dart:async';
import 'dart:convert';
import 'package:communication/pref/shread_pref.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
final firebaseFirestore = FirebaseFirestore.instance;
FirebaseMessaging messaging = FirebaseMessaging.instance;

// Future<void> onBackgroundMessageMethod(RemoteMessage remoteMessage) async {
//   await Firebase.initializeApp();
//   if (remoteMessage.data.containsKey('data')) {
//     /// Handel Data Message
//     final data = remoteMessage.data['data'];
//   }
//   if (remoteMessage.data.containsKey('notification')) {
//     /// Handel Notification Message
//     final notification = remoteMessage.data['notification'];
//   }
//
//   /// Or do other Code
// }
void notificationSetting ()async{
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus ==
      AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }

  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    print("Handling a background message: ${message.messageId}");
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

class NotificationController {

  // static final _notification = FlutterLocalNotificationsPlugin();
  //
  // static Future _notificationDetails() async {
  //   return NotificationDetails(
  //     android: AndroidNotificationDetails(
  //         'channel id',
  //         'channel name',
  //         channelDescription: '',
  //         importance: Importance.max
  //     ),
  //     iOS: IOSNotificationDetails(),
  //   );
  // }
  //
  // static Future showNotification(
  //     {int id = 0, String? title, String? body, String? payload}) async =>
  //     _notification.show(
  //         id, title, body, await _notificationDetails(), payload: payload);

  // final streamCtrl = StreamController<String>.broadcast();
  // final titleCtrl = StreamController<String>.broadcast();
  // final bodyCtrl = StreamController<String>.broadcast();
  //
  // setNotification() {
  //   FirebaseMessaging.onBackgroundMessage(onBackgroundMessageMethod);
  //
  //   /// Handel when app is in active status
  //   forgroundNotification();
  //
  //   /// Handel when app is running in background
  //   backgroundNotification();
  //
  //   /// Handel when app is closed or terminated by user
  //   termaintNotification();
  // }
  //
  // forgroundNotification() {
  //   FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
  //     if (remoteMessage.data.containsKey('data')) {
  //       /// Handel Data Message
  //       streamCtrl.sink.add(remoteMessage.data['data']);
  //     }
  //     if (remoteMessage.data.containsKey('notification')) {
  //       /// Handel Notification Message
  //       streamCtrl.sink.add(remoteMessage.data['notification']);
  //     }
  //
  //     /// Or do other Code
  //     titleCtrl.sink.add(remoteMessage.notification!.title!);
  //     bodyCtrl.sink.add(remoteMessage.notification!.body!);
  //   });
  // }
  //
  // backgroundNotification() {
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
  //     if (remoteMessage.data.containsKey('data')) {
  //       /// Handel Data Message
  //       streamCtrl.sink.add(remoteMessage.data['data']);
  //     }
  //     if (remoteMessage.data.containsKey('notification')) {
  //       /// Handel Notification Message
  //       streamCtrl.sink.add(remoteMessage.data['notification']);
  //     }
  //
  //     /// Or do other Code
  //     titleCtrl.sink.add(remoteMessage.notification!.title!);
  //     titleCtrl.sink.add(remoteMessage.notification!.body!);
  //   });
  // }
  //
  // termaintNotification() async {
  //   RemoteMessage? initalMessage =
  //   await FirebaseMessaging.instance.getInitialMessage();
  //   if (initalMessage != null) {
  //     if (initalMessage.data.containsKey('data')) {
  //       /// Handel Data Message
  //       streamCtrl.sink.add(initalMessage.data['data']);
  //     }
  //     if (initalMessage.data.containsKey('notification')) {
  //       /// Handel Notification Message
  //       streamCtrl.sink.add(initalMessage.data['notification']);
  //     }
  //
  //     /// Or do other Code
  //     titleCtrl.sink.add(initalMessage.notification!.title!);
  //     bodyCtrl.sink.add(initalMessage.notification!.body!);
  //   }
  // }
  //
  // dispose() {
  //   streamCtrl.close();
  //   titleCtrl.close();
  //   bodyCtrl.close();
  // }

  Future<void> saveToken(String phone) async {
    String tokenId = '';
    await messaging.getToken().then((value) {
      tokenId = value!;
    });
    await firebaseFirestore
        .collection('tokenUser')
        .doc(phone + 'tokenUser')
        .set({'tokenFilledUser': tokenId});
  }

  // FirebaseMessaging.instance.getToken().then((token) {
  // FirebaseFirestore.instance.collection('users').doc(userCreds.user!.uid).set({
  // 'deviceToken': token
  // });
  // });

  Future<void> updateToken(String phone) async {
    String tokenId = '';
    await messaging.getToken().then((value) {
      tokenId = value!;
    });
    return firebaseFirestore
        .collection('tokenUser')
        .doc(phone + 'tokenUser')
        .update({'tokenFilledUser': tokenId}).then((value) {
      print('Success');
    }).catchError((error) {
      print('the Error $error');
    });
  }

  Future<String> getToken(String phone) async {
    String tokenId = '';
    final messages = await firebaseFirestore.collection('tokenUser').doc(
        phone + 'tokenUser').get();
    messages.data()!.map((key, value) {
      if (key == 'tokenFilledUser') {
        tokenId = value;
      }
      return MapEntry(key, value);
    });
    return tokenId.toString();
  }

  // Future<String> sendNotificationMessage(String token , String title , String body , {required String phone}) async {
  //   var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
  //   try{
  //     http.post(url);
  //   }catch(e){}
  // }

  // var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //
  // void loadFCM() async {
  //   if (!kIsWeb) {
  //     channel = const AndroidNotificationChannel(
  //       'high_importance_channel', // id
  //       'High Importance Notifications', // title
  //       importance: Importance.high,
  //       enableVibration: true,
  //     );
  //
  //     /// Create an Android Notification Channel.
  //     ///
  //     /// We use this channel in the `AndroidManifest.xml` file to override the
  //     /// default FCM channel to enable heads up notifications.
  //     await flutterLocalNotificationsPlugin
  //         .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //         ?.createNotificationChannel(channel);
  //
  //     /// Update the iOS foreground notification presentation options to allow
  //     /// heads up notifications.
  //     await FirebaseMessaging.instance
  //         .setForegroundNotificationPresentationOptions(
  //       alert: true,
  //       badge: true,
  //       sound: true,
  //     );
  //   }
  // }
  //
  // void listenFCM() async {
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null && !kIsWeb) {
  //       flutterLocalNotificationsPlugin.show(
  //         notification.hashCode,
  //         notification.title,
  //         notification.body,
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             channel.id,
  //             channel.name,
  //             // TODO add a proper drawable resource to android, for now using
  //             //      one that already exists in example app.
  //             icon: 'launch_background',
  //           ),
  //         ),
  //       );
  //     }
  //   });
  // }
  void sendPushMessage(String body, String title, String token,
      {required String phone}) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
          'AIzaSyDhAbfwEIgx-cnexjl24nTwVl6vWbrlRQQ',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );

      await firebaseFirestore.collection('notification').doc(phone+'notification').set(
       {
         'imageUser' : SharedPrefController().image,
         'name' : SharedPrefController().name,
         'title' : body,
         'phone' : phone,
       }
      );
      print('done');
    } catch (e) {
      print("error push notification");
    }
  }

// void requestPermission() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
//
//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     print('User granted permission');
//   } else if (settings.authorizationStatus ==
//       AuthorizationStatus.provisional) {
//     print('User granted provisional permission');
//   } else {
//     print('User declined or has not accepted permission');
//   }
// }
// }
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   print('Got a message whilst in the foreground!');
//   print('Message data: ${message.data}');
//
//   if (message.notification != null) {
//   print('Message also contained a notification: ${message.notification}');
//   }
//   });
}