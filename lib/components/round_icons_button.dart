import 'package:flutter/material.dart';

class RoundIconsButton extends StatelessWidget {
  RoundIconsButton({
    @required this.icon,
    @required this.theOnPressed,
  });

  final IconData icon;
  final Function theOnPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: theOnPressed,
      child: Icon(icon),
      fillColor: Color(0xFF212747),
      shape: CircleBorder(),
      constraints: const BoxConstraints(minWidth: 55.0, minHeight: 55.0),
      elevation: 6.0,
    );
  }
}
