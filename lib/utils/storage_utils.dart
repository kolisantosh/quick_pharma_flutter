import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static const String isLogin = "isLogin";
  static const String keyLoginData = "loginData";
  static const String keyUsername = "username";
  static const String keyPassword = "password";
  static const String keyToken = "token";
  static const String xApiKey = "xApiKey";
  static const String keyMenuData = "menuData";
  static const String keySystemValue = "systemValue";
  static const String keyHMSProfile = "hmsProfile";
  static const String userId = "userId";
  static const String latitude = "latitude";
  static const String longitude = "longitude";
  static const String deviceToken = "deviceToken";
  static const String orderId = "orderId";
  static const String regionsId = "regionsId";

  static SharedPreferences? preferences;

  static createSharedPref() {
    SharedPreferences.getInstance().then((pref) {
      StorageUtil.preferences = pref;
    });
  }

  static setData(String key, dynamic value) {
    if (StorageUtil.preferences != null) {
      
      if (value is String) {
        StorageUtil.preferences!.setString(key, value);
      } else if (value is int) {
        StorageUtil.preferences!.setInt(key, value);
      } else if (value is double) {
        StorageUtil.preferences!.setDouble(key, value);
      } else if (value is bool) {
        StorageUtil.preferences!.setBool(key, value);
      } else {
        StorageUtil.preferences!.setString(key, value);
      }
    }
  }

  static Future<dynamic> getData(String key) async {
    if (StorageUtil.preferences == null) {
      return null;
    } else {
      return StorageUtil.preferences!.get(key);
    }
  }

  static void clearData() {
    if(StorageUtil.preferences == null) {
      SharedPreferences.getInstance().then((value) {
        value.clear();
      });
    }else{
      StorageUtil.preferences!.clear();
    }
  }

  static void clearLoginData() {
    if(StorageUtil.preferences == null) {

      SharedPreferences.getInstance().then((value) {
        value.remove(keyLoginData);
        value.remove(keyToken);
      });
    }else{
      StorageUtil.preferences!.remove(keyLoginData);
      StorageUtil.preferences!.remove(keyToken);
    }
  }
}
