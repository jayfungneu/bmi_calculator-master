import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'calc_brain.dart';
import 'results_page.dart';

enum Gender { male, female, unchosen }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.unchosen;
  int userDefinedHeight = 165;
  int userDefinedWeight = 75;
  int userDefinedAge = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.male
                          ? greyCardColor
                          : greyCardColor_inactive,
                      mars_venus_widget(FontAwesomeIcons.mars, "MALE"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.female
                          ? greyCardColor
                          : greyCardColor_inactive,
                      mars_venus_widget(FontAwesomeIcons.venus, "FEMALE"),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              greyCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        userDefinedHeight.toString(),
                        style: thickTextStyle,
                      ),
                      Text(
                        'CM',
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                      value: userDefinedHeight.toDouble(),
                      min: 80.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          userDefinedHeight = newValue.round();
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    greyCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT (KG)',
                          style: labelTextStyle,
                        ),
                        Text(
                          userDefinedWeight.toString(),
                          style: thickTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButtons(FontAwesomeIcons.minus, () {
                              setState(() {
                                userDefinedWeight--;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButtons(FontAwesomeIcons.plus, () {
                              setState(() {
                                userDefinedWeight++;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    greyCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          userDefinedAge.toString(),
                          style: thickTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButtons(FontAwesomeIcons.minus, () {
                              setState(() {
                                userDefinedAge--;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundButtons(FontAwesomeIcons.plus, () {
                              setState(() {
                                userDefinedAge++;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calcResults =
                  CalculatorBrain(userDefinedHeight, userDefinedWeight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    calcResults.calculatedBMI(),
                    calcResults.getResult(),
                    calcResults.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundButtons extends StatelessWidget {
  RoundButtons(@required this.icon, this.onPressed);

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
      elevation: 6.0,
      disabledElevation: 6.0,
    );
  }
}
