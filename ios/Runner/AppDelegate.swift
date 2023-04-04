 import UIKit
 import Flutter
 import GoogleMaps

 @UIApplicationMain
 @objc class AppDelegate: FlutterAppDelegate {
   override func application(
     _ application: UIApplication,
     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
   ) -> Bool {
     GMSServices.provideAPIKey("AIzaSyD3VsIfqH48DULGX2NEMTscCqV3pGwNN74")
     GeneratedPluginRegistrant.register(with: self)
     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
   }
 }