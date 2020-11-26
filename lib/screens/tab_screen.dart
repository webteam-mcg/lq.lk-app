import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lq_live_app/settings.dart';
import 'package:provider/provider.dart';

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
  final tabs = [McgFirst(), RcgFirst(), McgSecond(), RcgSecond()];
  final tabsName = [
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
          unselectedLabelColor: Provider.of<Settings>(context).isDarkMode
              ? Colors.white
              : Colors.black,
          labelColor: Provider.of<Settings>(context).isDarkMode
              ? Colors.black
              : Colors.white,
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
