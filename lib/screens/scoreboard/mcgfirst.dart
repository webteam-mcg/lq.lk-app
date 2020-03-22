import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DataBat {
  String name;
  int runs;
  int balls;
  int fours;
  int sixes;
  double rs;

  DataBat({this.name, this.runs, this.balls, this.fours, this.sixes, this.rs});
}

class DataBall {
  String name;
  int balls;
  int m;
  int r;
  int w;
  String econ;

  DataBall({this.name, this.balls, this.m, this.r, this.w, this.econ});
}

var bats = <DataBat>[
  DataBat(
      name: 'Rusiru Anupama', runs: 1, balls: 2, fours: 3, sixes: 4, rs: 5),
];
var balls = <DataBall>[
  DataBall(
      name: 'Rusiru Anupama', balls: 13, m: 3, r: 31, w: 3, econ: '2.72')
];

class McgFirst extends StatefulWidget {
  @override
  _McgFirstState createState() => _McgFirstState();
}

class _McgFirstState extends State<McgFirst> {
  bool showfirstmcg = true;

  @override
  Widget build(BuildContext context) {

    batstrike(int batsmanruns,int ballcount) {
       double batstriked = (batsmanruns*100/ballcount);
       double batstikened = double.parse((batstriked).toStringAsFixed(2));
       return batstikened.toString();
    }

    econ(int bowlerruns,int balls) {
      double over = (balls.toDouble()~/6+balls.toDouble()%6.toDouble()/10.0);
      double econ = (bowlerruns/over);
      double econed = double.parse((econ).toStringAsFixed(2));
      return econed.toString();
    }

    overs(int balls) {
      double over = (balls.toDouble()~/6+balls.toDouble()%6.toDouble()/10.0);
      double overs = double.parse((over).toStringAsFixed(2));
      return overs.toString();
    }
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
                      child: showfirstmcg == true
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 14.7, bottom: 11.7),
                                  child: Text("Mahinda College - 1st Innings",
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
                                      DataColumn(label: Text('Batsman')),
                                      DataColumn(label: Text('R')),
                                      DataColumn(label: Text('B')),
                                      DataColumn(label: Text('4s')),
                                      DataColumn(label: Text('6s')),
                                      DataColumn(label: Text('R/S')),
                                    ],
                                    rows: bats
                                        .map((bat) => DataRow(cells: [
                                              DataCell(Text(bat.name)),
                                              DataCell(Text(bat.runs.toString())),
                                              DataCell(Text(bat.balls.toString())),
                                              DataCell(Text(bat.fours.toString())),
                                              DataCell(Text(bat.sixes.toString())),
                                              DataCell(Text(batstrike(bat.runs, bat.balls))),
                                            ]))
                                        .toList()),
                                Container(
                                    width: MediaQuery.of(context).size.width - 60,
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
                                          DataCell(Text(overs(ball.balls))),
                                          DataCell(Text(ball.m.toString())),
                                          DataCell(Text(ball.r.toString())),
                                          DataCell(Text(ball.w.toString())),
                                          DataCell(Text(econ(ball.r, ball.balls))),
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
              verticalOffset: MediaQuery.of(context).size.height,
            ),
            duration: const Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
