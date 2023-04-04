import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/model/loginModel.dart';

import '../../../util/constants.dart';
import '../../../utils/storage_utils.dart';
import '../auth/sign_in_screen.dart';
import '../homePage/home_Page.dart';
import '../notification_Screen/notifaction_Screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  await Firebase.initializeApp();
  print('Handling a background message ${message.toString()}');
}


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onGetnoti();
  }

  Future<void> onGetnoti() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      AndroidNotification? android = message!.notification!.android;
      print("message+++++"+message.data.toString());
      // print("message+++++"+message.data['channel'].toString());
      print("message+++++userId"+message.data['userId'].toString());
      var uid = message.data.entries.toString();
      _showBigPictureNotification(message.notification!.title, message.notification!.body);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("onMessageOpenedApp: $message");

      if (message.data != null) {
      }

    });

    var initializationSettingsAndroid = const AndroidInitializationSettings('logo');
    // var initializationSettingsIOS =  const IOSInitializationSettings();
    // var initializationSettings = InitializationSettings(
    //   android: initializationSettingsAndroid,
    //   iOS: initializationSettingsIOS,
    // );
    // flutterLocalNotificationsPlugin!.initialize(initializationSettings);

    var token = await _firebaseMessaging.getToken();
    print("deviceToken=> "+token.toString());

    StorageUtil.setData(StorageUtil.deviceToken, token);
    getLocalData();
    navigateToScreen();
  }

  Future<void> _showBigPictureNotification(title,msg) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'channel id',
        'channel name',importance: Importance.max);
    var platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics );
    await flutterLocalNotificationsPlugin!.show(0, title, msg, platformChannelSpecifics);
  }

  Future<void> onSelectNotification(String payload) async {
    print("__________________");
    // Get.to(NavBarPage(initialPage:"NotificationBlank"));
    Get.to(NotificationScreen());
  }

  getLocalData() {
    StorageUtil.getData(StorageUtil.keyLoginData).then((value) {
      if (value != null) {
        UserData data = UserData.fromJson(jsonDecode(value));
        setState(() {
          AppConstants.userName = data.name??"";
          AppConstants.userMobile = data.phone??"";
          AppConstants.userEmail = data.email??"";
          AppConstants.userProfileImage = data.avatar??"";
          AppConstants.userUnm = data.username??"";
          AppConstants.userLoc = data.address??"";
          AppConstants.userId = data.id!;
          print("userId=>${AppConstants.userId}");
        });
      }
    });
  }

  navigateToScreen() async {

    await Future.delayed(Duration(seconds: 3), () {});

    StorageUtil.getData(StorageUtil.isLogin).then((value) {
      if (value == true) {
        Get.off(HomePageView());
      } else {
        Get.off(SignInScreen());
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/splash.png"),
                  fit: BoxFit.fill)),
        ),
      ]),
    );
  }

}
