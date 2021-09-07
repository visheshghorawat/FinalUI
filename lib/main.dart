import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_challenge/constants.dart';
import 'datePicker.dart';
import 'DialogBox.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About ME',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

DateTime dt = DateTime.now();
int wt = 50;
int ht = 160;

int minWT = 20;
int maxWT = 120;
int step = 1;

enum Height {
  feet,
  cm,
}

enum Weight {
  pound,
  kg,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'About Me',
          style: kTitleTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {},
          color: kActiveCardColour,
          iconSize: 18,
        ),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'DOB',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
              DatePickerPage(),
              _HeightSlider(),
              _WeightSlider(),
              Icon(
                Icons.arrow_drop_up_sharp,
                color: Color(0XFFFF5A5A),
                size: 75,
              ),
            ]),
            Container(
              margin: EdgeInsets.all(15),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kActiveCardColour),
              child: TextButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                child: Text('CONFIRM',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ]),
    );
  }
}

class _HeightSlider extends StatefulWidget {
  const _HeightSlider({Key? key}) : super(key: key);

  @override
  __HeightSliderState createState() => __HeightSliderState();
}

class __HeightSliderState extends State<_HeightSlider> {
  Height selectedHeight = Height.cm;
  int _currentHorizontalIntValue = 150;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Height',
              style: kTitleTextStyle,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                height: 35,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedHeight == Height.feet
                        ? kActiveCardColour
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: selectedHeight == Height.feet
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedHeight = Height.feet;
                      });
                    },
                    style: TextButton.styleFrom(
                      primary: selectedHeight == Height.feet
                          ? kActiveCardColour
                          : kInactiveCardColour,
                    ),
                    child: Text('Feet',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: selectedHeight == Height.feet
                              ? kInactiveCardColour
                              : kActiveCardColour,
                        )),
                  ),
                ),
              ),
              Container(
                height: 35,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedHeight == Height.cm
                        ? kActiveCardColour
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: selectedHeight == Height.cm
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedHeight = Height.cm;
                      });
                    },
                    style: TextButton.styleFrom(
                      primary: selectedHeight == Height.cm
                          ? kActiveCardColour
                          : kInactiveCardColour,
                    ),
                    child: Text('CM',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: selectedHeight == Height.cm
                              ? kInactiveCardColour
                              : kActiveCardColour,
                        )),
                  ),
                ),
              ),
            ])
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              tick1,
              tick1,
              tick1,
              tick1,
              tick2,
              tick1,
              tick1,
              tick1,
              tick1,
              tick3,
              tick1,
              tick1,
              tick1,
              tick1,
              tick2,
              tick1,
              tick1,
              tick1,
              tick1
            ],
          ),
        ),
        NumberPicker(
            value: _currentHorizontalIntValue,
            minValue: 120,
            maxValue: 220,
            step: 1,
            itemCount: 3,
            itemWidth: 100,
            itemHeight: 75,
            textStyle: TextStyle(fontSize: 15, color: Colors.grey),
            axis: Axis.horizontal,
            onChanged: (value) {
              setState(() {
                _currentHorizontalIntValue = value;
                ht = value;
              });
            }),
      ],
    );
  }
}

class _WeightSlider extends StatefulWidget {
  @override
  __WeightSliderState createState() => __WeightSliderState();
}

class __WeightSliderState extends State<_WeightSlider> {
  Weight selectedWeight = Weight.kg;
  int _currentValue = 75;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Weight',
              style: kTitleTextStyle,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                height: 35,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedWeight == Weight.pound
                        ? kActiveCardColour
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: selectedWeight == Weight.pound
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedWeight = Weight.pound;
                        _currentValue = 144;
                        minWT = 60;
                        maxWT = 260;
                        step = 2;
                      });
                    },
                    style: TextButton.styleFrom(
                      primary: selectedWeight == Weight.pound
                          ? kActiveCardColour
                          : kInactiveCardColour,
                    ),
                    child: Text('Pound',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: selectedWeight == Weight.pound
                              ? kInactiveCardColour
                              : kActiveCardColour,
                        )),
                  ),
                ),
              ),
              Container(
                height: 35,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedWeight == Weight.kg
                        ? kActiveCardColour
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: selectedWeight == Weight.kg
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedWeight = Weight.kg;
                        _currentValue = 60;
                        minWT = 20;
                        maxWT = 120;
                        step = 1;
                      });
                    },
                    style: TextButton.styleFrom(
                      primary: selectedWeight == Weight.kg
                          ? kActiveCardColour
                          : kInactiveCardColour,
                    ),
                    child: Text('KG',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: selectedWeight == Weight.kg
                              ? kInactiveCardColour
                              : kActiveCardColour,
                        )),
                  ),
                ),
              ),
            ])
          ],
        ),
        NumberPicker(
            value: _currentValue,
            minValue: minWT,
            maxValue: maxWT,
            step: step,
            itemCount: 5,
            itemWidth: 75,
            itemHeight: 45,
            textStyle: TextStyle(fontSize: 15, color: Colors.grey),
            axis: Axis.horizontal,
            onChanged: (value) {
              setState(() {
                _currentValue = value;
                wt = value;
              });
            }),
      ],
    );
  }
}
