import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/Wedget/custome_Button/Custome_Button.dart';
import 'package:quick_pharma/controller/forgot_password/forgotpwd_controller.dart';
import 'package:quick_pharma/util/appText.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/styles.dart';
import 'package:quick_pharma/view/screens/homePage/home_Page.dart';

import '../../../util/ColorConstants.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final myController = Get.put(ForgotPwdController());
  String? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),

      ),
      body: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 15,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xFFFFFE77B),
                  child: Icon(
                    Icons.lock_outline,
                    color: ColorConstants.appColor,
                    size: 50,
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Text(
              AppText.verifyOTP,
              style: poppinsSemiBold.copyWith(
                  color: Colors.white, fontSize: Dimensions.fontSizeOverLarge),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                AppText.passwordDisp,
                style: poppinsRegular.copyWith(
                    color: Colors.white, fontSize: Dimensions.fontSizeSmall),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
        ),
        Container(
          padding: EdgeInsets.only(top: 40, left: 17, right: 17),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: myController.otpController.value,
                obscureText: myController.isNewPShow.value
                    ? myController.isNewPShow.value
                    : false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: AppText.verifyOTP,
                  hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                  suffixIcon: myController.isNewPShow.value
                      ? IconButton(
                          icon: Icon(
                              myController.isNewPShow.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFFF002501)),
                          onPressed: () {
                            setState(() {
                              myController.isNewPShow.value =
                                  !myController.isNewPShow.value;
                            });
                          },
                        )
                      : null,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              CustomeButton(
                child: Text(
                  AppText.verify,
                  style: poppinsMedium.copyWith(
                      color: Colors.white, fontSize: Dimensions.fontSizeSmall),
                ),
                onPress: () {
                  myController.callVerifyOtpApi();
                },
              )
            ],
          ),
        ),
      ]),
    );
  }
}
