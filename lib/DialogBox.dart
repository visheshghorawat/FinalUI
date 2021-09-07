import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_challenge/constants.dart';
import 'main.dart';

showAlertDialog(BuildContext context) {
  Widget okButton = Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: kActiveCardColour),
      child: TextButton(
        child: Text(
          "Confirm",
          style: TextStyle(
              color: kInactiveCardColour, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ));

  AlertDialog alert = AlertDialog(
    contentTextStyle: GoogleFonts.roboto(),
    elevation: 20,
    title: Text(
      "My Information....",
    ),
    titleTextStyle: kTitleTextStyle,
    content: Column(
      children: [
        Text(
          'Date of birth: ${dt.day} - ${dt.month} - ${dt.year}',
          style: GoogleFonts.roboto(color: Colors.black, fontSize: 18),
        ),
        Text('Height: $ht',
            style: GoogleFonts.roboto(color: Colors.black, fontSize: 18)),
        Text('Weight: $wt',
            style: GoogleFonts.roboto(color: Colors.black, fontSize: 18)),
      ],
    ),
    actions: [
      Center(child: okButton),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
