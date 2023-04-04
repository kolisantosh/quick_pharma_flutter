import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_pharma/controller/profile/profile_controller.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';
import 'package:quick_pharma/view/screens/change_password/change_password.dart';

import '../../../util/ColorConstants.dart';
import '../../../util/appText.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final myController=Get.put(ProfileController());
  String dropdownvalue = 'Month';

  var items = [
    'Month',
    'Week',
  ];
  String currentDate1 = DateFormat("MMM,yyyy").format(DateTime.now());
  String currentDate2 = DateFormat("MMM").format(DateTime.now());
  String currentDate3 = DateFormat("EEE").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorConstants.appColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Settings',
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [

                    ListTile(
                        onTap: (){
                          Get.to(ChangePwdScreen());
                        },
                        leading:Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorConstants.gray50,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Image.asset(Images.changepwd,color:  ColorConstants.appColor,),
                        ),
                        title: Text(AppText.changepassword,style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Color(0xFFF002501)),),
                        trailing:Icon(Icons.arrow_forward_ios,color: Color(0xFFF002501),)
                    ),
                    ListTile(
                        onTap: (){
                          deleteAccount();
                          // Get.to(NotificationScreen());
                        },
                        leading:Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: ColorConstants.gray50,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Image.asset(Images.deleteicon,color:  ColorConstants.appColor,),
                        ),
                        title: Text(AppText.deleteaccount,style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Color(0xFFF002501)),),
                        trailing:Icon(Icons.arrow_forward_ios,color: Color(0xFFF002501),)
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(
      thickness: 1.2,
      color: Color(0xFFDCE8FA),
      height: 5,
      indent: 15,
      endIndent: 15,
    );
  }


  deleteAccount(){
    Get.defaultDialog(
        backgroundColor: Color(0xFFFC7DFCA),
        title: "",
        middleText: "",
        content: Container(
          padding: EdgeInsets.only(left: 20),
          height:180,
          width:Get.size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Text(AppText.deleteaccount1,style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),)
                ],
              ),
              SizedBox(height: Get.size.height/30,),
              Column(
                children: [
                  Text(msgAreYouSureDMessage,style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),)
                ],
              ),
              SizedBox(height: Get.size.height/30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap:(){
                      Get.back();
                    },
                    child:Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(22))
                      ),
                      child: Text(AppText.cancel,style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      myController.callDeleteAccApi();
                    },
                    child:Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorConstants.appColor,
                          borderRadius: BorderRadius.all(Radius.circular(22))
                      ),
                      child: Text(AppText.deleteaccount,textAlign:TextAlign.center,style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.white),),
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }

}
