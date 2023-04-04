import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'package:quick_pharma/Wedget/custome_Button/Custome_Button.dart';
import 'package:quick_pharma/util/ColorConstants.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';
import 'package:quick_pharma/view/screens/payment_Screen/add_debit_Card.dart';
import 'package:quick_pharma/view/screens/payment_slip_Screen/payment_Slip_Screen.dart';

class PaymentScreenNew extends StatefulWidget {
  const PaymentScreenNew({Key? key}) : super(key: key);

  @override
  State<PaymentScreenNew> createState() => _PaymentScreenNewState();
}

class _PaymentScreenNewState extends State<PaymentScreenNew> {
  int radioSelected = 1;
  String radioVal = "";
  final paymentItem = <PaymentItem>[];
  @override
  void initState() {
    paymentItem.add(const PaymentItem(
        amount: "20", label: "Test", status: PaymentItemStatus.final_price));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("Payment Method"),
        centerTitle: true,
        backgroundColor: ColorConstants.appColor,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 30),
            width: MediaQuery.of(context).size.width,
            height: 62,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white)),
            child: ListTile(
              onTap: () {
                Get.to(AddDebitCard());
              },
              leading: Image.asset(Images.wallet_new),
              title: Text(
                "Add a new card",
                style: poppinsMedium.copyWith(
                    fontSize: Dimensions.fontSizeSmall, color: Colors.white),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Row(
              children: [
                Text(
                  "Other Payment Method",
                  style: poppinsMedium.copyWith(
                      fontSize: Dimensions.fontSizeSmall, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  ListTile(
                    onTap: (){
                      GooglePayButton(
                        paymentItems: paymentItem,
                        onPaymentResult: (data) {
                          print("+++++Data+++++");
                          print(data.toString());
                        },
                        onError: (error) {
                          print("error");
                          print(error);
                        },
                        paymentConfigurationAsset: "gpay.json",
                        width: RawGooglePayButton.minimumButtonWidth,
                        height: RawGooglePayButton.defaultButtonHeight,
                        loadingIndicator: CircularProgressIndicator(),
                        type: GooglePayButtonType.pay,
                      );
                    },
                      leading: Image.asset(Images.new_created_card),
                      title: Text("Dabit Card"),
                      trailing: Radio(
                        value: 1,
                        groupValue: radioSelected,
                        activeColor: ColorConstants.appColor,
                        onChanged: (int? value) {
                          setState(() {
                            radioSelected = value!;
                            radioVal = 'Dabit Card';
                            print(radioSelected);
                          });
                        },
                      )),
                  ListTile(
                      onTap: () {},
                      leading: Image.asset(Images.google_new_pay),
                      title: Text("Google Pay"),
                      trailing: Radio(
                        value: 2,
                        groupValue: radioSelected,
                        activeColor: ColorConstants.appColor,
                        onChanged: (int? value) {
                          setState(() {
                            radioSelected = value!;
                            radioVal = 'Google Pay';
                            print(radioSelected);
                          });
                        },
                      )),
                  ListTile(
                      leading: Image.asset(Images.apple_new),
                      title: Text("Apple Pay"),
                      trailing: Radio(
                        value: 3,
                        groupValue: radioSelected,
                        activeColor: ColorConstants.appColor,
                        onChanged: (int? value) {
                          setState(() {
                            radioSelected = value!;
                            radioVal = 'Apple Pay';
                            print(radioSelected);
                          });
                        },
                      )),
                  GooglePayButton(
                    paymentItems: paymentItem,
                    onPaymentResult: (data) {
                      print("+++++Data+++++");
                      print(data.toString());
                    },
                    onError: (error) {
                      print("error");
                      print(error);
                    },
                    paymentConfigurationAsset: "gpay.json",
                    width: RawGooglePayButton.minimumButtonWidth,
                    height: RawGooglePayButton.defaultButtonHeight,
                    loadingIndicator: CircularProgressIndicator(),
                    type: GooglePayButtonType.pay,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomeButton(
                      child: Text(
                        "Proceed To Payment",
                        style: poppinsMedium.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                            color: Colors.white),
                      ),
                      onPress: () {
                        Get.to(PaymentSlipScreen());
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
