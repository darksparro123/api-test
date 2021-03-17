import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = "https://randomuser.me/api/";
  Future<String> getRequest() async {
    var response = await http.get(
      Uri.decodeFull(url),
      headers: {
        "Accept": "application/json",
      },
    );
    var extractData = jsonDecode(response.body);

    print(extractData["results"][0]["name"]["first"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
        ),
      ),
      body: Center(
          child: RaisedButton(
        onPressed: getRequest,
        child: Text("Send Request"),
      )),
    );
  }
}
