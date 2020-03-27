import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lq_live_app/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _message = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      setState(() => _message = message["notification"]["title"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lq.lk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          platform: TargetPlatform.iOS,
          fontFamily: 'ProductSans',
          brightness: Brightness.light,
          primaryColor: Color(0xffffaa00),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xffe0e3e5),
          canvasColor: Colors.white),
      home: HomeScreen(),
    );
  }
}
