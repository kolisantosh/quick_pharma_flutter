import 'dart:convert';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../model/loginModel.dart';
import '../utils/storage_utils.dart';

abstract class ApiService {
  static const DOMAIN = "https://adm.quickpharmaceutical.com/";

  // static const DOMAIN = "https://dev.quickpharmaceutical.com/";

  static const BASE_URL = "${DOMAIN}api/";

  static const login = "${BASE_URL}login";

  //User
  static const getUser = "${BASE_URL}get_user";
  static const updateUser = "${BASE_URL}update_user";
  static const delete_user = "${BASE_URL}delete_user";

  //route
  static const getmy_route = "${BASE_URL}get_my_route";
  static const updatemy_route = "${BASE_URL}update_my_route";

  //Order
  static const getOrder = "${BASE_URL}getOrder";
  static const updateOrder = "${BASE_URL}updateOrder";
  static const remove_order_document = "${BASE_URL}remove_order_document";

  //forgot_password
  static const forgot_password = "${BASE_URL}forgot/password";
  static const verify_otp = "${BASE_URL}verify_otp";
  static const reset_password = "${BASE_URL}reset/password";
  static const change_password = "${BASE_URL}change_password";

  //dashboard
  static const dashboard_statistics = "${BASE_URL}dashboard_statistics";

  //earning
  static const driver_statistics = "${BASE_URL}driver_statistics";

  static const termsUrl = "${DOMAIN}dashboard_statistics";
  static const policyUrl = "${DOMAIN}privacypolicy";

  static const SUCCESS = 200;
  static const ERROR = false;

  static Map<String, String> fixHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static Future<dynamic> callGetApi(String url, Function? onError) async {
    var token = await StorageUtil.getData(StorageUtil.keyToken);
    if (token != null) {
      fixHeader.addAll({'Authorization': 'Bearer $token'});
    }

    print("ApiService GET Api: $url");
    print("ApiService Api Header: $fixHeader");
    var response = await http.get(Uri.parse(url), headers: fixHeader);

    print("ApiService GET Response : ${response.body}");
    print("ApiService GET Response Code : ${response.statusCode}");
    if (response.statusCode == SUCCESS) {
      return jsonDecode(response.body);
    } else {
      if (onError != null) {
        onError();
      }
      return null;
    }
  }

