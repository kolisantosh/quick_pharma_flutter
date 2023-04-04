import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_pharma/util/appText.dart';
import '../../apiservice/api_service.dart';
import '../../main.dart';
import '../../model/loginModel.dart';
import '../../util/constants.dart';
import '../../utils/storage_utils.dart';
import '../../utils/string_utils.dart';
import '../../view/screens/auth/sign_in_screen.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController(text: AppConstants.userName).obs;
  final mobileController = TextEditingController(text: AppConstants.userMobile).obs;
  final emailController = TextEditingController(text: AppConstants.userEmail).obs;
  final unmController = TextEditingController(text: AppConstants.userUnm).obs;
  final locController = TextEditingController(text: AppConstants.userLoc).obs;
  final isEmailEmpty = false.obs;
  final isMobileEmpty = false.obs;
  final isNameEmpty = false.obs;
  final isUnmEmpty = false.obs;
  final isLocEmpty = false.obs;
  final emailValidationMsg = msgEmailRequired.obs;

  final imageUrl = AppConstants.userProfileImage.obs;
  final image = "".obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onReady() {
    super.onReady();
    callProfileApi();
  }

  //updateUser
  callUserApi() async {
    var latitude = await StorageUtil.getData(StorageUtil.latitude);
    var longitude = await StorageUtil.getData(StorageUtil.longitude);
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        if (checkString(emailController.value.text.toString().trim())) {
          isEmailEmpty.value = true;
        } else if (checkString(mobileController.value.text.toString().trim())) {
          isMobileEmpty.value = true;
        } else if (checkString(nameController.value.text.toString().trim())) {
          isNameEmpty.value = true;
        } else if (checkString(locController.value.text.toString().trim())) {
          isLocEmpty.value = true;
        } else if (checkString(unmController.value.text.toString().trim())) {
          isUnmEmpty.value = true;
        } else {
          isEmailEmpty.value = false;
          isMobileEmpty.value = false;
          isNameEmpty.value = false;
          isUnmEmpty.value = false;
          isLocEmpty.value = false;
          var params = <String, String>{
            'name': nameController.value.text.toString().trim(),
            'email': emailController.value.text.toString().trim(),
            'address': locController.value.text.toString().trim(),
            'phone': mobileController.value.text.toString().trim(),
            'username': unmController.value.text.toString().trim(),
            'latitude': latitude.toString(),
            'longitude': longitude.toString(),
          };
          openAndCloseLoadingDialog(true);
          ApiService.CallUpdateProfileApi(ApiService.updateUser, params,image.value, () {
            openAndCloseLoadingDialog(false);
          }).then((response) {
            if (response == null) {
            } else {
              openAndCloseLoadingDialog(false);
              LoginModel responseData = LoginModel.fromJson(response);
              if ((responseData.error ?? true) == ApiService.ERROR) {
                print("responseData=> " + responseData.toString());
                // StorageUtil.setData(StorageUtil.keyLoginData,
                //     jsonEncode(responseData.data!.toJson()));
                // StorageUtil.setData(StorageUtil.userId, responseData.data!.id);
                Get.back(result: "data");
              } else {
                showSnackBar(responseData.message ?? "");
              }
            }
          });
        }
      }
    });
  }

  Future callProfileApi() async{
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        var params = <String, String>{
        };
        openAndCloseLoadingDialog(true);
        ApiService.callPostApi(
            ApiService.getUser, jsonEncode(params), () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          if (response == null) {} else {
            openAndCloseLoadingDialog(false);
            LoginModel responseData =
            LoginModel.fromJson(response);
            if ((responseData.error ?? true) == ApiService.ERROR) {

              // StorageUtil.setData(StorageUtil.isLogin, true);
              // StorageUtil.setData(StorageUtil.keyToken, responseData.token);
              StorageUtil.setData(StorageUtil.keyLoginData,jsonEncode(responseData.data!.toJson()));
              getUserData();
              // StorageUtil.setData(StorageUtil.userId,responseData.data!.id);

            } else {
              showSnackBar(responseData.message ?? "");
            }
          }
        });
      }
    });
  }

  getUserData() {
    StorageUtil.getData(StorageUtil.keyLoginData).then((value) {
      if (value != null) {
        UserData data = UserData.fromJson(jsonDecode(value));

        nameController.value.text = data.name??"";
        mobileController.value.text = data.phone??"";
        emailController.value.text = data.email??"";
        unmController.value.text = data.email??"";
        locController.value.text = data.address??"";
        imageUrl.value = data.avatar??"";

        AppConstants.userName = data.name??"";
        AppConstants.userMobile = data.phone??"";
        AppConstants.userEmail = data.email??"";
        AppConstants.userProfileImage = data.avatar??"";
        AppConstants.userUnm = data.username??"";
        AppConstants.userLoc = data.address??"";
          AppConstants.userId = data.id!;
          print("userId=>${AppConstants.userId}");
      }
    });
  }

  //delete_user
  callDeleteAccApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        var params = <String, String>{};
        openAndCloseLoadingDialog(true);
        ApiService.callPostApi(ApiService.delete_user, jsonEncode(params), () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          if (response == null) {
          } else {
            openAndCloseLoadingDialog(false);
            StorageUtil.clearData();
            Get.back();
            Get.offAll(SignInScreen());
          }
        });
      }
    });
  }

  openFilePicker() async {
    final photo  = await _picker.pickImage(source: ImageSource.gallery);
    image.value = photo!.path;
    update();
    Get.back();
  }

  openCameraPicker() async {
    final photo  = await _picker.pickImage(source: ImageSource.camera);
    image.value = photo!.path;
    update();
    Get.back();
  }

}
