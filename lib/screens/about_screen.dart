import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AboutScreenState();
  }
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xffffaa00),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xffe0e3e6),
        ),
        home: Scaffold(
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10.0),
              child: AnimationConfiguration.synchronized(
                  child: SlideAnimation(
                      child: FadeInAnimation(
                          child: Container(
                        height: MediaQuery.of(context).size.height - 160,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 14.7, bottom: 17),
                              child: Text("About Us",
                                  style: TextStyle(
                                    color: Color(0xff444b54),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                            new Container(
                                width: 982,
                                height: 3,
                                decoration: new BoxDecoration(
                                    color: Color(0xffe0e3e5))),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: Image.asset(
                                'assets/images/weblogo.png',
                                height: 76.3,
                                width: 100,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                  "Mahinda College Web Team established in 2007, is Sri Lanka’s First Ever School Web Casting Crew. The society has been involved in providing a reliable and state of the art platform,casting school events for viewers spanning all around the globesince then. The society also pioneers in administrating all IT related activities of the school such as Official Photography of school events, Notifications of Tournament Fixtures, Live score updates, Maintenance of school social media & website etc...",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Color(0xff444b54),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.only(),
                              child: Image.asset(
                                'assets/images/ARCH92.png',
                                height: 76.3,
                                width: 100,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'Arch92 is a diverse creative multimedia crew, established and developed as a subsidiary of Mahinda College Web Team. Primarily focused on Photography and Cinematography, the Team consists of current students of the College and everything done and achieved as Arch92, is a result of their humble efforts',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'ProductSans',
                                  color: Color(0xff444b54),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
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
                                blurRadius: 10,
                                spreadRadius: 0)
                          ],
                        ),
                      )),
                      verticalOffset: MediaQuery.of(context).size.height),
                  duration: const Duration(seconds: 1))),
        ));
  }
}
