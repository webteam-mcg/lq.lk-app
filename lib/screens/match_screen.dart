import 'dart:async' show StreamSubscription;

import 'package:cloud_firestore/cloud_firestore.dart' show DocumentSnapshot, FirebaseFirestore, QuerySnapshot;
import 'package:flutter/material.dart' show AssetImage, BouncingScrollPhysics, BoxDecoration, BuildContext, Center, Chip, Color, Colors, Column, Container, CrossAxisAlignment, EdgeInsets, FontStyle, FontWeight, Image, MainAxisAlignment, MainAxisSize, MediaQuery, Row, Scaffold, SingleChildScrollView, SizedBox, State, StatefulWidget, Text, TextStyle, Widget;
import 'package:flutter/rendering.dart' show AssetImage, BoxDecoration, Color, CrossAxisAlignment, EdgeInsets, FontStyle, FontWeight, MainAxisAlignment, MainAxisSize, TextStyle;
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lq_live_app/models/functions_model.dart';
import 'package:lq_live_app/settings.dart';
import 'package:lq_live_app/themes.dart';
import 'package:provider/provider.dart';

class MatchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MatchScreenState();
  }
}

class _MatchScreenState extends State<MatchScreen> {
  String emptyString = '';
  Map thisOver;
  int day = 1;
  int score = 0;
  int wicket = 0;
  int ball = 0;
  String college = 'MAHINDA COLLEGE';
  String specialMsg = '';
  Map player1;
  Map player2;
  Map bowler;
  String player1name = 'TBD';
  int player1score = 0;
  int player1balls = 0;
  String player2name = 'TBD';
  int player2score = 0;
  int player2balls = 0;
  String bowlerName = 'TBD';
  int bowlerScore = 0;
  int bowlerBalls = 0;
  int bowlerWickets = 0;
  int inning = 1;
  int mcgScoreFirstInning = 0;
  List thisSplit = [];

  int mcgFirstScore = 0;
  int mcgFirstWickets = 0;
  int mcgFirstBalls = 0;
  int rcgFirstScore = 0;
  int rcgFirstWickets = 0;
  int rcgFirstBalls = 0;
  int mcgSecondScore = 0;
  int mcgSecondWickets = 0;
  int mcgSecondBalls = 0;
  int rcgSecondScore = 0;
  int rcgSecondWickets = 0;
  int rcgSecondBalls = 0;

  StreamSubscription<DocumentSnapshot> subscription;

  StreamSubscription<QuerySnapshot> forFirstInningMcg;
  StreamSubscription<QuerySnapshot> forSecondInningMcg;
  StreamSubscription<QuerySnapshot> forFirstInningRcg;
  StreamSubscription<QuerySnapshot> forSecondInningRcg;

  final documentReference =
      FirebaseFirestore.instance.collection("main").doc("live");
  final firstInningMcg = FirebaseFirestore.instance
      .collection('innings')
      .where("team", isEqualTo: "mcg")
      .where("inning", isEqualTo: 1);
  final secondInningMcg = FirebaseFirestore.instance
      .collection('innings')
      .where("team", isEqualTo: "mcg")
      .where("inning", isEqualTo: 2);
  final firstInningRcg = FirebaseFirestore.instance
      .collection('innings')
      .where("team", isEqualTo: "rcg")
      .where("inning", isEqualTo: 1);
  final secondInningRcg = FirebaseFirestore.instance
      .collection('innings')
      .where("team", isEqualTo: "rcg")
      .where("inning", isEqualTo: 2);

