
import 'package:quick_pharma/util/ColorConstants.dart';

import '../util/app_size.dart';
import 'package:flutter/material.dart';

import '../util/styles.dart';

class SubMenuHoverWidget extends StatefulWidget {
  String menuTitle;
  bool isSelected;
  VoidCallback? onClick;

  SubMenuHoverWidget(
      {Key? key,
      required this.menuTitle,
      required this.isSelected,
      this.onClick})
      : super(key: key);

  @override
  State<SubMenuHoverWidget> createState() => _SubMenuHoverWidgetState();
}

class _SubMenuHoverWidgetState extends State<SubMenuHoverWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (hover) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (hover) {
        setState(() {
          isHover = false;
        });
      },
      opaque: true,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(size_15),
        child: Text(widget.menuTitle,
            style: widget.isSelected
                ? textBold
                    .copyWith(fontSize: font_14, color: ColorConstants.appColor)
                : textRegular.copyWith(
                    fontSize: font_14,
                    color: isHover ? ColorConstants.gray50 : ColorConstants.black)),
      ),
    );
  }
}
