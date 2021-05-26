import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.child, this.onTap});

  final Function onTap;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(kCardMargins),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kCardBorderRadius),
        ),
      ),
    );
  }
}
