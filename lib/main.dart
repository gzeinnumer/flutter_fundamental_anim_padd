import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color = Colors.red;
  double paddiings = 5.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Padding"),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  MyFlexible2(
                    paddiings: paddiings,
                    color: Colors.red,
                    onTap: () {
                      setState(() {
                        if(paddiings == 5.0){
                          paddiings = 20.0;
                        } else{
                          paddiings = 5.0;
                        }
                      });
                    },
                  ),
                  MyFlexible(paddiings: paddiings, color: Colors.blue),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  MyFlexible(paddiings: paddiings, color: Colors.amber),
                  MyFlexible(paddiings: paddiings, color: Colors.purpleAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFlexible extends StatelessWidget {
  const MyFlexible({
    Key key,
    @required this.paddiings,
    @required this.color,
  }) : super(key: key);

  final double paddiings;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: AnimatedPadding(
        duration: Duration(seconds: 1),
        padding: EdgeInsets.all(paddiings),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}

class MyFlexible2 extends StatelessWidget {
  const MyFlexible2({
    Key key,
    @required this.paddiings,
    @required this.color,
    @required this.onTap,
  }) : super(key: key);

  final double paddiings;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: AnimatedPadding(
        duration: Duration(seconds: 1),
        padding: EdgeInsets.all(paddiings),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: color,
          ),
        ),
      ),
    );
  }
}
