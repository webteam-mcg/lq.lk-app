import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MatchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MatchScreenState();
  }
}

class _MatchScreenState extends State<MatchScreen> {
  String overs = '25.1';
  String thisover = '0 , 0 , 0 , 0 , 0 , 0';
  String day = '1';
  String score = '215';
  String wicket = '7';
  String college = 'MAHINDA COLLEGE';
  String strikerate = '5.5';
  String specialmsg = 'Corona Hinda Gedarata Wela idala epawela 😥😥';
  String batsmanonename = 'V. Dulsara';
  String batsmantwoname = 'R. Kavindu';
  String ballername = 'S. Stark';
  String batsmanonescore = '60';
  String batsmantwoscore = '30';
  String batsmanoneballs = '75';
  String batsmantwoballs = '15';
  bool showsecond = true;
  bool showmsgbox = false;

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
                child: AnimationLimiter(
                    child: Column(
                  children: AnimationConfiguration.toStaggeredList(duration: const Duration(seconds: 1),
                      childAnimationBuilder: (widget)=> SlideAnimation(horizontalOffset: MediaQuery.of(context).size.width,child: FadeInAnimation(child: ScaleAnimation(child: widget))), children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(college,
                              style: TextStyle(
                                fontFamily: 'ProductSans',
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
//                        SizedBox(height: 10,),
                          Text(score + '/' + wicket,
                              style: TextStyle(
                                fontFamily: 'ProductSans',
                                color: Colors.black,
                                fontSize: 80,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                          Text('(' + overs + ' OVERS)',
                              style: TextStyle(
                                fontFamily: 'ProductSans',
                                color: Colors.black,
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
                                      Image.asset(
                                        'assets/images/Mahinda.png',
                                        height: 70.0,
//                                      width: 65.0,
                                      ),
                                      SizedBox(
                                        height: 5,
                                        width: 5,
                                      ),
                                      Text('MCG',
                                          style: TextStyle(
                                            fontFamily: 'ProductSans',
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('210/7',
                                                  style: TextStyle(
                                                    fontFamily: 'ProductSans',
                                                    color: Colors.black,
                                                    fontSize: 16.7,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                              Text('(20.1)',
                                                  style: TextStyle(
                                                    fontFamily: 'ProductSans',
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 40.0,
                                          ),
                                          Text("1st",
                                              style: TextStyle(
                                                fontFamily: 'ProductSans',
                                                color: Colors.grey,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                              )),
                                          SizedBox(
                                            width: 40.0,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('210/7',
                                                  style: TextStyle(
                                                    fontFamily: 'ProductSans',
                                                    color: Colors.black,
                                                    fontSize: 16.7,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                              Text('(20.1)',
                                                  style: TextStyle(
                                                    fontFamily: 'ProductSans',
                                                    color: Colors.grey,
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
                                      showsecond == true
                                          ? Row(
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('210/7',
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'ProductSans',
                                                    color: Colors.black,
                                                    fontSize: 16.7,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    fontStyle:
                                                    FontStyle.normal,
                                                  )),
                                              Text('(20.1)',
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'ProductSans',
                                                    color: Colors.grey,
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
                                                color: Colors.grey,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
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
                                              Text('210/7',
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'ProductSans',
                                                    color: Colors.black,
                                                    fontSize: 16.7,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    fontStyle:
                                                    FontStyle.normal,
                                                  )),
                                              Text('(20.1)',
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'ProductSans',
                                                    color: Colors.grey,
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
                                    ],
                                  ),
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
                                        child: Image.asset(
                                          'assets/images/RCG.png',
                                          height: 70.0,
//                                        width: 60,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                        width: 5,
                                      ),
                                      Text('RCG',
                                          style: TextStyle(
                                            fontFamily: 'ProductSans',
                                            color: Colors.black,
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
                                  Text("115th Lovers' Quarrel",
                                      style: TextStyle(
                                        fontFamily: 'ProductSans',
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Text('Day ' + day,
                                      style: TextStyle(
                                        fontFamily: 'ProductSans',
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  showmsgbox == true
                                      ? SizedBox.shrink()
                                      : Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(specialmsg,
                                          style: TextStyle(
                                            fontFamily: 'ProductSans',
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  )
                                ],
                              ),
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
                          )),
                      SizedBox(height: 10.0),
                      Container(
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text('This Over',
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(thisover,
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                              SizedBox(height: 10.0),
                            ],
                          ),
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
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text('Strike Rate',
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(strikerate,
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                              SizedBox(height: 10.0),
                            ],
                          ),
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
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text("115th Lovers' Quarrel",
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text('Day ' + day,
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                              SizedBox(height: 10.0),
                            ],
                          ),
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
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('Batting',
                                      style: TextStyle(
                                        fontFamily: 'ProductSans',
                                        color: Colors.grey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                      '$batsmanonename - $batsmanonescore ($batsmanoneballs)'),
                                  Text(
                                      '$batsmantwoname - $batsmantwoscore ($batsmantwoballs)'),
                                ],
                              ),
                              Container(
                                  width: 3,
                                  height: 100,
                                  decoration: new BoxDecoration(
                                      color: Color(0xffe0e3e5))),
                              Column(
                                children: <Widget>[
                                  Text('Balling',
                                      style: TextStyle(
                                        fontFamily: 'ProductSans',
                                        color: Colors.grey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(ballername),
                                  Text(''),
                                ],
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
                          )),
                      SizedBox(height: 10.0),
                    ],),
                )),
                padding: EdgeInsets.all(10.0))));
  }
}
