import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Data {
  String name;
  String r;
  String m;
  String fours;
  String sixes;
  String rs;

  Data({this.name, this.r, this.m, this.fours, this.sixes, this.rs});
}

var mcg1 = <Data>[
  Data(name: 'Rusiru Anupama', r: '1', m: '2', fours: '3', sixes: '4', rs: '5'),
];
var rcg1 = <Data>[
  Data(name: 'Rusiru Anupama', r: '1', m: '2', fours: '3', sixes: '4', rs: '5'),
  Data(name: 'Rusiru Anupama', r: '1', m: '2', fours: '3', sixes: '4', rs: '5'),
];
var mcg2 = <Data>[
  Data(name: 'Rusiru Anupama', r: '1', m: '2', fours: '3', sixes: '4', rs: '5'),
];
var rcg2 = <Data>[
  Data(name: 'Rusiru Anupama', r: '1', m: '2', fours: '3', sixes: '4', rs: '5'),
];

class ScoreScreenFour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScoreScreenStateFour();
  }
}

class _ScoreScreenStateFour extends State<ScoreScreenFour> {
  bool showfirstmahinda = true;
  bool showsecondmahinda = true;
  bool showfirstrichmond = true;
  bool showsecondrichmond = true;

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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 14.7, bottom: 11.7),
                                    child: Text("Scoreboard",
                                        style: TextStyle(
                                          color: Color(0xff444b54),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  ),
                                  new Container(
                                      width: 1000,
                                      height: 3,
                                      decoration: new BoxDecoration(
                                          color: Color(0xffe0e3e5))),
                                  showfirstmahinda == true
                                      ? Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 14.7, bottom: 11.7),
                                              child: Text(
                                                  "Mahinda College - 1st Innings",
                                                  style: TextStyle(
                                                    color: Color(0xff444b54),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                            ),
                                            DataTable(
                                                columnSpacing: 10.0,
                                                columns: [
                                                  DataColumn(
                                                      label: Text('Batsman')),
                                                  DataColumn(label: Text('R')),
                                                  DataColumn(label: Text('M')),
                                                  DataColumn(label: Text('4s')),
                                                  DataColumn(label: Text('6s')),
                                                  DataColumn(
                                                      label: Text('R/S')),
                                                ],
                                                rows: mcg1
                                                    .map((mcg1s) =>
                                                        DataRow(cells: [
                                                          DataCell(
                                                              Text(mcg1s.name)),
                                                          DataCell(
                                                              Text(mcg1s.r)),
                                                          DataCell(
                                                              Text(mcg1s.m)),
                                                          DataCell(Text(
                                                              mcg1s.fours)),
                                                          DataCell(Text(
                                                              mcg1s.sixes)),
                                                          DataCell(
                                                              Text(mcg1s.rs)),
                                                        ]))
                                                    .toList()),
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                  showfirstrichmond == true
                                      ? Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 14.7, bottom: 11.7),
                                              child: Text(
                                                  "Richmond College - 1st Innings",
                                                  style: TextStyle(
                                                    color: Color(0xff444b54),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                            ),
                                            DataTable(
                                                columnSpacing: 10.0,
                                                columns: [
                                                  DataColumn(
                                                      label: Text('Batsman')),
                                                  DataColumn(label: Text('R')),
                                                  DataColumn(label: Text('M')),
                                                  DataColumn(label: Text('4s')),
                                                  DataColumn(label: Text('6s')),
                                                  DataColumn(
                                                      label: Text('R/S')),
                                                ],
                                                rows: rcg1
                                                    .map((rcg1s) =>
                                                        DataRow(cells: [
                                                          DataCell(
                                                              Text(rcg1s.name)),
                                                          DataCell(
                                                              Text(rcg1s.r)),
                                                          DataCell(
                                                              Text(rcg1s.m)),
                                                          DataCell(Text(
                                                              rcg1s.fours)),
                                                          DataCell(Text(
                                                              rcg1s.sixes)),
                                                          DataCell(
                                                              Text(rcg1s.rs)),
                                                        ]))
                                                    .toList()),
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                  showsecondmahinda == true
                                      ? Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 14.7, bottom: 11.7),
                                              child: Text(
                                                  "Mahinda College - 2nd Innings",
                                                  style: TextStyle(
                                                    color: Color(0xff444b54),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                            ),
                                            DataTable(
                                                columnSpacing: 10.0,
                                                columns: [
                                                  DataColumn(
                                                      label: Text('Batsman')),
                                                  DataColumn(label: Text('R')),
                                                  DataColumn(label: Text('M')),
                                                  DataColumn(label: Text('4s')),
                                                  DataColumn(label: Text('6s')),
                                                  DataColumn(
                                                      label: Text('R/S')),
                                                ],
                                                rows: mcg2
                                                    .map((mcg2s) =>
                                                        DataRow(cells: [
                                                          DataCell(
                                                              Text(mcg2s.name)),
                                                          DataCell(
                                                              Text(mcg2s.r)),
                                                          DataCell(
                                                              Text(mcg2s.m)),
                                                          DataCell(Text(
                                                              mcg2s.fours)),
                                                          DataCell(Text(
                                                              mcg2s.sixes)),
                                                          DataCell(
                                                              Text(mcg2s.rs)),
                                                        ]))
                                                    .toList()),
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                  showsecondrichmond == true
                                      ? Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 14.7, bottom: 11.7),
                                              child: Text(
                                                  "Richmond College - 2nd Innings",
                                                  style: TextStyle(
                                                    color: Color(0xff444b54),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                            ),
                                            DataTable(
                                                columnSpacing: 10.0,
                                                columns: [
                                                  DataColumn(
                                                      label: Text('Batsman')),
                                                  DataColumn(label: Text('R')),
                                                  DataColumn(label: Text('M')),
                                                  DataColumn(label: Text('4s')),
                                                  DataColumn(label: Text('6s')),
                                                  DataColumn(
                                                      label: Text('R/S')),
                                                ],
                                                rows: rcg2
                                                    .map((rcg2s) =>
                                                        DataRow(cells: [
                                                          DataCell(
                                                              Text(rcg2s.name)),
                                                          DataCell(
                                                              Text(rcg2s.r)),
                                                          DataCell(
                                                              Text(rcg2s.m)),
                                                          DataCell(Text(
                                                              rcg2s.fours)),
                                                          DataCell(Text(
                                                              rcg2s.sixes)),
                                                          DataCell(
                                                              Text(rcg2s.rs)),
                                                        ]))
                                                    .toList()),
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                  SizedBox(
                                    height: 20,
                                    width: 10,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x26000000),
                                      offset: Offset(0, 0),
                                      blurRadius: 75,
                                      spreadRadius: 0)
                                ],
                              ))),
                      verticalOffset: MediaQuery.of(context).size.height),
                  duration: const Duration(seconds: 1)))),
    );
  }
}
