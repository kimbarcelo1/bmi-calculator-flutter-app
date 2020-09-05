import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // not moving
  //  const ReusableCard({
  //    Key key,
  //  }) : super(key: key);

  //para required palagi at hindi maging null yung color
  ReusableCard({@required this.color, this.cardChild, this.gestureDetector});

  //final makes the variable color immutable, meaning we can set the color, but cannot change it again
  //mutable means changeable and otherwise
  //only set once, and cannot be changed
  final Color color;
  final Widget cardChild;
  final Function gestureDetector;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureDetector,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
