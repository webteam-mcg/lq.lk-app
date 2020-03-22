import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DataBat {
  String name;
  String r;
  String m;
  String fours;
  String sixes;
  String rs;

  DataBat({this.name, this.r, this.m, this.fours, this.sixes, this.rs});
}

class DataBall {
  String name;
  String overs;
  String m;
  String r;
  String w;
  String econ;

  DataBall({this.name, this.overs, this.m, this.r, this.w, this.econ});
}

var bats = <DataBat>[
  DataBat(
      name: 'Rusiru Anupama', r: '1', m: '2', fours: '3', sixes: '4', rs: '5'),
];
var balls = <DataBall>[
  DataBall(
      name: 'Rusiru Anupama', overs: '13.0', m: '3', r: '31', w: '3', econ: '2.72')
];


class RcgFirst extends StatefulWidget {
  @override
  _RcgFirstState createState() => _RcgFirstState();
}

class _RcgFirstState extends State<RcgFirst> {
  bool showfirstrcg = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffffaa00),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xffe0e3e5),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10.0),
          child: AnimationConfiguration.synchronized(
            child: SlideAnimation(
                child: FadeInAnimation(
                    child: Container(
                        width: MediaQuery.of(context).size.height,
                        child: showfirstrcg == true
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 14.7, bottom: 11.7),
                                    child:
                                        Text("Richmond College - 1st Innings",
                                            style: TextStyle(
                                              color: Color(0xff444b54),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            )),
                                  ),
                                  Container(
                                      width:
                                      MediaQuery.of(context).size.width - 60,
                                      height: 3,
                                      decoration: new BoxDecoration(
                                          color: Color(0xffe0e3e5))),
                                  DataTable(
                                      columnSpacing: 10.0,
                                      columns: [
                                        DataColumn(label: Text('Batting')),
                                        DataColumn(label: Text('R')),
                                        DataColumn(label: Text('M')),
                                        DataColumn(label: Text('4s')),
                                        DataColumn(label: Text('6s')),
                                        DataColumn(label: Text('R/S')),
                                      ],
                                      rows: bats
                                          .map((bat) => DataRow(cells: [
                                                DataCell(Text(bat.name)),
                                                DataCell(Text(bat.r)),
                                                DataCell(Text(bat.m)),
                                                DataCell(Text(bat.fours)),
                                                DataCell(Text(bat.sixes)),
                                                DataCell(Text(bat.rs)),
                                              ]))
                                          .toList()),
                                  Container(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      height: 0.5,
                                      decoration: new BoxDecoration(
                                          color: Color(0xffe0e3e5))),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Extras',
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                        Text('6   (B 4,LB 2)',
                                            style: TextStyle(fontSize: 15.0))
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      height: 1,
                                      decoration: new BoxDecoration(
                                          color: Color(0xffe0e3e5))),
                                  Container(
                                    child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('Total Runs',
                                              style: TextStyle(fontSize: 15.0)),
                                          Text('191(10 wkts, 59.3 ov)',
                                              style: TextStyle(fontSize: 15.0))
                                        ]),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      height: 1,
                                      decoration: new BoxDecoration(
                                          color: Color(0xffe0e3e5))),
                                  DataTable(
                                      columnSpacing: 10.0,
                                      columns: [
                                        DataColumn(label: Text('Balling')),
                                        DataColumn(label: Text('O')),
                                        DataColumn(label: Text('M')),
                                        DataColumn(label: Text('R')),
                                        DataColumn(label: Text('W')),
                                        DataColumn(label: Text('Econ')),
                                      ],
                                      rows: balls.map((ball) => DataRow(cells: [
                                        DataCell(Text(ball.name)),
                                        DataCell(Text(ball.overs)),
                                        DataCell(Text(ball.m)),
                                        DataCell(Text(ball.r)),
                                        DataCell(Text(ball.w)),
                                        DataCell(Text(ball.econ)),
                                      ])).toList())
                                ],
                              )
                            : SizedBox.shrink(),
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x26000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ],
                        ))),
                verticalOffset: MediaQuery.of(context).size.height),
            duration: const Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
