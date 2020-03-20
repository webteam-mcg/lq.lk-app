import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'scoreboard/2.dart';
import 'scoreboard/3.dart';
import 'scoreboard/4.dart';
import 'scoreboard/score_screen.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  final List<Widget> tabs = [
    ScoreScreen(),
    ScoreScreenTwo(),
    ScoreScreenThree(),
    ScoreScreenFour()
  ];
  final List<Widget> tabsname = [
    Text('MCG - 1st'),
    Text('RCG - 1st'),
    Text('MCG - 2nd'),
    Text('RCG - 2nd')
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: TabBar(
          tabs: tabsname,
          controller: _tabController,
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: new BubbleTabIndicator(
            indicatorHeight: 30.0,
            indicatorColor: Colors.amber,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
      ),
      body: TabBarView(
        children: tabs,
        controller: _tabController,
      ),
    );
  }
}
