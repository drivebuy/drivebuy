import 'package:http/http.dart' as http;
import 'dart:io';

class DriveService {

  getDrive(String pid) async {
    final url = "http://localhost:9000/api/drives/$pid";

    Map<String, String> headers = {
      "Content-type": "application/json",
      HttpHeaders.authorizationHeader: "893d2b09-919f-4b45-a1a3-84595d1e88d8"
    };

    return http.get(
      url,
      headers: headers,
    );
  }
}