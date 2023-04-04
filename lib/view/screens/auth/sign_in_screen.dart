import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quick_pharma/util/ColorConstants.dart';
import 'package:quick_pharma/util/appText.dart';
import 'package:quick_pharma/util/constants.dart';
import 'package:quick_pharma/view/screens/about_us/WebViewClass.dart';
import 'package:quick_pharma/view/screens/forget_password/forget_password.dart';
import '../../../Wedget/custome_Button/Custome_Button.dart';
import '../../../Wedget/widget_common_text_field.dart';
import '../../../apiservice/api_service.dart';
import '../../../controller/login/login_controller.dart';
import '../../../util/app_size.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../../../util/styles.dart';
import '../../../utils/string_utils.dart';
import '../homePage/home_Page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final myController = Get.put(LoginController());
  TextInputType? inputType;
  bool isKeep = false;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height / 1.5;
    return Scaffold(
        extendBody: true,
        backgroundColor: ColorConstants.appColor,
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {
        //       print(hight);
        //     },
        //     icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
        //   ),
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Icon(Icons.settings_outlined, color: Colors.white),
        //     ),
        //   ],
        // ),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 50),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircleAvatar(
                      //   radius: 45,
                      //   backgroundColor: Color(0xFFFFFE77B),
                      //   backgroundImage: AssetImage(
                      //     Images.appLogo,
                      //   ),
                      //   // child: Text("logo".toUpperCase()),
                      // )
                      Image.asset(Images.appLogo,scale: 1.4,),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Text(
                    AppText.wellcpmeText,
                    style: poppinsSemiBold.copyWith(
                        color: Colors.white,
                        fontSize: Dimensions.fontSizeOverLarge),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Text(
                    AppText.medicineText,
                    style: poppinsRegular.copyWith(
                        color: Colors.white,
                        fontSize: Dimensions.fontSizeExtraSmall),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(top: 40, left: 17, right: 17),
                      decoration: BoxDecoration(
                        color: ColorConstants.appColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 40, left: 17, right: 17),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Obx(
                      () => Column(
                        children: [

                          TextFormField(
                            // inputFormatters: inputType == TextInputType.phone
                            //     ? <TextInputFormatter>[
                            //         FilteringTextInputFormatter.allow(
                            //             RegExp('[0-9]'))
                            //       ]
                            //     : null,
                            keyboardType: TextInputType.emailAddress,
                            // obscureText: show,
                            obscuringCharacter: ".",
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

                                // prefixIcon: Image.asset(Images.password),
                                // suffixIcon: IconButton(icon:Icon(show?Icons.remove_red_eye:Icons.remove_red_eye), onPressed: () {
                                //   setState(() {
                                //     show=!show;
                                //   });
                                // },),
                                hintText: "Username",
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
                            obscureText: show,
                            obscuringCharacter: "*",
                            controller: myController.passwordController.value,
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
                                // prefixIcon: Image.asset(Images.password),
                                suffixIcon: IconButton(
                                  icon: Icon(show
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.visibility_off_outlined),
                                  onPressed: () {
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          InkWell(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isKeep = !isKeep;
                                      print(isKeep);
                                    });
                                  },
                                  child: isKeep == false
                                      ? const Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: Colors.black87,
                                        )
                                      : const Icon(
                                          Icons.check_circle,
                                          color: Colors.indigo,
                                        ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.height / 50,
                                ),
                                Expanded(
                                  flex: 1,
                                    child:TextButton(
                                      onPressed: (){
                                        Get.to(WebViewClass('Privacy Policy',ApiService.policyUrl));
                                      },
                                      child: Text(
                                        AppText.keepMeLogged,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: poppinsRegular.copyWith(
                                            color: Color(0xFFF002501),
                                            fontSize: Dimensions.fontSizeDefault,
                                        ),
                                      ),
                                    ),
                                ),
                              ],
                            ),
                            onTap: () {
                              // authController.toggleRememberMe();
                            },
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
                              AppText.login,
                              style: poppinsMedium.copyWith(
                                  fontSize: 18, color: Colors.white),
                            ),
                            onPress: () {
                              // if (_fromKey.currentState!.validate())
                              myController.callLoginApi();
                              // Get.offAll(HomePageView());
                            },
                            //  onPress:authController.acceptTerms ? () => _login(authController, _countryDialCode) : null
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25,
                          ),
                         /* TextButton(
                            onPressed: () {
                              Get.to(ForGetPassword());
                              // Get.toNamed(RouteHelper.getForgotPassRoute(false, null));
                            },
                            child: Text(
                              AppText.forgetPassword,
                              style: poppinsRegular.copyWith(
                                fontSize: Dimensions.fontSizeDefault,
                                color: Color(0xFFF002501),
                              ),
                            ),
                          ),*/
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height / 30,
                          // ),
                          // RichText(
                          //     text: TextSpan(
                          //   text: AppText.donotHaveAnAccount,
                          //   style: poppinsRegular.copyWith(
                          //       fontSize: Dimensions.fontSizeDefault,
                          //       color: Color(0xFFF002501)),
                          //   children: [
                          //     TextSpan(
                          //         text: AppText.signUp,
                          //         style: poppinsRegular.copyWith(
                          //             fontSize: 16, color: Color(0xFFF2D5F2E)),
                          //         recognizer: TapGestureRecognizer()
                          //           ..onTap = () {}),
                          //   ],
                          // )),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
