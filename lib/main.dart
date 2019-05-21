import 'package:flutter/material.dart';
import 'package:drivebuy/views/DriveView.dart';

void main() => runApp(DriveBuyApp());

class DriveBuyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new DriveBuyState();
  }
}

class DriveBuyState extends State<DriveBuyApp> {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp (
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("DriveBuy"),
        ),
        body: Builder(
          builder: (context) => new Center(
            child: RaisedButton(
              child: Text('Get Drive'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriveView()),
                );
              },
            ),
          ),
        )
      )
    );
  }
}