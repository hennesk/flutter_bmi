import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.iconData, @required this.label});
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: kIconSize,
        ),
        SizedBox(height: kIconTextSpacing),
        Text(
          label,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
