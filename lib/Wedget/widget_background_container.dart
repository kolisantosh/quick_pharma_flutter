
import 'package:flutter/cupertino.dart';

/*class WidgetBackgroundContainer extends GetView {
  Widget child;
  Color backColor;
  double cornerRadius;
  VoidCallback? onClickAction;
  EdgeInsets? paddingContainer;
  EdgeInsets? marginContainer;
  bool isNeedToRemoveFocus;

  WidgetBackgroundContainer(
      {Key? key,
      required this.child,
      required this.backColor,
      required this.cornerRadius,
      this.paddingContainer,
      this.marginContainer,
      this.onClickAction,
      this.isNeedToRemoveFocus = true});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        padding: paddingContainer ?? EdgeInsets.all(0.0),
        margin: marginContainer ?? EdgeInsets.all(0.0),
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
        child: child,
      ),
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onClickAction != null) {
          onClickAction!();
        }
      },
    );
  }
}*/

class WidgetBackgroundContainer extends StatefulWidget {
  Widget child;
  Color backColor;
  double cornerRadius;
  VoidCallback? onClickAction;
  EdgeInsets? paddingContainer;
  EdgeInsets? marginContainer;
  bool isNeedToRemoveFocus;

  WidgetBackgroundContainer(
      {Key? key,
      required this.child,
      required this.backColor,
      required this.cornerRadius,
      this.paddingContainer,
      this.marginContainer,
      this.onClickAction,
      this.isNeedToRemoveFocus = true})
      : super(key: key);

  @override
  State<WidgetBackgroundContainer> createState() =>
      _WidgetBackgroundContainerState();
}

class _WidgetBackgroundContainerState extends State<WidgetBackgroundContainer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          padding: widget.paddingContainer,
          margin: widget.marginContainer,
          decoration: BoxDecoration(
              color: widget.backColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.cornerRadius))),
          child: widget.child,
        ),
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (widget.onClickAction != null) {
            widget.onClickAction!();
          }
        },
      ),
    );
  }
}
