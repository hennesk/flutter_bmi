import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  RoundIconButton({@required this.onPressed, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
