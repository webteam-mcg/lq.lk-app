import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lq_live_app/models/functions_model.dart';

import 'package:lq_live_app/settings.dart';
import 'package:lq_live_app/themes.dart';
import 'package:provider/provider.dart';

class McgFirst extends StatefulWidget {
  @override
  _McgFirstState createState() => _McgFirstState();
}

class _McgFirstState extends State<McgFirst> {
  List battingTable;
  List bowlingTable;
  Map mcgInningDetailsData;
  var battingTableData;
  int balls;
  int score;
  int wickets;
  int b;
  int lb;
  int nb;
  int total;
  String over;
  bool showMcgFirst = false;
  StreamSubscription<QuerySnapshot> forFirstInningMcgBat;
  StreamSubscription<QuerySnapshot> forFirstInningMcgBall;
  StreamSubscription<QuerySnapshot> forInningDetails;
  StreamSubscription<DocumentSnapshot> dataStream;

  final inningDetails = Firestore.instance
      .collection('innings')
      .where("team", isEqualTo: 'mcg')
      .where('inning', isEqualTo: 1)
      .snapshots();
  final firstInningMcgBat = Firestore.instance
      .collection('batting')
      .where("team", isEqualTo: "mcg")
      .where("inning", isEqualTo: 1)
      .snapshots();
  final firstInningMcgBall = Firestore.instance
      .collection('bowling')
      .where("team", isEqualTo: "mcg")
      .where("inning", isEqualTo: 1)
      .snapshots();
  final documentReference =
      Firestore.instance.collection('main').document('datastream');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forFirstInningMcgBat = firstInningMcgBat.listen((querySnapshot) {
      setState(() {
        battingTable = querySnapshot.documents;
      });
    });
    forFirstInningMcgBall = firstInningMcgBall.listen((querySnapshot) {
      setState(() {
        bowlingTable = querySnapshot.documents;
      });
    });
    dataStream = documentReference.snapshots().listen((dataSnapshot) {
      setState(() {
        showMcgFirst = dataSnapshot.data['showfirstmcg'];
      });
    });
    forInningDetails = inningDetails.listen((querySnapshot) {
      if (querySnapshot != null) {
        setState(() {
          battingTableData = querySnapshot.documents.first;
        });
        if (battingTableData.exists) {
          setState(() {
            mcgInningDetailsData = battingTableData.data['extra'];
            balls = battingTableData.data['balls'];
            score = battingTableData.data['score'];
            wickets = battingTableData.data['wickets'];
            b = mcgInningDetailsData['b'];
            lb = mcgInningDetailsData['lb'];
            nb = mcgInningDetailsData['nb'];
            total = mcgInningDetailsData['total'];
            over = overs(balls);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    forFirstInningMcgBat?.cancel();
    forFirstInningMcgBall?.cancel();
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
              child: showMcgFirst == true
                  ? Container(
                      width: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 14.7, bottom: 11.7),
                            child: Text("Mahinda College - 1st Innings",
                                style: TextStyle(
                                  color: Provider.of<Settings>(context).isDarkMode ? Color(0xffffffff) : Color(0xff444b54),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width - 60,
                              height: 3,
                              decoration:
                                  new BoxDecoration(color: Color(0xffe0e3e5))),
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
                                        DataCell(Text(bat['score'].toString())),
                                        DataCell(Text(bat['balls'].toString())),
                                        DataCell(Text(bat['4s'].toString())),
                                        DataCell(Text(bat['6s'].toString())),
                                        DataCell(Text(batStrike(
                                            bat['score'], bat['balls']))),
                                      ]))
                                  .toList()),
                          Container(
                              width: MediaQuery.of(context).size.width - 60,
                              height: 0.5,
                              decoration:
                                  new BoxDecoration(color: Color(0xffe0e3e5))),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              decoration:
                                  new BoxDecoration(color: Color(0xffe0e3e5))),
                          Container(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              decoration:
                                  new BoxDecoration(color: Color(0xffe0e3e5))),
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
                                        DataCell(Text(overs(ball['balls']))),
                                        DataCell(
                                            Text(ball['maiden'].toString())),
                                        DataCell(
                                            Text(ball['score'].toString())),
                                        DataCell(
                                            Text(ball['wickets'].toString())),
                                        DataCell(Text(econ(
                                            ball['score'], ball['balls']))),
                                      ]))
                                  .toList())
                        ],
                      ),
                      decoration: Provider.of<Settings>(context).isDarkMode ? setBlackCard : setWhiteCard,)
                  : Container(
                      height: MediaQuery.of(context).size.height - 220,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[Text('data')],
                      ),
                      decoration:Provider.of<Settings>(context).isDarkMode ? setBlackCard : setWhiteCard,),
            ),
            verticalOffset: MediaQuery.of(context).size.height,
          ),
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
