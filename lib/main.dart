//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lq_live_app/screens/home_screen.dart';
import 'package:lq_live_app/settings.dart';
import 'package:lq_live_app/themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Here we are asynchronously passing an instance of SharedPreferences
    /// to our Settings ChangeNotifier class and that in turn helps us
    /// determine the basic app settings to be applied whenever the app is
    /// launched.
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<Settings>.value(
          value: Settings(snapshot.data),
          child: MyApp(),
        );
      },
    );
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  String _message = '';
//
//  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    getMessage();
//  }
//
//  void getMessage() {
//    _firebaseMessaging.configure(
//        onMessage: (Map<String, dynamic> message) async {
//      print('on message $message');
//      setState(() => _message = message["notification"]["title"]);
//    }, onResume: (Map<String, dynamic> message) async {
//      print('on resume $message');
//      setState(() => _message = message["notification"]["title"]);
//    }, onLaunch: (Map<String, dynamic> message) async {
//      print('on launch $message');
//      setState(() => _message = message["notification"]["title"]);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lq.lk',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<Settings>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: HomeScreen(),
    );
  }
}
