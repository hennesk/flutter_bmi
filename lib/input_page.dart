import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Gender selected;
  int userHeight = 165;

  void tap(Gender gender) {
    setState(() {
      if (gender == Gender.male) {
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
      } else {
        femaleCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selected = Gender.male;
                      });
                    },
                    color: selected == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selected = Gender.female;
                      });
                    },
                    color: selected == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: kLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              userHeight.toString(),
                              style: kChunkyLabelStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelStyle,
                            ),
                            SizedBox(width: 40),
                            Text(
                              ((userHeight ~/ 2.54) ~/ 12).toString() +
                                  '\'' +
                                  ((userHeight ~/ 2.54) % 12).toString() +
                                  '"',
                              style: kChunkyLabelStyle,
                            ),
                            Text(
                              'in',
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                        Slider(
                          min: 130,
                          value: userHeight.toDouble(),
                          max: 200,
                          onChanged: (height) {
                            setState(() {
                              userHeight = height.toInt();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(color: kActiveCardColor)),
                Expanded(child: ReusableCard(color: kActiveCardColor)),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
