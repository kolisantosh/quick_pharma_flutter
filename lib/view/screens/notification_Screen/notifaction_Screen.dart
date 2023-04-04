import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_pharma/util/appText.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';

import '../../../util/ColorConstants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
      backgroundColor: ColorConstants.appColor,
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
                        AppText.notification,
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
                      leading:Image.asset(Images.noti_image_new),
                      title: Text("ARX Pharmacy",style: poppinsRegular.copyWith(color: ColorConstants.appColor,fontSize: Dimensions.fontSizeSmall),),
                      subtitle:Text("We gave 10% discount on blood pressure medicines.",),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    divider(),
                    ListTile(
                      leading:Image.asset(Images.noti_image_new),
                      title: Text("ARX Pharmacy",style: poppinsRegular.copyWith(color: ColorConstants.appColor,fontSize: Dimensions.fontSizeSmall),),
                      subtitle:Text("We gave 10% discount on blood pressure medicines.",),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    divider(),
                    ListTile(
                      leading:Image.asset(Images.noti_image_new),
                      title: Text("ARX Pharmacy",style: poppinsRegular.copyWith(color: ColorConstants.appColor,fontSize: Dimensions.fontSizeSmall),),
                      subtitle:Text("We gave 10% discount on blood pressure medicines.",),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    divider(),
                    ListTile(
                      leading:Image.asset(Images.noti_image_new),
                      title: Text("ARX Pharmacy",style: poppinsRegular.copyWith(color: ColorConstants.appColor,fontSize: Dimensions.fontSizeSmall),),
                      subtitle:Text("We gave 10% discount on blood pressure medicines.",),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/30,),
                    divider(),
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
}
