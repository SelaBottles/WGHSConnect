import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wghsconnect/resources/repository.dart';
import 'package:wghsconnect/ui/home_screen.dart';
import 'package:wghsconnect/ui/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WGHSConnect',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primarySwatch: Colors.green,
            primaryColor: Colors.black,
            primaryIconTheme: IconThemeData(color: Colors.black),
            primaryTextTheme: TextTheme(
                title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
            textTheme: TextTheme(title: TextStyle(color: Colors.black))),
        home: FutureBuilder(
          future: _repository.getCurrentUser(),
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
            if (snapshot.hasData) {
              return InstaHomeScreen();
            } else {
              return LoginScreen();
            }
          },
        ));
  }
}
