import 'package:flutter/material.dart';
import 'package:quick_pharma/util/app_size.dart';
import 'dimensions.dart';

final poppinsRegular = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final poppinsMedium = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final poppinsBold = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final poppinsSemiBold = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
  fontSize: Dimensions.fontSizeDefault,
);


 var textRegular = const TextStyle(
fontSize: font_16);

 var textLight = textRegular.copyWith(fontWeight: FontWeight.w100);

 var textMedium = textRegular.copyWith(fontWeight: FontWeight.w500);

 var textSemiBold = textRegular.copyWith(fontWeight: FontWeight.w600);

 var textBold = textRegular.copyWith(fontWeight: FontWeight.w700);