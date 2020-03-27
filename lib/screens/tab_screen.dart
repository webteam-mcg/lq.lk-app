import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'scoreboard/mcgfirst.dart';
import 'scoreboard/mcgsecond.dart';
import 'scoreboard/rcgfirst.dart';
import 'scoreboard/rcgsecond.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  final List<Widget> tabs = [McgFirst(), RcgFirst(), McgSecond(), RcgSecond()];
  final List<Widget> tabsName = [
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
          tabs: tabsName,
          controller: _tabController,
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: new BubbleTabIndicator(
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
