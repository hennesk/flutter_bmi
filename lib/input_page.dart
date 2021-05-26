import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xffeb1555);
const activeCardColor = Color(0xff1d1e33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    color: activeCardColor,
                    child: SexIcon(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                    child: BmiCard(
                        color: activeCardColor,
                        child: SexIcon(
                          genderIcon: FontAwesomeIcons.venus,
                          genderText: 'FEMALE',
                        ))),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: BmiCard(color: activeCardColor)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: BmiCard(color: activeCardColor)),
                Expanded(child: BmiCard(color: activeCardColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SexIcon extends StatelessWidget {
  SexIcon({@required this.genderIcon, @required this.genderText});
  final IconData genderIcon;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(height: 15),
        Text(
          genderText,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff8d8e98),
          ),
        ),
      ],
    );
  }
}

class BmiCard extends StatelessWidget {
  BmiCard({@required this.color, this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