  static Future<dynamic> callPostApi(
      String url, Object params, Function? onError) async {
    var token = await StorageUtil.getData(StorageUtil.keyToken);
    var username = await StorageUtil.getData(StorageUtil.keyUsername);
    var password = await StorageUtil.getData(StorageUtil.keyPassword);
    if (token != null) {
      print("====token===${token}");
      fixHeader.addAll({'Authorization': 'Bearer $token'});
    }
    print("ApiService Post Api: $url");
    print("ApiService Api Params: $params");
    print("ApiService Api Header: $fixHeader");

    var response =
        await http.post(Uri.parse(url), body: params, headers: fixHeader);

    print("ApiService Post Response : ${response.body}");
    print("ApiService Post Response Code : ${response.statusCode}");
    if (response.statusCode == SUCCESS) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
/*      if (username != null) {
        var params = <String, String>{
          'username': username,
          'password': password
        };
        openAndCloseLoadingDialog(true);
        callPostApi(ApiService.login, jsonEncode(params), () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          if (response == null) {} else {
            openAndCloseLoadingDialog(false);
            LoginModel responseData = LoginModel.fromJson(response);
            if ((responseData.error ?? true) == ApiService.ERROR) {
              StorageUtil.setData(StorageUtil.isLogin, true);
              StorageUtil.setData(StorageUtil.keyToken, responseData.token);
              StorageUtil.setData(StorageUtil.keyLoginData,
                  jsonEncode(responseData.data!.toJson()));
              StorageUtil.setData(StorageUtil.userId, responseData.data!.id);
              showSnackBar("Try Again.");
              if (onError != null) {
                onError();
              }
            }
            else {
              showSnackBar(responseData.message ?? "");
            }
          }
        });
      }*/
      showSnackBar("Login Failed, Try Again.");
      if (onError != null) {
        onError();
      }
    } else if (response.statusCode == 500) {
      showSnackBar("Internal Server Error");
      if (onError != null) {
        onError();
      }
      // return null;
    } else {
      showSnackBar("Login Failed, Try Again.");
      if (onError != null) {
        onError();
      }
      // return null;
    }
  }

  static Future<dynamic> CallUpdateProfileApi(String url,
      Map<String, String> params, var photofiles, Function? onError) async {
    try {
      var token = await StorageUtil.getData(StorageUtil.keyToken);
      if (token != null) {
        fixHeader.addAll({'Authorization': 'Bearer $token'});
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );

      request.headers.addAll(fixHeader);
      request.fields.addAll(params);

      if (photofiles != "")
        request.files
            .add(await http.MultipartFile.fromPath('avatar', photofiles));

      print("This is photofiles:" + photofiles.toString());

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print("This is response:" + jsonBody.toString());
      if (response.statusCode == SUCCESS) {
        return jsonDecode(respStr);
      } else if (response.statusCode == 500) {
        showSnackBar("Internal Server Error");
        if (onError != null) {
          onError();
        }
        return null;
      } else {
        showSnackBar("Login Failed, Try Again.");
        if (onError != null) {
          onError();
        }
        return null;
      }
    } catch (e) {
      print(e.toString());
      // if (e is SocketException) {
      //   showLongToast("Could not connect to internet");
      // }
    }
  }

  static Future<dynamic> CallUpdateRouteApi(String url,
      Map<String, String> params, var photofiles, Function? onError) async {
    try {
      var token = await StorageUtil.getData(StorageUtil.keyToken);
      if (token != null) {
        fixHeader.addAll({'Authorization': 'Bearer $token'});
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );

      request.headers.addAll(fixHeader);
      request.fields.addAll(params);

      if (photofiles != "")
        request.files
            .add(await http.MultipartFile.fromPath('mask_photo', photofiles));

      print("This is photofiles:" + photofiles.toString());

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print("This is response:" + jsonBody.toString());
      if (response.statusCode == SUCCESS) {
        return jsonDecode(respStr);
      } else if (response.statusCode == 500) {
        showSnackBar("Internal Server Error");
        if (onError != null) {
          onError();
        }
        return null;
      } else {
        showSnackBar("Login Failed, Try Again.");
        if (onError != null) {
          onError();
        }
        return null;
      }
    } catch (e) {
      print(e.toString());
      // if (e is SocketException) {
      //   showLongToast("Could not connect to internet");
      // }
    }
  }

  static Future<dynamic> CallOrderStatusApi(
      String url,
      Map<String, String> params,
      var photofiles,
      var copayfiles,
      var fridgefiles,
      var signfile,
      Function? onError) async {
    try {
      var token = await StorageUtil.getData(StorageUtil.keyToken);
      if (token != null) {
        fixHeader.addAll({'Authorization': 'Bearer $token'});
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );

      request.headers.addAll(fixHeader);
      request.fields.addAll(params);

      if (photofiles != null) {
        for (int i = 0; i < photofiles.length; i++) {
          var element = photofiles[i];
          request.files.add(
              await http.MultipartFile.fromPath('attachfile[]', element.path));
        }
      }
      if (copayfiles != null) {
        for (int i = 0; i < copayfiles.length; i++) {
          var element = copayfiles[i];
          request.files
              .add(await http.MultipartFile.fromPath('copay[]', element.path));
        }
      }

      if (fridgefiles != null) {
        for (int i = 0; i < fridgefiles.length; i++) {
          var element = fridgefiles[i];
          request.files
              .add(await http.MultipartFile.fromPath('fridge[]', element.path));
        }
      }
      print(signfile.toString());
      // if (signfile != null) {
      //   request.files.add(
      //       await http.MultipartFile.fromPath('attachsignature[]', signfile));
      // }

      final response = await request.send();
      final respStr = await response.stream.bytesToString();
      final jsonBody = await jsonDecode(respStr);
      print("This is response:" + jsonBody.toString());
      if (response.statusCode == SUCCESS) {
        return jsonDecode(respStr);
      } else if (response.statusCode == 500) {
        showSnackBar("Internal Server Error");
        if (onError != null) {
          onError();
        }
        return null;
      } else {
        if (onError != null) {
          onError();
        }
        return null;
      }
    } catch (e) {
      showSnackBar(e.toString());
      print(e.toString());
      if (onError != null) {
        onError();
      }
      return null;
      // if (e is SocketException) {
      //   showLongToast("Could not connect to internet");
      // }
    }
  }

}
