import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';
import '../components/round_icons_button.dart';
import '../components/constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderEnum {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //Color maleCardColor = inactiveReusableCardColor;
  //Color femaleCardColor = inactiveReusableCardColor;
  //bool maleCardActive = false;
  //bool femaleCardActive = false;

  GenderEnum selectedGender;
  int height = 180;
  int weight = 70;
  int age = 20;

//onTap: () {
//
//});
//},

//  void updateColor(GenderEnum genderEnum) {
//    //male
//    if (genderEnum == GenderEnum.male) {
//      if (maleCardColor == inactiveReusableCardColor) {
//        maleCardColor = activeReusableCardColor;
//        femaleCardColor = inactiveReusableCardColor;
//      } else {
//        maleCardColor = inactiveReusableCardColor;
//      }
//    }
//    //female
//    if (genderEnum == GenderEnum.female) {
//      if (femaleCardColor == inactiveReusableCardColor) {
//        femaleCardColor = activeReusableCardColor;
//        maleCardColor = inactiveReusableCardColor;
//      } else {
//        femaleCardColor = inactiveReusableCardColor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == GenderEnum.male
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: IconContent(
                      theIconData: FontAwesomeIcons.mars,
                      theTextString: 'MALE',
                    ),
                    gestureDetector: () {
                      setState(() {
                        selectedGender = GenderEnum.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == GenderEnum.female
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: IconContent(
                      theIconData: FontAwesomeIcons.venus,
                      theTextString: 'FEMALE',
                    ),
                    gestureDetector: () {
                      setState(() {
                        selectedGender = GenderEnum.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTheStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kTheStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEA1556),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayColor: Color(0x29EA1556),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTheStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconsButton(
                              icon: FontAwesomeIcons.minus,
                              theOnPressed: () {
                                setState(() {
                                  if (weight <= 0) {
                                    weight = 0;
                                  } else {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconsButton(
                              icon: FontAwesomeIcons.plus,
                              theOnPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kActiveReusableCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kTheStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconsButton(
                              icon: FontAwesomeIcons.minus,
                              theOnPressed: () {
                                setState(() {
                                  if (age <= 0) {
                                    age = 0;
                                  } else {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconsButton(
                              icon: FontAwesomeIcons.plus,
                              theOnPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
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
          BottomButton(
            text: 'CALCULATE YOUR BMI',
            onTap: () {
              CalculatorBrain cBrain =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: cBrain.calculateBMI(),
                    resultText: cBrain.getResult(),
                    interpretaation: cBrain.getInterpretation(),
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
