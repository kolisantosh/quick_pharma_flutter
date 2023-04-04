import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apiservice/api_service.dart';
import '../../main.dart';
import '../../model/loginModel.dart';
import '../../utils/string_utils.dart';

class ChangePwdController extends GetxController {
  final oldPasswordController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final conformPasswordController = TextEditingController().obs;
  final isPasswordEmpty = false.obs;
  final isOPasswordEmpty = false.obs;
  final isCPasswordEmpty = false.obs;
  final isPasswordVisible = true.obs;
  final isOPasswordVisible = true.obs;
  final isCPasswordVisible = true.obs;

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

  callChangePwdApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        if (checkString(oldPasswordController.value.text.toString().trim())) {
          isOPasswordEmpty.value = true;
        } else if (checkString(
            passwordController.value.text.toString().trim())) {
          isPasswordEmpty.value = true;
        } else if (checkString(
            conformPasswordController.value.text.toString().trim())) {
          isCPasswordEmpty.value = true;
        } else {
          isPasswordEmpty.value = false;
          isOPasswordEmpty.value = false;
          isCPasswordEmpty.value = false;
          var params = <String, String>{
            'current_password':
                oldPasswordController.value.text.toString().trim(),
            'conform_password':
                conformPasswordController.value.text.toString().trim(),
            'password': passwordController.value.text.toString().trim()
          };
          openAndCloseLoadingDialog(true);
          ApiService.callPostApi(ApiService.change_password, jsonEncode(params), () {
            openAndCloseLoadingDialog(false);
          }).then((response) {
            if (response == null) {
            } else {
              openAndCloseLoadingDialog(false);
              LoginModel responseData = LoginModel.fromJson(response);
              if ((responseData.error ?? true) == ApiService.ERROR) {

                showSnackBarSucc(responseData.message ?? "");
                // StorageUtil.setData(StorageUtil.isLogin, true);
                // StorageUtil.setData(StorageUtil.keyToken, responseData.token);
                // StorageUtil.setData(StorageUtil.keyLoginData,
                //     jsonEncode(responseData.data!.toJson()));
                // StorageUtil.setData(StorageUtil.userId, responseData.data!.id);
                //
                Get.back();
              } else {
                showSnackBar(responseData.message ?? "");
              }
            }
          });
        }
      }
    });
  }
}
