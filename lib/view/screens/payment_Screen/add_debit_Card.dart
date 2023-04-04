import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/Wedget/custome_Button/Custome_Button.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/styles.dart';
import 'package:quick_pharma/view/screens/payment_Screen/payment_Screen.dart';

import '../../../util/ColorConstants.dart';

class AddDebitCard extends StatefulWidget {
  const AddDebitCard({Key? key}) : super(key: key);

  @override
  State<AddDebitCard> createState() => _AddDebitCardState();
}

class _AddDebitCardState extends State<AddDebitCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Get.back();
          },
        ),
        title: Text("Dabit Card"),
        centerTitle: true,
        backgroundColor: ColorConstants.appColor,
      ),
      body:SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/20,right: MediaQuery.of(context).size.width/20),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: CreditCardWidget(
                textStyle: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black87),
                isHolderNameVisible: true,
                cardBgColor: Color(0xFFFC7DFCA),
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                onCreditCardWidgetChange: (CreditCardBrand ) {},
              ),
            ),
            Expanded(
              flex: 20,
              child:  Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: ListView(
                   children: [
                     CreditCardForm(
                       cardNumber: cardNumber,
                       expiryDate: expiryDate,
                       cardHolderName: cardHolderName,
                       cvvCode: cvvCode,
                       formKey: formKey,
                       onCreditCardModelChange: onCreditCardModelChange,
                       obscureCvv: true,
                       obscureNumber: true,
                       cardNumberDecoration:InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: Color(0xFFF2D5F2E)),
                         ),
                         labelText: 'Card Number',
                         labelStyle: TextStyle(color: Colors.black87),

                         hintText: 'XXXX XXXX XXXX XXXX',
                       ),
                       expiryDateDecoration: const InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: Color(0xFFF2D5F2E)),
                         ),
                         labelStyle: TextStyle(color: Colors.black87),
                         labelText: 'Expire date',
                         hintText: 'XX/XX',
                       ),
                       cvvCodeDecoration: const InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: Color(0xFFF2D5F2E)),
                         ),
                         labelText: 'Secure Code',
                         hintText: 'XXX',
                       ),
                       cardHolderDecoration: const InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: Color(0xFFF2D5F2E)),
                         ),
                         labelText: 'Name on Card',
                       ), themeColor: Colors.green,
                     ),
                     SizedBox(height: MediaQuery.of(context).size.height/40,),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: CustomeButton(
                         child: Text("Add Card",style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.white),),
                         onPress: (){
                           if (formKey.currentState!.validate()) {
                             print('valid!');
                             print("Your card successfully valid !!!");
                             Get.off(PaymentScreenNew());
                           } else {
                             print('invalid!');
                           }
                         },
                       ),
                     ),
                   ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
