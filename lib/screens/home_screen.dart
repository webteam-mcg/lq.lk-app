import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lq_live_app/screens/about_screen.dart';
import 'package:lq_live_app/screens/match_screen.dart';
import 'package:lq_live_app/screens/news_screen.dart';
import 'package:lq_live_app/screens/score_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url;
  int _currentIndex = 0;
  final List<Widget> _children = [
    MatchScreen(),
    ScoreScreen(),
    NewsScreen(),
    AboutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
                image: AssetImage('assets/images/bitmap.png'),
                height: 30,
              ),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Color(0xffffaa00)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped, // new
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage('assets/icons/score.png'),
                    height: 30,
                    width: 30,
                  ),
                  title: SizedBox.shrink(),
                  activeIcon: Image(
                    image: AssetImage('assets/icons/score-active.png'),
                    height: 30,
                    width: 30,
                  )),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage('assets/icons/board.png'),
                    height: 30,
                    width: 30,
                  ),
                  title: SizedBox.shrink(),
                  activeIcon: Image(
                    image: AssetImage('assets/icons/board-active.png'),
                    height: 30,
                    width: 30,
                  )),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage('assets/icons/news.png'),
                    height: 30,
                    width: 30,
                  ),
                  title: SizedBox.shrink(),
                  activeIcon: Image(
                    image: AssetImage('assets/icons/news.png'),
                    height: 30,
                    width: 30,
                  )),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage('assets/icons/info.png'),
                    height: 30,
                    width: 30,
                  ),
                  title: SizedBox.shrink(),
                  activeIcon: Image(
                    image: AssetImage('assets/icons/info-active.png'),
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
