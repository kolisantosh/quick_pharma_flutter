import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_pharma/Wedget/custome_Button/Custome_Button.dart';
import 'package:quick_pharma/controller/change_password/change_controller.dart';
import 'package:quick_pharma/util/appText.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';

import '../../../util/ColorConstants.dart';

class ChangePwdScreen extends StatefulWidget {
  const ChangePwdScreen({Key? key}) : super(key: key);

  @override
  State<ChangePwdScreen> createState() => _ChangePwdScreenState();
}

class _ChangePwdScreenState extends State<ChangePwdScreen> {
  final myController = Get.put(ChangePwdController());

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
                      AppText.changepassword,
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
                    Obx(
                      () => Column(
                        children: [
                          TextFormField(
                            // inputFormatters: inputType == TextInputType.phone
                            //     ? <TextInputFormatter>[
                            //         FilteringTextInputFormatter.allow(
                            //             RegExp('[0-9]'))
                            //       ]
                            //     : null,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: myController.isOPasswordVisible.value,
                            obscuringCharacter: "*",
                            controller:
                                myController.oldPasswordController.value,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                // prefixIcon: Image.asset(Images.password),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      myController.isOPasswordVisible.value
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.visibility_off_outlined),
                                  onPressed: () {
                                    setState(() {
                                      myController.isOPasswordVisible.value =
                                          !myController
                                              .isOPasswordVisible.value;
                                    });
                                  },
                                ),
                                hintText: "Old Password",
                                hintStyle: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                          // WidgetCommonTextField(
                          //   textEditingController:
                          //       myController.emailController.value,
                          //   textStyle: textMedium.copyWith(
                          //       color: ColorConstants.black),
                          //   inputType: TextInputType.emailAddress,
                          //   inputAction: TextInputAction.next,
                          //   hintText: "example@gmail.com",
                          //   onTextChanged: () {
                          //     if (myController.isEmailEmpty.value) {
                          //       if (isEmail(myController
                          //           .emailController.value.text
                          //           .toString()
                          //           .trim())) {
                          //         myController.emailValidationMsg.value =
                          //             msgEmailNotValid;
                          //       } else {
                          //         myController.isEmailEmpty.value = false;
                          //       }
                          //     }
                          //   },
                          // ).marginOnly(top: size_10),

                          // IntlPhoneField(
                          //   controller: _phoneController,
                          //   decoration: const InputDecoration(
                          //     hintText: "7562904785",
                          //   ),
                          //   initialCountryCode: 'IN',
                          //   onChanged: (phone) {
                          //     print(phone.completeNumber);
                          //   },
                          // ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          TextFormField(
                            // inputFormatters: inputType == TextInputType.phone
                            //     ? <TextInputFormatter>[
                            //         FilteringTextInputFormatter.allow(
                            //             RegExp('[0-9]'))
                            //       ]
                            //     : null,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: myController.isPasswordVisible.value,
                            obscuringCharacter: "*",
                            controller: myController.passwordController.value,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                // prefixIcon: Image.asset(Images.password),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      myController.isPasswordVisible.value
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.visibility_off_outlined),
                                  onPressed: () {
                                    setState(() {
                                      myController.isPasswordVisible.value =
                                          !myController.isPasswordVisible.value;
                                    });
                                  },
                                ),
                                hintText: "New Password",
                                hintStyle: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          TextFormField(
                            // inputFormatters: inputType == TextInputType.phone
                            //     ? <TextInputFormatter>[
                            //         FilteringTextInputFormatter.allow(
                            //             RegExp('[0-9]'))
                            //       ]
                            //     : null,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: myController.isCPasswordVisible.value,
                            obscuringCharacter: "*",
                            controller:
                                myController.conformPasswordController.value,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                // prefixIcon: Image.asset(Images.password),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      myController.isCPasswordVisible.value
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.visibility_off_outlined),
                                  onPressed: () {
                                    setState(() {
                                      myController.isCPasswordVisible.value =
                                          !myController
                                              .isCPasswordVisible.value;
                                    });
                                  },
                                ),
                                hintText: "Conform Password",
                                hintStyle: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          //ConditionCheckBox(authController: authController),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          // myController.isEmailEmpty.value==false?Container():
                          CustomeButton(
                            child: Text(
                              AppText.save,
                              style: poppinsMedium.copyWith(
                                  fontSize: 18, color: Colors.white),
                            ),
                            onPress: () {
                              // if (_fromKey.currentState!.validate())
                              myController.callChangePwdApi();
                              // Get.offAll(HomePageView());
                            },
                            //  onPress:authController.acceptTerms ? () => _login(authController, _countryDialCode) : null
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25,
                          ),
                        ],
                      ),
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
}
