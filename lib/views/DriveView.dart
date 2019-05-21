import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:drivebuy/views/components/ShowDrive.dart';
import 'package:drivebuy/services/DriveService.dart';

class DriveView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new DriveViewState();
  }
}

class DriveViewState extends State<DriveView> {

  var _isLoading = true;
  var driveJson;

  _fetchData() async {

    final driveService = new DriveService();

    final response = await driveService.getDrive("001");

    if(response.statusCode == 200) {

      final responseBody = json.decode(response.body);

      setState(() {
        _isLoading = false;

        this.driveJson = responseBody;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return new MaterialApp (
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("DriveBuy"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  _fetchData();
                })
          ],
        ),
        body: new Center(
          child: _isLoading ? new CircularProgressIndicator() :
            new ShowDrive(driveJson)
        ),
      )
    );
  }
}