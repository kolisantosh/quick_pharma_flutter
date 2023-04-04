
import 'package:quick_pharma/util/ColorConstants.dart';

import '../util/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../util/styles.dart';

class WidgetCommonTextField extends GetView {
  TextEditingController textEditingController;
  TextStyle textStyle;
  TextInputType inputType;
  TextInputAction inputAction;
  bool isObscureText;
  bool isPasswordFiled;
  EdgeInsets? paddingContainer;
  Widget? prefixWidget;
  Widget? postfixWidget;
  bool? isEditable;
  int? textLimit;
  Function? onTextChanged;
  Function? onActionClick;
  String? hintText;

  WidgetCommonTextField(
      {Key? key,
      required this.textEditingController,
      required this.textStyle,
      required this.inputType,
      required this.inputAction,
      this.isObscureText = false,
      this.isPasswordFiled = false,
      this.paddingContainer,
      this.prefixWidget,
      this.postfixWidget,
      this.isEditable = true,
      this.textLimit,
      this.onTextChanged,
      this.onActionClick,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingContainer ??
          EdgeInsets.symmetric(vertical: size_15, horizontal: size_20),
      decoration: BoxDecoration(
          // color: ColorConstants.gray50,
        borderRadius: BorderRadius.circular(size_80),
          border: Border.all(color: ColorConstants.gray200,)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefixWidget == null ? Container() : prefixWidget!,
          SizedBox(
            width: prefixWidget != null ? 22.0 : 0.0,
          ),
          Expanded(
              child: TextFormField(
            controller: textEditingController,
            textAlign: TextAlign.left,
            enabled: isEditable,
            maxLines: inputAction == TextInputAction.newline ? 4 : 1,
            minLines: 1,
            maxLength: textLimit == null ? TextField.noMaxLength : textLimit,
            decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                isDense: true,
                counterText: "",
                counter: null,
                contentPadding: EdgeInsets.all(size_0),
                hintStyle: textMedium.copyWith(color: ColorConstants.gray50)),
            style: textStyle,
            keyboardType: inputType,
            obscureText: isObscureText,
            enableInteractiveSelection: !isPasswordFiled,
            textInputAction: inputAction,
            textCapitalization:
                inputType == TextInputType.emailAddress || isPasswordFiled
                    ? TextCapitalization.none
                    : TextCapitalization.sentences,
            /*inputFormatters: inputType == TextInputType.number
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ]
                : inputType == TextInputType.text && !isPasswordFiled
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                      ]
                    : <TextInputFormatter>[],*/
            onChanged: (value) {
              if (onTextChanged != null) {
                onTextChanged!();
              }
            },
            onFieldSubmitted: (value) {
              if (onActionClick != null) {
                onActionClick!();
              }
            },
          )),
          SizedBox(
            width: postfixWidget != null ? 22.0 : 0.0,
          ),
          postfixWidget == null ? Container() : postfixWidget!,
        ],
      ),
    );
  }
}
