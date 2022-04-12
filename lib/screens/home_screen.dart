import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' show DocumentSnapshot, FirebaseFirestore,QuerySnapshot;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lq_live_app/screens/about_screen.dart';
import 'package:lq_live_app/screens/match_screen.dart';
import 'package:lq_live_app/screens/news_screen.dart';
import 'package:lq_live_app/screens/tab_screen.dart';
import 'package:lq_live_app/settings.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool live = false;
  String url = 'https://www.youtube.com/channel/UCRnbcK82wzCZEQ1mTbKIVng';

  Future<void> launchYoutube(String url) async {

    var collection = FirebaseFirestore.instance.collection('main');
    var docSnapshot = await collection.doc('live').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data();
      var value = data['youtube_link']; // <-- The value you want to retrieve.
      url = value;

      // Call setState if needed.
    }
    print(url);


    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded =
      await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  int _currentIndex = 0;
  final _children = [MatchScreen(), TabScreen(), NewsScreen(), AboutScreen()];


  StreamSubscription<DocumentSnapshot> data;

  final documentReference =
  FirebaseFirestore.instance.collection('main').doc('datastream');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = documentReference.snapshots().listen((dataSnapshot) {
      if (dataSnapshot.exists) {
        setState(() {
          url = dataSnapshot.data()['youtubelink'];
          live = dataSnapshot.data()['liveicon'];
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    data?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchYoutube(url);
        },
        child: Icon(
          Icons.play_arrow,
          size: 35,
          color: Color(0xffffffff),
        ),
        backgroundColor: Color(0xffffaa00),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Provider.of<Settings>(context).isDarkMode
            ? Image.asset(
          'assets/images/lqlklogo.png',
          height: 30,
        )
            : Image.asset(
          'assets/images/lqlklogolight.png',
          height: 30,
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.globe,
                size: 30,
              ),
              label: 'Scoreboard'
              // ignore: deprecated_member_use
              ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.twitter,
                size: 25,
              ),
              label: 'Twitter'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outline,
                size: 30,
              ),
              label: "About"),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
