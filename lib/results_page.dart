import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final String category;
  final String bmi;
  final String comment;

  ResultsPage(
      {@required this.comment, @required this.category, @required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              'Your Result',
              style: kResultTitle,
            ),
          ),
//          Divider(
//            color: Color(0x00A00277BD),
//            thickness: 4,
//            indent: 110,
//            endIndent: 110,
//          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    category.toUpperCase(),
                    style: kCategoryStyle,
                  ),
                  Text(
                    bmi,
                    style: kFinalResultStyle,
                  ),
                  Text(
                    comment,
                    textAlign: TextAlign.center,
                    style: kCommentStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
