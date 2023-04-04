import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_pharma/Wedget/custome_Button/Custome_Button.dart';
import 'package:quick_pharma/controller/profile/profile_controller.dart';
import 'package:quick_pharma/util/appText.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';
import 'package:quick_pharma/utils/storage_utils.dart';
import '../../../model/loginModel.dart';
import '../../../util/ColorConstants.dart';
import '../../../util/constants.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final myController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    myController.getUserData();
  }

  getUserData() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.appColor,
        /*appBar: AppBar(
          backgroundColor: ColorConstants.appColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(AppText.myProfile,
              style: poppinsMedium.copyWith(
                  fontSize: Dimensions.fontSizeSmall, color: Colors.white)),
        ),*/
        // backgroundColor: Theme.of(context).cardColor,
        // appBar: ResponsiveHelper.isDesktop(context) ? WebMenuBar() : null,
        // endDrawer: MenuDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: ColorConstants.white,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            Text(
                              AppText.myProfile,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Expanded(
                flex: 20,
                child: Container(
                  padding: EdgeInsets.only(top: 30, right: 30, left: 30),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: ColorConstants.appColorbg,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Obx(
                    () => ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myController.image.value == ""
                                ? myController.imageUrl.value == ""
                                    ? Container(
                                        alignment: Alignment.bottomRight,
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    Images.new_profile_image)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100))),
                                        child: InkWell(
                                          child: Image.asset(
                                              Images.new_set_profile_images),
                                          onTap: () {
                                            Dialog();
                                          },
                                        ),
                                      )
                                    : Container(
                                        alignment: Alignment.bottomRight,
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage( myController.imageUrl.value ),
                                                // '${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${userController.userInfoModel.image}'
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100))),
                                        child: InkWell(
                                          child: Image.asset(
                                              Images.new_set_profile_images),
                                          onTap: () {
                                            Dialog();
                                          },
                                        ),
                                      )
                                : Container(
                                    alignment: Alignment.bottomRight,
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(
                                                File(myController.image.value)),
                                            // '${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${userController.userInfoModel.image}'
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100))),
                                    child: InkWell(
                                      child: Image.asset(
                                          Images.new_set_profile_images),
                                      onTap: () {
                                        Dialog();
                                      },
                                    ),
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Text(
                          AppText.fristName,
                          style: poppinsRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                              color: Colors.black),
                        ),
                        TextFormField(
                          controller: myController.nameController.value,
                          decoration: InputDecoration(
                              hintText: AppText.fristName,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Text(
                          AppText.phone,
                          style: poppinsRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                              color: Colors.black),
                        ),
                        TextFormField(
                          controller: myController.mobileController.value,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              hintText: AppText.phone,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Text(
                          AppText.username,
                          style: poppinsRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                              color: Colors.black),
                        ),
                        TextFormField(
                          controller: myController.unmController.value,
                          decoration: InputDecoration(
                              hintText: AppText.username,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Text(
                          AppText.location,
                          style: poppinsRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                              color: Colors.black),
                        ),
                        TextFormField(
                          controller: myController.locController.value,
                          decoration: InputDecoration(
                              hintText: AppText.location,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Text(
                          AppText.Emailid,
                          style: poppinsRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                              color: Colors.black),
                        ),
                        TextFormField(
                          controller: myController.emailController.value,
                          decoration: InputDecoration(
                              hintText: AppText.Emailid,
                              hintStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        CustomeButton(
                            child: Text(
                              "Save",
                              style: poppinsMedium.copyWith(
                                  fontSize: 18, color: Colors.white),
                            ),
                            onPress: () {
                              myController.callUserApi();
                            }),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Dialog() {
    Get.bottomSheet(
      Container(
          height: 150,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),
                    Row(
                      children: [
                        Text(
                          "Change Profile Picture",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.camera_alt_sharp,
                                  color: Colors.white,
                                ),
                                backgroundColor: ColorConstants.appColor,
                                radius: 22,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Text(
                                "Camera",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          onTap: () async {
                            myController.openCameraPicker();
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 30,
                        ),
                        InkWell(
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.photo_size_select_actual_outlined,
                                  color: Colors.white,
                                ),
                                backgroundColor: ColorConstants.appColor,
                                radius: 22,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Text(
                                "Gallery",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          onTap: () async {
                            myController.openFilePicker();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
    );
  }
}
