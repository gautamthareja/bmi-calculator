import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  BottomButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: kBottomContainerColor,
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        height: kBottomButtonHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: kBottomButtonStyle,
          ),
        ),
      ),
    );
  }
}
