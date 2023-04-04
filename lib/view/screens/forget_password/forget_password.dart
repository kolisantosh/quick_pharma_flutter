import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quick_pharma/Wedget/custome_Button/Custome_Button.dart';
import 'package:quick_pharma/controller/forgot_password/forgotpwd_controller.dart';
import 'package:quick_pharma/util/appText.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';
import 'package:quick_pharma/view/screens/forget_password/new_password.dart';

import '../../../util/ColorConstants.dart';

class ForGetPassword extends StatefulWidget {
  const ForGetPassword({Key? key}) : super(key: key);

  @override
  State<ForGetPassword> createState() => _ForGetPasswordState();
}

class _ForGetPasswordState extends State<ForGetPassword> {
  final myController=Get.put(ForgotPwdController());
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorConstants.appColor,
            centerTitle: true,
            title:const Text(AppText.forgetPassword),
            leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon:const Icon(Icons.arrow_back_ios,
              ),
            )
        ),
        body: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFFFFFE77B),
                backgroundImage: AssetImage(Images.appLogo,),
                // child: Text("logo".toUpperCase()),
              ),
              Padding(
                padding:const EdgeInsets.all(30),
                child: Text(AppText.enterNumber, style: poppinsRegular.copyWith(color: Colors.black), textAlign: TextAlign.center,),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: myController.emailController.value,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                    ),

                    hintText: "Email Id",
                    hintStyle: TextStyle(
                        fontSize: 15, color: Colors.black)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              Container(
                padding:const EdgeInsets.only(top: 40,left: 17,right: 17),
                child: CustomeButton(
                    child: Text(AppText.next,style: poppinsRegular.copyWith(color: Colors.white,fontSize: 18),),
                    onPress: (){
                      myController.callForgotApi();
                     }
                ),
              ),
            ]));
  }
}
