import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import './views/DriveView.dart';

void main() => runApp(DriveBuyApp());

class DriveBuyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new DriveBuyState();
  }
}

class DriveBuyState extends State<DriveBuyApp> {

  var _isLoading = true;
  var driveJson;

  _fetchData() async {

    final url = "http://localhost:9000/api/drives/0001";

    Map<String, String> headers = {
      "Content-type": "application/json",
      HttpHeaders.authorizationHeader: "893d2b09-919f-4b45-a1a3-84595d1e88d8"
    };

    final response = await http.get(
        url,
        headers: headers,
    );

    print("Fetch data status: ${response.body} with code: ${response.statusCode}");

    if(response.statusCode == 200) {

      print("Response 200");

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
            new DriveView(driveJson)
        ),
      )
    );
  }
}