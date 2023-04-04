import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/util/appText.dart';
import 'package:quick_pharma/view/screens/auth/sign_in_screen.dart';
import 'package:quick_pharma/view/screens/forget_password/otp_screen.dart';

import '../../apiservice/api_service.dart';
import '../../main.dart';
import '../../model/loginModel.dart';
import '../../utils/string_utils.dart';
import '../../view/screens/forget_password/new_password.dart';

class ForgotPwdController extends GetxController {
  final emailController = TextEditingController().obs;
  final otpController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final isEmailEmpty = false.obs;
  final isOtpEmpty = false.obs;
  final isNewPEmpty = false.obs;
  final isConfirmPEmpty = false.obs;
  final isNewPShow = false.obs;
  final isConfirmPShow = false.obs;
  final emailValidationMsg = msgEmailRequired.obs;


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

  callForgotApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        if (checkString(emailController.value.text.toString().trim())) {
          isEmailEmpty.value = true;
        } else {
          isEmailEmpty.value = false;
          var params = <String, String>{
            'email': emailController.value.text.toString().trim(),
          };
          openAndCloseLoadingDialog(true);
          ApiService.callPostApi(ApiService.forgot_password, jsonEncode(params), () {
            openAndCloseLoadingDialog(false);
          }).then((response) {
            if (response == null) {
            } else {
              openAndCloseLoadingDialog(false);
              LoginModel responseData = LoginModel.fromJson(response);
              if ((responseData.error ?? true) == ApiService.ERROR) {
                showSnackBarSucc(responseData.message ?? "");
                Get.to(OtpScreen());
              } else {
                showSnackBar(responseData.message ?? "");
              }
            }
          });
        }
      }
    });
  }

  callVerifyOtpApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        if (checkString(otpController.value.text.toString().trim())) {
          isOtpEmpty.value = true;
        } else {
          isOtpEmpty.value = false;
          var params = <String, String>{
            'email': emailController.value.text.toString().trim(),
            'otp': otpController.value.text.toString().trim(),
          };
          openAndCloseLoadingDialog(true);
          ApiService.callPostApi(ApiService.verify_otp, jsonEncode(params), () {
            openAndCloseLoadingDialog(false);
          }).then((response) {
            if (response == null) {
            } else {
              openAndCloseLoadingDialog(false);
              LoginModel responseData = LoginModel.fromJson(response);
              if ((responseData.error ?? true) == ApiService.ERROR) {
                showSnackBarSucc(responseData.message ?? "");
                Get.to(NewPasswordChange());
              } else {
                showSnackBar(responseData.message ?? "");
              }
            }
          });
        }
      }
    });
  }

  callResetPwdApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        if (checkString(newPasswordController.value.text.toString().trim())) {
          isNewPEmpty.value = true;
        } else if (checkString(
            confirmPasswordController.value.text.toString().trim())) {
          isConfirmPEmpty.value = true;
        } else {
          isNewPEmpty.value = false;
          isConfirmPEmpty.value = false;
          var params = <String, String>{
            'email': emailController.value.text.toString().trim(),
            'otp': otpController.value.text.toString().trim(),
            'password': newPasswordController.value.text.toString().trim(),
            'conform_password':
                confirmPasswordController.value.text.toString().trim(),
          };
          openAndCloseLoadingDialog(true);
          ApiService.callPostApi(ApiService.reset_password, jsonEncode(params),
              () {
            openAndCloseLoadingDialog(false);
          }).then((response) {
            if (response == null) {
            } else {
              openAndCloseLoadingDialog(false);
              LoginModel responseData = LoginModel.fromJson(response);
              if ((responseData.error ?? true) == ApiService.ERROR) {
                showSnackBarSucc(responseData.message ?? "");
                Get.offAll(SignInScreen());
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
