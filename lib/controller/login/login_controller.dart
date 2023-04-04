import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/util/appText.dart';

import '../../apiservice/api_service.dart';
import '../../main.dart';
import '../../model/loginModel.dart';
import '../../utils/storage_utils.dart';
import '../../utils/string_utils.dart';
import '../../view/screens/homePage/home_Page.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final isEmailEmpty = false.obs;
  final isPasswordEmpty = false.obs;
  final emailValidationMsg = msgEmailRequired.obs;
  final pwdValidationMsg = msgPWDRequired.obs;
  final isPasswordVisible = true.obs;

  @override
  void onReady() {
    super.onReady();
    /*StorageUtil.getData(StorageUtil.keyLoginData).then((value) {
      if (value != null) {
        print("object");
        callGetMenuApi();
      }
    });*/
  }

  callLoginApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        if (checkString(emailController.value.text.toString().trim())) {
          isEmailEmpty.value = true;
          showSnackBar(emailValidationMsg.value);
        }
        // else if (isEmail(emailController.value.text.toString().trim())) {
        //   isEmailEmpty.value = true;
        // }
        else if (checkString(
            passwordController.value.text.toString().trim())) {
          isPasswordEmpty.value = true;
          showSnackBar(emailValidationMsg.value);
        } else {
          isEmailEmpty.value = false;
          isPasswordEmpty.value = false;
          var params = <String, String>{
            'username': emailController.value.text.toString().trim(),
            'password': passwordController.value.text.toString().trim()
          };
          openAndCloseLoadingDialog(true);
          ApiService.callPostApi(ApiService.login, jsonEncode(params), () {
            openAndCloseLoadingDialog(false);
          }).then((response) {
            if (response == null) {

            } else {
              openAndCloseLoadingDialog(false);
              LoginModel responseData =
              LoginModel.fromJson(response);
              if ((responseData.error ?? true) == ApiService.ERROR) {

                StorageUtil.setData(StorageUtil.isLogin, true);
                StorageUtil.setData(StorageUtil.keyUsername, emailController.value.text.toString().trim());
                StorageUtil.setData(StorageUtil.keyPassword, passwordController.value.text.toString().trim());
                StorageUtil.setData(StorageUtil.keyToken, responseData.token);
                StorageUtil.setData(StorageUtil.keyLoginData,jsonEncode(responseData.data!.toJson()));
                StorageUtil.setData(StorageUtil.userId,responseData.data!.id);
                callFCmApi();
                Get.offAll(HomePageView());

              } else {
                showSnackBar(responseData.message ?? "");
              }
            }
          });
        }
      }
    });
  }

  //updateUser
  callFCmApi() async {
    var deviceToken = await StorageUtil.getData(StorageUtil.deviceToken);
    checkConnectivity().then((connectivity) {
      if (connectivity) {

        var params = <String, String>{
          'fcm_id': deviceToken.toString().trim(),
        };
        // openAndCloseLoadingDialog(true);
        ApiService.callPostApi(ApiService.updateUser, jsonEncode(params), () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          if (response == null) {
          } else {
            // openAndCloseLoadingDialog(false);
            LoginModel responseData = LoginModel.fromJson(response);
            if ((responseData.error ?? true) == ApiService.ERROR) {
              print("responseData=> " + responseData.toString());
              // StorageUtil.setData(StorageUtil.keyLoginData,
              //     jsonEncode(responseData.data!.toJson()));
              // StorageUtil.setData(StorageUtil.userId, responseData.data!.id);
            } else {
              showSnackBar(responseData.message ?? "");
            }
          }
        });
      }
    });
  }

}
