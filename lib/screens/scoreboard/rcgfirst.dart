import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentSnapshot, FirebaseFirestore, QuerySnapshot;
import 'package:flutter/material.dart'
    show
        Alignment,
        BouncingScrollPhysics,
        BoxDecoration,
        BoxFit,
        BuildContext,
        Color,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        DataCell,
        DataColumn,
        DataRow,
        DataTable,
        EdgeInsets,
        FontStyle,
        FontWeight,
        MainAxisAlignment,
        MediaQuery,
        Row,
        Scaffold,
        SingleChildScrollView,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;
import 'package:flutter/cupertino.dart'
    show Alignment, BouncingScrollPhysics, BoxDecoration, BoxFit, BuildContext, Color, Column, Container, CrossAxisAlignment, EdgeInsets, FontStyle, FontWeight, MainAxisAlignment, MediaQuery, Row, SingleChildScrollView, SizedBox, State, StatefulWidget, Text, TextStyle, Widget;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lq_live_app/models/functions_model.dart';
import 'package:lq_live_app/settings.dart';
import 'package:lq_live_app/themes.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:flare_flutter/flare_actor.dart';

class RcgFirst extends StatefulWidget {
  @override
  _RcgFirstState createState() => _RcgFirstState();
}

class _RcgFirstState extends State<RcgFirst> {
  bool showRcgFirstTable = false;
  List battingTable;
  List bowlingTable;
  Map rcgInningDetailsData;
  var battingTableData;
  int balls;
  int score;
  int wickets;
  int b;
  int lb;
  int nb;
  int total;
  String over;
  bool showRcgFirst = false;
  StreamSubscription<QuerySnapshot> forFirstInningRcgBat;
  StreamSubscription<QuerySnapshot> forFirstInningRcgBall;
  StreamSubscription<QuerySnapshot> forInningDetails;
  StreamSubscription<DocumentSnapshot> dataStream;

  final inningDetails = FirebaseFirestore.instance
      .collection('innings')
      .where("team", isEqualTo: 'rcg')
      .where('inning', isEqualTo: 1)
      .snapshots();
  final firstInningRcgBat = FirebaseFirestore.instance
      .collection('batting')
      .where("team", isEqualTo: "rcg")
      .where("inning", isEqualTo: 1)
      .snapshots();
  final firstInningRcgBall = FirebaseFirestore.instance
      .collection('bowling')
      .where("team", isEqualTo: "rcg")
      .where("inning", isEqualTo: 1)
      .snapshots();
/*  final documentReference =
      FirebaseFirestore.instance.collection('main').doc('datastream');*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forFirstInningRcgBat = firstInningRcgBat.listen((querySnapshot) {
      setState(() {
        battingTable = querySnapshot.docs;
      });
    });
    forFirstInningRcgBall = firstInningRcgBall.listen((querySnapshot) {
      setState(() {
        bowlingTable = querySnapshot.docs;
      });
    });
    forInningDetails = inningDetails.listen((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty == true) {
       // setState(() {
          // battingTableData = querySnapshot.docs.first;
       // });
        /*if (battingTableData.exists) {
          setState(() {
            showRcgFirst = querySnapshot.docs.isNotEmpty;
            rcgInningDetailsData = battingTableData.data()['extra'];
            balls = battingTableData.data()['balls'];
            score = battingTableData.data()['score'];
            wickets = battingTableData.data()['wickets'];
            b = rcgInningDetailsData['b'];
            lb = rcgInningDetailsData['lb'];
            nb = rcgInningDetailsData['nb'];
            total = rcgInningDetailsData['total'];
            over = overs(balls);
          });
        }
        */
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    forFirstInningRcgBat?.cancel();
    forFirstInningRcgBall?.cancel();
    forInningDetails?.cancel();
    dataStream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10.0),
        child: AnimationConfiguration.synchronized(
          child: SlideAnimation(
              child: FadeInAnimation(
                  child: showRcgFirst == true
                      ? Container(
                          width: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.only(top: 14.7, bottom: 11.7),
                                child: Text("Richmond College - 1st Innings",
                                    style: TextStyle(
                                      color: Color(0xff444b54),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width - 60,
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
                                  rows: battingTable
                                      .map((bat) => DataRow(cells: [
                                            DataCell(Text(bat['name'])),
                                            DataCell(
                                                Text(bat['score'].toString())),
                                            DataCell(
                                                Text(bat['balls'].toString())),
                                            DataCell(
                                                Text(bat['4s'].toString())),
                                            DataCell(
                                                Text(bat['6s'].toString())),
                                            DataCell(Text(batStrike(
                                                bat['score'], bat['balls']))),
                                          ]))
                                      .toList()),
                              Container(
                                  width: MediaQuery.of(context).size.width - 60,
                                  height: 0.5,
                                  decoration: new BoxDecoration(
                                      color: Color(0xffe0e3e5))),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Extras',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    Text('$total   (B $b,LB $lb,NB $nb)',
                                        style: TextStyle(fontSize: 15.0))
                                  ],
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 45.0, vertical: 10.0),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width - 60,
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
                                      Text('$score($wickets wkts, $over ov)',
                                          style: TextStyle(fontSize: 15.0))
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 45.0, vertical: 10.0),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width - 60,
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
                                  rows: bowlingTable
                                      .map((ball) => DataRow(cells: [
                                            DataCell(Text(ball['name'])),
                                            DataCell(
                                                Text(overs(ball['balls']))),
                                            DataCell(Text(
                                                ball['maiden'].toString())),
                                            DataCell(
                                                Text(ball['score'].toString())),
                                            DataCell(Text(
                                                ball['wickets'].toString())),
                                            DataCell(Text(econ(
                                                ball['score'], ball['balls']))),
                                          ]))
                                      .toList())
                            ],
                          ),
                          decoration: Provider.of<Settings>(context).isDarkMode
                              ? setBlackCard
                              : setWhiteCard,
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height - 250,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: FlareActor("assets/images/RCG_Ball.flr",
                                    alignment: Alignment.center,
                                    fit: BoxFit.fitHeight,
                                    animation: "Untitled"),
                                height: 350,
                              ),SizedBox(height: 20,),
                              Text('Yet To Be Bat',
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Provider.of<Settings>(context)
                                            .isDarkMode
                                        ? Color(0xffffffff)
                                        : Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  )),SizedBox(height: 50,),
                              Text(
                                  'Tips - Use Dark Mode Toggle to switch into Dark Mode',
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Provider.of<Settings>(context)
                                            .isDarkMode
                                        ? Color(0xffffffff)
                                        : Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                          decoration: Provider.of<Settings>(context).isDarkMode
                              ? setBlackCard
                              : setWhiteCard,
                        )),
              verticalOffset: MediaQuery.of(context).size.height),
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
