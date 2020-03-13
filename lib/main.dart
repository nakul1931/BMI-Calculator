import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeColor = Color(0xE6111328);
const inActiveColor = Color(0xFF0A0E21);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
          primaryColor: Color(0xFF0A0E21),
          accentColor: Colors.white,
          scaffoldBackgroundColor: Color(0xFF3A2E40),
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleCardColor = inActiveColor;
  Color femaleCardColor = inActiveColor;

  void tapp(int i) {
    print("Check");
    if (i == 1) {
      if (maleCardColor == inActiveColor) {
        print("object");
        maleCardColor = activeColor;
        femaleCardColor = inActiveColor;
      } else {
        femaleCardColor = inActiveColor;
      }
    }
    if (i == 2) {
      if (femaleCardColor == inActiveColor) {
        femaleCardColor = activeColor;
        maleCardColor = inActiveColor;
      } else {
        maleCardColor = inActiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BMI Calculator")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: newCard(
                        onPress: () {
                          setState(() {
                            tapp(1);
                          });
                        },
                        newColour: maleCardColor,
                        childWidget: cardData(
                          childIcon: FontAwesomeIcons.mars,
                          label: "MALE",
                        )),
                    // ),
                  ),
                  Expanded(
                    // child: GestureDetector(

                    child: newCard(
                      onPress: () {
                        setState(() {
                          tapp(2);
                        });
                      },
                      newColour: femaleCardColor,
                      childWidget: cardData(
                          childIcon: FontAwesomeIcons.venus, label: "FEMALE"),
                    ),
                    // ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: newCard(
                childWidget: Column(
                  children: <Widget>[
                    Text(),
                    
                  ],
                ),
                newColour: activeColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: newCard(
                      newColour: activeColor,
                    ),
                  ),
                  Expanded(
                      child: newCard(
                    newColour: activeColor,
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.pink[800],
              width: double.infinity,
              height: 60.0,
            ) //Container
          ],
        ),
      ),
    );
  }
}

class newCard extends StatelessWidget {
  newCard({this.childWidget, this.newColour, this.onPress});
  final Widget childWidget;
  final Color newColour;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // alignment: MainAxisAlignment.center,
        child: childWidget,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: newColour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class cardData extends StatelessWidget {
  cardData({this.childIcon, this.label});

  final IconData childIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          childIcon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$label",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
