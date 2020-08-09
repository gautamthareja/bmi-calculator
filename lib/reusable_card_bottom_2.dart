import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'round_icon_button.dart';

class ReusableCardDataBottom2 extends StatelessWidget {
  final String textData;
  final int intData;
  final Function onPressedDecrease;
  final Function onPressedIncrease;

  ReusableCardDataBottom2({
    @required this.textData,
    @required this.intData,
    this.onPressedDecrease,
    this.onPressedIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          textData,
          style: kLabelTextStyle,
        ),
        Text(
          '$intData',
          style: kMajorTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onPressedDecrease,
            ),
            SizedBox(
              width: 20,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onPressedIncrease,
            ),
          ],
        )
      ],
    );
  }
}
