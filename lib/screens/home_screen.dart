import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lq_live_app/screens/about_screen.dart';
import 'package:lq_live_app/screens/match_screen.dart';
import 'package:lq_live_app/screens/news_screen.dart';
import 'package:lq_live_app/screens/tab_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool live = false;
  String url = 'https://www.youtube.com/channel/UCRnbcK82wzCZEQ1mTbKIVng';

  Future<void> launchYoutube(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    MatchScreen(),
    TabScreen(),
    NewsScreen(),
    AboutScreen()
  ];

  StreamSubscription<DocumentSnapshot> data;

  final documentReference =
      Firestore.instance.collection('main').document('datastream');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = documentReference.snapshots().listen((dataSnapshot) {
      if (dataSnapshot.exists) {
        setState(() {
          url = dataSnapshot.data['youtubelink'];
          live = dataSnapshot.data['liveicon'];
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
            size: 30,
            color: Color(0xffffffff),
          ),
          backgroundColor: Color(0xffffaa00),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Image(
            image: AssetImage('assets/images/lqlklogo.png'),
            height: 30,
          ),
          actions: <Widget>[
            live == true ? Icon(Icons.score) : SizedBox.shrink()
          ],
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
//              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Color(0xffffaa00)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped, // new
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage('assets/icons/Home - Dark.png'),
                    height: 30,
                    width: 30,
                  ),
                  title: SizedBox.shrink(),
                  activeIcon: Image(
                    image: AssetImage('assets/icons/Home - Active.png'),
                    height: 30,
                    width: 30,
                  )),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage('assets/icons/List - Dark.png'),
                    height: 30,
                    width: 30,
                  ),
                  title: SizedBox.shrink(),
                  activeIcon: Image(
                    image: AssetImage('assets/icons/List - Active.png'),
                    height: 30,
                    width: 30,
                  )),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage('assets/icons/Twitter - Dark.png'),
                    height: 30,
                    width: 30,
                  ),
                  title: SizedBox.shrink(),
                  activeIcon: Image(
                    image: AssetImage('assets/icons/Twitter - Active.png'),
                    height: 30,
                    width: 30,
                  )),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage('assets/icons/Info - Dark.png'),
                    height: 30,
                    width: 30,
                  ),
                  title: SizedBox.shrink(),
                  activeIcon: Image(
                    image: AssetImage('assets/icons/Info - Active.png'),
                    height: 30,
                    width: 30,
                  )),
            ],
          ),
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
