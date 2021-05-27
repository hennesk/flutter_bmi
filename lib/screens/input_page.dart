import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/calculate_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';

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
  int userWeight = 70;
  int userAge = 35;

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
                        SliderTheme(
                          // activeTrackColor: kSliderActiveColor,
                          // inactiveTrackColor: kSliderInactiveColor,
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15,
                            ),
                            thumbColor: kSliderActiveColor,
                            overlayColor: kSliderOverlayColor,
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kSliderInactiveColor,
                          ),
                          child: Slider(
                            min: 120,
                            value: userHeight.toDouble(),
                            max: 220,
                            onChanged: (height) {
                              setState(() {
                                userHeight = height.toInt();
                              });
                            },
                          ),
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
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: kLabelStyle),
                            Text('k/lb'),
                          ],
                        ),
                        Text(userWeight.toString(), style: kChunkyLabelStyle),
                        Text((userWeight * 2.205).round().toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  userWeight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  userWeight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: kLabelStyle),
                          ],
                        ),
                        Text(userAge.toString(), style: kChunkyLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  userAge--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  userAge++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            label: 'CALCULATE',
            onTap: () {
              BMIBrain calc = BMIBrain(
                height: userHeight,
                weight: userWeight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: calc.calculateBMI(),
                    result: calc.getResultString(),
                    advice: calc.interpret(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
