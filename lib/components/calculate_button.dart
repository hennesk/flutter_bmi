import 'package:flutter/material.dart';

import '../constants.dart';

class CalculateButton extends StatelessWidget {
  final Function onTap;
  final String label;
  CalculateButton({this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          label,
          style: kLargeButtonStyle,
        )),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
