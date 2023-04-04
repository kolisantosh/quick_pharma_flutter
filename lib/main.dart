import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_pharma/util/appText.dart';
import 'package:quick_pharma/util/constants.dart';
import 'package:quick_pharma/utils/storage_utils.dart';
import 'view/screens/splash/NewSplashScreen.dart';
import 'package:flutter/foundation.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  await Firebase.initializeApp();
  print('Handling a background message ${message.toString()}');
}

AndroidNotificationChannel? channel;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb)
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAGX59rdW0rl3Qop5KAjjWrZurmASgwyzw",
          authDomain: "quick-pharma-c63fc.firebaseapp.com",
          projectId: "quick-pharma-c63fc",
          storageBucket: "quick-pharma-c63fc.appspot.com",
          messagingSenderId: "335284881716",
          appId: "1:335284881716:web:5c497605379522660efd61",
          measurementId: "G-PX1V0E5XP2"),
    );
  else
    await Firebase.initializeApp();

  StorageUtil.createSharedPref();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}

// This isMobile, isTablet, isDesktop helep us later
bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 1000;

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width > 1125;

/*
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1100;*/

Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    showSnackBar(msgCheckConnection);
    return false;
  } else {
    return true;
  }
}
dynamic datTime1(dtime) {
  return DateFormat("d MMM yyyy").format(datTime(dtime));
}

dynamic datTime2(dtime) {
  return DateFormat('hh:mm a').format(datTime(dtime));
}

DateTime datTime(dtime) {
  // return DateTime.fromMillisecondsSinceEpoch(dtime * 1000);
  return DateTime.fromMillisecondsSinceEpoch(
      int.parse(dtime.toString()) * 1000);
}

void showSnackBar(String message) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.FLOATING,
    // maxWidth: size_500,
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ),
    titleText: Container(),
    // borderRadius: size_4,
    backgroundColor: Colors.red,
    colorText: Theme.of(Get.context!).colorScheme.surface,
    isDismissible: false,
    animationDuration: const Duration(milliseconds: 500),
    duration: const Duration(seconds: 2),
    // margin: const EdgeInsets.all(size_10),
    /*mainButton: TextButton(
      child: Text('Undo'),
      onPressed: () {},
    ),*/
  );
}

void showSnackBarSucc(String message) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.FLOATING,
    // maxWidth: size_500,
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ),
    titleText: Container(),
    // borderRadius: size_4,
    backgroundColor: Colors.green,
    colorText: Theme.of(Get.context!).colorScheme.surface,
    isDismissible: false,
    animationDuration: const Duration(milliseconds: 500),
    duration: const Duration(seconds: 2),
    // margin: const EdgeInsets.all(size_10),
    /*mainButton: TextButton(
      child: Text('Undo'),
      onPressed: () {},
    ),*/
  );
}

Future<void> openAndCloseLoadingDialog(bool isShowHide) async {
  if (Get.overlayContext != null) {
    if (isShowHide) {
      showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: const Center(
            child: const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    } else {
      Navigator.pop(Get.overlayContext!);
    }
  }
}