  var firstInningMcgData;
  var secondInningMcgData;
  var firstInningRcgData;
  var secondInningRcgData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = documentReference.snapshots().listen((dataSnapshot) {
      if (dataSnapshot.exists) {
        setState(() {
          day = dataSnapshot.data()['day'];
          ball = dataSnapshot.data()['balls'];
          score = dataSnapshot.data()['score'];
          wicket = dataSnapshot.data()['wickets'];
          specialMsg = dataSnapshot.data()['message'];
          college = dataSnapshot.data()['team'];
          player1 = dataSnapshot.data()['player1'];
          player2 = dataSnapshot.data()['player2'];
          bowler = dataSnapshot.data()['bowler'];
          player1name = player1['name'];
          player1score = player1['score'];
          player1balls = player1['balls'];
          player2name = player2['name'];
          player2score = player2['score'];
          player2balls = player2['balls'];
          bowlerName = bowler['name'];
          bowlerScore = bowler['score'];
          bowlerBalls = bowler['balls'];
          bowlerWickets = bowler['wickets'];
          thisOver = dataSnapshot.data()['thisOver'];
          thisSplit = thisOver.values.toList();
          inning = dataSnapshot.data()['inning'];
        });
      }
    });
    forFirstInningMcg = firstInningMcg.snapshots().listen((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty == true) {
        setState(() {
          firstInningMcgData = querySnapshot.docs.first;
        });
        if (firstInningMcgData.exists) {
          setState(() {
            mcgFirstScore = firstInningMcgData.data()['score'];
            mcgFirstBalls = firstInningMcgData.data()['balls'];
            mcgFirstWickets = firstInningMcgData.data()['wickets'];
          });
        }
      }
    });

    forSecondInningMcg = secondInningMcg.snapshots().listen((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty == true) {
        setState(() {
          secondInningMcgData = querySnapshot.docs.first;
        });
        if (secondInningMcgData.exists) {
          setState(() {
            mcgSecondScore = secondInningMcgData.data()['score'];
            mcgSecondBalls = secondInningMcgData.data()['balls'];
            mcgSecondWickets = secondInningMcgData.data()['wickets'];
          });
        }
      }
    });
    forFirstInningRcg = firstInningRcg.snapshots().listen((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty == true) {
        setState(() {
          firstInningRcgData = querySnapshot.docs.first;
        });
        if (firstInningRcgData.exists) {
          setState(() {
            rcgFirstScore = firstInningRcgData.data()['score'];
            rcgFirstBalls = firstInningRcgData.data()['balls'];
            rcgFirstWickets = firstInningRcgData.data()['wickets'];
          });
        }
      }
    });
    forSecondInningRcg = secondInningRcg.snapshots().listen((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty == true) {
        setState(() {
          secondInningRcgData = querySnapshot.docs.first;
        });
        if (secondInningRcgData.exists) {
          setState(() {
            rcgSecondScore = secondInningRcgData.data()['score'];
            rcgSecondBalls = secondInningRcgData.data()['balls'];
            rcgSecondWickets = secondInningRcgData.data()['wickets'];
          });
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription?.cancel();
    forFirstInningMcg?.cancel();
    forSecondInningMcg?.cancel();
    forFirstInningRcg?.cancel();
    forSecondInningRcg?.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: AnimationConfiguration.synchronized(
                child: SlideAnimation(
                    child: Container(
                        child: Column(children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          college == 'mcg'
                              ? Text('MAHINDA COLLEGE',
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
//                                          color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ))
                              : Text('RICHMOND COLLEGE',
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
//                                      color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                          Text('$score/$wicket',
                              style: TextStyle(
                                fontFamily: 'ProductSans',
//                                      color: Colors.black,
                                fontSize: 80,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                          Text('(' + overs(ball) + ' OVERS)',
                              style: TextStyle(
                                fontFamily: 'ProductSans',
//                                      color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                      width: 11,
                                    ),
                                    Image(
                                      image: Provider.of<Settings>(context)
                                              .isDarkMode
                                          ? AssetImage(
                                              'assets/images/MCG(Gold).png')
                                          : AssetImage('assets/images/MCG.png'),
                                      height: 70.0,
                                    ),
                                    SizedBox(
                                      height: 5,
                                      width: 5,
                                    ),
                                    Text('MCG',
                                        style: TextStyle(
                                          fontFamily: 'ProductSans',
                                          color: Provider.of<Settings>(context)
                                                  .isDarkMode
                                              ? Color(0xffffffff)
                                              : Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                  '$mcgFirstScore/$mcgFirstWickets',
                                                  style: TextStyle(
                                                    fontFamily: 'ProductSans',
                                                    color:
                                                        Provider.of<Settings>(
                                                                    context)
                                                                .isDarkMode
                                                            ? Color(0xffffffff)
                                                            : Colors.black,
                                                    fontSize: 16.7,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                              Text(
                                                  '(' +
                                                      overs(mcgFirstBalls) +
                                                      ')',
                                                  style: TextStyle(
                                                    fontFamily: 'ProductSans',
                                                    color:
                                                        Provider.of<Settings>(
                                                                    context)
                                                                .isDarkMode
                                                            ? Color(0xffffffff)
                                                            : Colors.grey,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 17.0,
                                          ),
                                          Text("1st",
                                              style: TextStyle(
                                                fontFamily: 'ProductSans',
                                                color: Provider.of<Settings>(
                                                            context)
                                                        .isDarkMode
                                                    ? Color(0xffffffff)
                                                    : Colors.grey,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                              )),
                                          SizedBox(
                                            width: 17.0,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                  '$rcgFirstScore/$rcgFirstWickets',
                                                  style: TextStyle(
                                                    fontFamily: 'ProductSans',
                                                    color:
                                                        Provider.of<Settings>(
                                                                    context)
                                                                .isDarkMode
                                                            ? Color(0xffffffff)
                                                            : Colors.black,
                                                    fontSize: 16.7,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                              Text(
                                                  '(' +
                                                      overs(rcgFirstBalls) +
                                                      ')',
                                                  style: TextStyle(
                                                    fontFamily: 'ProductSans',
                                                    color:
                                                        Provider.of<Settings>(
                                                                    context)
                                                                .isDarkMode
                                                            ? Color(0xffffffff)
                                                            : Colors.grey,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      inning == 2
                                          ? Row(
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                        '$mcgSecondScore/$mcgSecondWickets',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'ProductSans',
                                                          color: Provider.of<
                                                                          Settings>(
                                                                      context)
                                                                  .isDarkMode
                                                              ? Color(
                                                                  0xffffffff)
                                                              : Colors.black,
                                                          fontSize: 16.7,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        )),
                                                    Text(
                                                        '(' +
                                                            overs(
                                                                mcgSecondBalls) +
                                                            ')',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'ProductSans',
                                                          color: Provider.of<
                                                                          Settings>(
                                                                      context)
                                                                  .isDarkMode
                                                              ? Color(
                                                                  0xffffffff)
                                                              : Colors.grey,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 38.0,
                                                ),
                                                Text("2nd",
                                                    style: TextStyle(
                                                      fontFamily: 'ProductSans',
                                                      color: Provider.of<
                                                                      Settings>(
                                                                  context)
                                                              .isDarkMode
                                                          ? Color(0xffffffff)
                                                          : Colors.grey,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    )),
                                                SizedBox(
                                                  width: 38.0,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                        '$rcgSecondScore/$rcgSecondWickets',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'ProductSans',
                                                          color: Provider.of<
                                                                          Settings>(
                                                                      context)
                                                                  .isDarkMode
                                                              ? Color(
                                                                  0xffffffff)
                                                              : Colors.black,
                                                          fontSize: 16.7,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        )),
                                                    Text(
                                                        '(' +
                                                            overs(
                                                                rcgSecondBalls) +
                                                            ')',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'ProductSans',
                                                          color: Provider.of<
                                                                          Settings>(
                                                                      context)
                                                                  .isDarkMode
                                                              ? Color(
                                                                  0xffffffff)
                                                              : Colors.grey,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : SizedBox.shrink()
                                    ]),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                      width: 11,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(),
                                      child: Image(
                                        image:
                                            AssetImage('assets/images/RCG.png'),
                                        height: 70.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                      width: 5,
                                    ),
                                    Text('RCG',
                                        style: TextStyle(
                                          fontFamily: 'ProductSans',
                                          color: Provider.of<Settings>(context)
                                                  .isDarkMode
                                              ? Color(0xffffffff)
                                              : Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("118th Lovers' Quarrel",
                                    style: TextStyle(
                                      fontFamily: 'ProductSans',
                                      color: Provider.of<Settings>(context)
                                              .isDarkMode
                                          ? Color(0xffffffff)
                                          : Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                                Text('Day $day',
                                    style: TextStyle(
                                      fontFamily: 'ProductSans',
                                      color: Provider.of<Settings>(context)
                                              .isDarkMode
                                          ? Color(0xffffffff)
                                          : Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                                // ignore: unrelated_type_equality_checks
                                specialMsg != emptyString
                                    ? Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(specialMsg,
                                              style: TextStyle(
                                                fontFamily: 'ProductSans',
                                                color: Provider.of<Settings>(
                                                            context)
                                                        .isDarkMode
                                                    ? Color(0xffffffff)
                                                    : Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                              )),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: Provider.of<Settings>(context).isDarkMode
                            ? setBlackCard
                            : setWhiteCard,
                        height: MediaQuery.of(context).size.height / 4+35,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: MediaQuery.of(context).size.height / 7+10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Text('This over',
                                style: TextStyle(
                                  fontFamily: 'ProductSans',
                                  color:
                                      Provider.of<Settings>(context).isDarkMode
                                          ? Color(0xffffffff)
                                          : Colors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                )),
                            thisSplit.length >= 0
                                ? Row(
                                    children: thisSplit
                                        .map((i) => Chip(
                                              label: Text(
                                                i.toString().toUpperCase(),
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              backgroundColor: i == 'w'
                                                  ? Colors.redAccent
                                                  : Colors.amber,
                                            ))
                                        .toList(),
                                    mainAxisAlignment:
                                        MainAxisAlignment.values[5],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                  )
                                : SizedBox(
                                    width: MediaQuery.of(context).size.height,
                                    height: 45,
                                  ),
                            SizedBox(height: 10.0),
                          ],
                        ),
                        decoration: Provider.of<Settings>(context).isDarkMode
                            ? setBlackCard
                            : setWhiteCard,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: MediaQuery.of(context).size.height / 8,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Run Rate',
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Provider.of<Settings>(context)
                                            .isDarkMode
                                        ? Color(0xffffffff)
                                        : Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Text(strikeRate(ball, score),
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Provider.of<Settings>(context)
                                            .isDarkMode
                                        ? Color(0xffffffff)
                                        : Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                        decoration: Provider.of<Settings>(context).isDarkMode
                            ? setBlackCard
                            : setWhiteCard,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: MediaQuery.of(context).size.height / 8,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("118th Lovers' Quarrel",
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Provider.of<Settings>(context)
                                            .isDarkMode
                                        ? Color(0xffffffff)
                                        : Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Text('Day $day',
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Provider.of<Settings>(context)
                                            .isDarkMode
                                        ? Color(0xffffffff)
                                        : Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                        decoration: Provider.of<Settings>(context).isDarkMode
                            ? setBlackCard
                            : setWhiteCard,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: MediaQuery.of(context).size.height / 7,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Batting',
                                    style: TextStyle(
                                      fontFamily: 'ProductSans',
                                      color: Provider.of<Settings>(context)
                                              .isDarkMode
                                          ? Color(0xffffffff)
                                          : Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,

                                    )),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                        '$player1name - $player1score ( $player1balls )'),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                        '$player2name - $player2score ( $player2balls )'),
                                  ],
                                )
                              ],
                            ),
                            Container(
                                width: 1.5,
                                height:
                                    MediaQuery.of(context).size.height / 7 - 20,
                                decoration: new BoxDecoration(
                                    color: Color(0xffe0e3e5))),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Balling',
                                    style: TextStyle(
                                      fontFamily: 'ProductSans',
                                      color: Provider.of<Settings>(context)
                                              .isDarkMode
                                          ? Color(0xffffffff)
                                          : Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    )),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                        '$bowlerName - $bowlerScore ( $bowlerBalls )'),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text('Wickets - $bowlerWickets'),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        decoration: Provider.of<Settings>(context).isDarkMode
                            ? setBlackCard
                            : setWhiteCard,
                      ),
                      SizedBox(height: 10.0),
                    ])),
                    verticalOffset: MediaQuery.of(context).size.height+10,
                    duration: const Duration(seconds: 1))),
            padding: EdgeInsets.all(10.0)));
  }
}
