
import 'package:flutter/material.dart';

import '../util/app_size.dart';

class BackgroundWidget extends StatefulWidget {
  Widget childWidget;
  EdgeInsets padding;
  bool? isSelected;
  Color selectedBGColor;
  Color unselectedBGColor;

  BackgroundWidget(
      {Key? key,
      required this.childWidget,
      required this.padding,
      this.isSelected,
      required this.selectedBGColor,
      required this.unselectedBGColor})
      : super(key: key);

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
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
      child: Container(
        padding: widget.padding,
        child:  widget.childWidget,
        decoration: BoxDecoration(
          color:  isHover ? widget.selectedBGColor :  widget.unselectedBGColor,
          borderRadius: BorderRadius.circular(size_5),
        ),
      ),
    );
  }
}

/*class BackgroundWidget extends GetView {
  Widget childWidget;
  EdgeInsets padding;
  bool? isSelected;
  Color selectedBGColor;
  Color unselectedBGColor;

  BackgroundWidget(
      {required this.childWidget,
      required this.padding,
      this.isSelected,
      required this.selectedBGColor,
      required this.unselectedBGColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MouseRegion(
      onEnter: (hover) {
        print("IsHover : $hover");
      },
      onExit: (hover) {
        print("IsHoverExit : $hover");
      },
      child: Container(
        padding: padding,
        child: childWidget,
        decoration: BoxDecoration(
          color: selectedBGColor,
          borderRadius: BorderRadius.circular(size_5),
        ),
      ),
    );
  }
}*/
