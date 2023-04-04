import 'package:flutter/cupertino.dart';
import 'package:quick_pharma/util/ColorConstants.dart';

class CustomeButton extends StatefulWidget {
  Widget? child;
  Function? onPress;
  int? colors;
  CustomeButton({this.child,this.colors,this.onPress});
  @override
  State<CustomeButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: widget.child,
        decoration: BoxDecoration(
          color:widget.colors==null?ColorConstants.appColor:Color(int.parse(widget.colors.toString())) ,
          borderRadius: BorderRadius.all(Radius.circular(100))
        ),
      ),
      onTap: (){
        widget.onPress!();
      },
    );
  }
}
