import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:jsmusicplay/musichome.dart';
// import 'package:jsmusicplay/views/home.dart';
import 'package:jsmusicplay/views/updatehome.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          canvasColor: Colors.transparent,
          errorColor: Colors.transparent,
          fontFamily: "Google Sans"),
      darkTheme: ThemeData.light(),
      home: Home(),
    );
  }
}
