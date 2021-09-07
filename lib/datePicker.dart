import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'main.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) => Center(
        child: buildDatePicker(),
      );

  Widget buildDatePicker() => SizedBox(
        height: 140,
        width: double.infinity,
        child: CupertinoTheme(
          data: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              dateTimePickerTextStyle: TextStyle(
                letterSpacing: 2,
                color: kActiveCardColour,
                fontSize: 20,
              ),
            ),
          ),
          child: CupertinoDatePicker(
            backgroundColor: Colors.transparent,
            minimumYear: 1960,
            maximumYear: DateTime.now().year,
            initialDateTime: dateTime,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) => setState(() {
              this.dateTime = dateTime;
              dt = dateTime;
            }),
          ),
        ),
      );
}
