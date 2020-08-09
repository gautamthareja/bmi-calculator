import 'package:bmi_calculator/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_card_top.dart';
import 'constants.dart';
import 'reusable_card_bottom_2.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _weight = 50;
  int _age = 20;
  int _height = 150;
  Gender selectedGender;

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
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: ReusableCardDataTop(
                        iconData: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: ReusableCardDataTop(
                        iconData: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          '$_height',
                          style: kMajorTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kActiveTrackColor,
                        inactiveTrackColor: kInactiveTrackColor,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: kEnabledThumbRadius,
                        ),
                      ),
                      child: Slider(
                        value: _height.toDouble(),
                        min: kMinSliderValue,
                        max: kMaxSliderValue,
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: ReusableCardDataBottom2(
                        textData: 'WEIGHT',
                        intData: _weight,
                        onPressedDecrease: () {
                          setState(() {
                            _weight--;
                          });
                        },
                        onPressedIncrease: () {
                          setState(() {
                            _weight++;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: ReusableCardDataBottom2(
                        textData: 'AGE',
                        intData: _age,
                        onPressedDecrease: () {
                          setState(() {
                            _age--;
                          });
                        },
                        onPressedIncrease: () {
                          setState(() {
                            _age++;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              text: 'CALCULATE',
              onPressed: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: _height, weight: _weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmi: calc.bmiValue(),
                      comment: calc.bmiComment(),
                      category: calc.bmiCategory(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
