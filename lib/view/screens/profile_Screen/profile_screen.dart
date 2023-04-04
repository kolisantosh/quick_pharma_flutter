import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/util/appText.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';
import 'package:quick_pharma/utils/storage_utils.dart';
import 'package:quick_pharma/view/screens/Earnings_Screen/earnings_Screen.dart';
import 'package:quick_pharma/view/screens/auth/sign_in_screen.dart';
import 'package:quick_pharma/view/screens/profile_Screen/update_profile_screen.dart';
import '../../../controller/profile/profile_controller.dart';
import '../../../model/loginModel.dart';
import '../../../util/ColorConstants.dart';
import '../../../util/constants.dart';
import '../setting_screen/setting_Screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final myController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() {
    StorageUtil.getData(StorageUtil.keyLoginData).then((value) {
      if (value != null) {
        UserData data = UserData.fromJson(jsonDecode(value));
        setState(() {
          AppConstants.userName = data.name ?? "";
          AppConstants.userMobile = data.phone ?? "";
          AppConstants.userEmail = data.email ?? "";
          AppConstants.userProfileImage = data.avatar ?? "";
          AppConstants.userUnm = data.username ?? "";
          AppConstants.userLoc = data.address ?? "";
          AppConstants.userId = data.id!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.appColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          actions: [
            InkWell(
              child: Image.asset(Images.editProfileNewIcon,color: ColorConstants.white,),
              onTap: () async {
                var res = await Get.to(UpdateProfileScreen());

                if (res != null) {
                  myController.callProfileApi();
                  getUserData();
                }
              },
            ),
          ],
        ),
        body: Obx(
          () => Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              myController.imageUrl.value != ""
                  ? Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: CachedNetworkImage(
                        imageUrl: myController.imageUrl.value,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                        ),
                        placeholder: (context, url) =>
                             Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                             ClipOval(child: Image.asset( Images.qpLogo)),
                      ),
                    )
                  : Container(
                      alignment: Alignment.bottomRight,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Images.qpLogo),
                              // '${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${userController.userInfoModel.image}'
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
              SizedBox(
                height: 5,
              ),
              Text(
                myController.nameController.value.text,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: poppinsSemiBold.copyWith(
                    fontSize: Dimensions.fontSizeOverLarge,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset(Images.emailicon,color: ColorConstants.white,),
                          Text(
                            myController.emailController.value.text,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset(Images.locationicon,color: ColorConstants.white,),
                          Text(
                            myController.locController.value.text,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset(Images.callicon,color: ColorConstants.white,),
                          Text(
                            myController.mobileController.value.text,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              Expanded(
                flex: 20,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: ListView(
                    children: [
                      // ListTile(
                      //   onTap: (){
                      //     Get.to(UpdateProfileScreen());
                      //   },
                      //   leading:Container(
                      //     alignment: Alignment.center,
                      //     height: 40,
                      //     width: 40,
                      //     decoration: BoxDecoration(
                      //       color: Color(0xFFF002501),
                      //       borderRadius: BorderRadius.all(Radius.circular(10))
                      //     ),
                      //     child: Icon(Icons.account_circle_outlined,color: Color(0xFFFFFE77B),),
                      //   ),
                      //   title: Text(AppText.myProfile,style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Color(0xFFF002501)),),
                      //   trailing: Icon(Icons.arrow_forward_ios,color: Color(0xFFF002501),)
                      // ),
                      ListTile(
                          onTap: () {
                            Get.to(SettingScreen());
                          },
                          leading: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: ColorConstants.gray50,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Image.asset(Images.setingicon,
                              color: ColorConstants.appColor,
                            ),
                          ),
                          title: Text(
                            AppText.setting,
                            style: poppinsMedium.copyWith(
                                fontSize: Dimensions.fontSizeSmall,
                                color: Color(0xFFF002501)),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFF002501),
                          )),
                      ListTile(
                        onTap: () {
                          Get.to(EarningScreen());
                        },
                        leading: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorConstants.gray50,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: Image.asset("assets/image/erningPage.png",color: ColorConstants.appColor,),
                        ),
                        title: Text(
                          AppText.myEarnings,
                          style: poppinsMedium.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                              color: Color(0xFFF002501)),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFF002501),
                        ),
                      ),
                      // ListTile(
                      //   onTap: (){
                      //     Get.to(EarningScreen());
                      //   },
                      //   leading:Container(
                      //     alignment: Alignment.center,
                      //     height: 40,
                      //     width: 40,
                      //     decoration: BoxDecoration(
                      //       color: Color(0xFFF002501),
                      //       borderRadius: BorderRadius.all(Radius.circular(10))
                      //     ),
                      //     child: Icon(Icons.location_history_outlined,color: Color(0xFFFFFE77B),),
                      //   ),
                      //   title: Text(AppText.history,style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Color(0xFFF002501)),),
                      //   trailing: Icon(Icons.arrow_forward_ios,color: Color(0xFFF002501),)
                      // ),
                      // ListTile(
                      //     onTap: () {
                      //       Get.to(NotificationScreen());
                      //     },
                      //     leading: Container(
                      //       alignment: Alignment.center,
                      //       height: 40,
                      //       width: 40,
                      //       decoration: BoxDecoration(
                      //           color: ColorConstants.gray50,
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(10))),
                      //       child: Image.asset(Images.notificationicon,
                      //         color: ColorConstants.appColor,
                      //       ),
                      //     ),
                      //     title: Text(
                      //       AppText.notification,
                      //       style: poppinsMedium.copyWith(
                      //           fontSize: Dimensions.fontSizeSmall,
                      //           color: Color(0xFFF002501)),
                      //     ),
                      //     trailing: Icon(
                      //       Icons.arrow_forward_ios,
                      //       color: Color(0xFFF002501),
                      //     )),
                      ListTile(
                        onTap: () {
                          logout();
                        },
                        leading: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorConstants.gray50,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset(Images.logouticon,
                            color: ColorConstants.appColor,
                          ),
                        ),
                        title: Text(
                          AppText.logout,
                          style: poppinsMedium.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                              color: Color(0xFFF002501)),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFF002501),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

logout() {
  Get.defaultDialog(
      backgroundColor: Color(0xFFFC7DFCA),
      title: "",
      middleText: "",
      content: Container(
        padding: EdgeInsets.only(left: 20),
        height: 180,
        width: Get.size.width,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  AppText.logout1,
                  style: poppinsMedium.copyWith(
                      fontSize: Dimensions.fontSizeSmall, color: Colors.black),
                )
              ],
            ),
            SizedBox(
              height: Get.size.height / 30,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  msgAreYouSureLMessage,
                  style: poppinsRegular.copyWith(
                      fontSize: Dimensions.fontSizeSmall, color: Colors.black),
                )
              ],
            ),
            SizedBox(
              height: Get.size.height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                    child: Text(
                      AppText.cancel,
                      style: poppinsMedium.copyWith(
                          fontSize: Dimensions.fontSizeSmall,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    StorageUtil.clearData();
                    Get.back();
                    Get.offAll(SignInScreen());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: ColorConstants.appColor,
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                    child: Text(
                      "Logout",
                      style: poppinsMedium.copyWith(
                          fontSize: Dimensions.fontSizeSmall,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ));
}
