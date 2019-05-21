import 'package:flutter/material.dart';
import 'package:drivebuy/models/Drive.dart';

class ShowDrive extends StatelessWidget {

  final driveJson;

  ShowDrive(this.driveJson);

  @override
  Widget build(BuildContext context) {

    final Drive drive = Drive.fromJson(driveJson);

    return new Column(
      children: <Widget>[
        new Container(
            padding: new EdgeInsets.all(16.00),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(height: 8.0),
                  new Text(
                      drive.pid,
                      style: new TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold
                      )
                  ),
                  new Text(
                      drive.address.firstLine,
                      style: new TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold
                      )
                  ),
                  new Text(
                      drive.address.postcode,
                      style: new TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold
                      )
                  ),
                  new Text(
                      drive.price.toString(),
                      style: new TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold
                      )
                  ),
                  new Text(
                      drive.status,
                      style: new TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold
                      )
                  ),
                ]
            )
        ),
        new Divider()
      ],
    );
  }
}
