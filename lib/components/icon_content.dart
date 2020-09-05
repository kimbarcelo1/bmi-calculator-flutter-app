import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
//  const IconContent({
//    Key key,
//  }) : super(key: key);

  final IconData theIconData;
  final String theTextString;

  IconContent({this.theIconData, this.theTextString});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          theIconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          theTextString,
          style: kTheStyle,
        ),
      ],
    );
  }
}
