import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.text, this.onTap});
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      color: kBottomContainerColor,
      width: double.infinity,
      height: kBottomContainerHeight,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: kLargeTextStyle,
          ),
        ),
      ),
    );
  }
}
