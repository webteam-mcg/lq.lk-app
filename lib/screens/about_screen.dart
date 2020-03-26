import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';

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
//        brightness: Brightness.dark
        ),
        home: Scaffold(
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(10.0),
              child: AnimationConfiguration.synchronized(
                  child: SlideAnimation(
                      child: FadeInAnimation(
                          child: Column(
                            children: <Widget>[
                              Container(
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
                                    Container(
                                      child: Image.asset(
                                        'assets/images/Web Team MCG.png',
                                        height: 76.3,
                                        width: 100,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Text(
                                          "Mahinda College Web Team established in 2007, is Sri Lanka’s First Ever School Web Casting Crew. ",
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
                                        'assets/images/ARCH92 (For Light Mode).png',
                                        height: 76.3,
                                        width: 100,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Text(
                                        'Arch92 is a diverse creative multimedia crew, established and developed as a subsidiary of Mahinda College Web Team.',
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
                                    SizedBox(
                                      height: 25.0,
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
                              ),
                              SizedBox(height: 10.0,),
                              Container(decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x26000000),
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 0)
                                ],
                              ),padding: EdgeInsets.symmetric(vertical: 30.0),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
                                IconButton(icon: Image.asset('assets/icons/Facebook1.png',height: 30,), onPressed: (){}),
                                IconButton(icon: Image.asset('assets/icons/Instagram.png',height: 30,), onPressed: (){}),
                                IconButton(icon: Image.asset('assets/icons/Twitter.png',height: 30,), onPressed: (){}),
                                IconButton(icon: Image.asset('assets/icons/Youtube.png',height: 30,), onPressed: (){}),
                                IconButton(icon: Image.asset('assets/icons/Web.png',height: 30,), onPressed: (){})
                              ],),),
                              SizedBox(height: 25.0,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
                                Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
                                  Text('Dark Mode'),
                                  SizedBox(height: 10.0,),
                                ],),
                                Column(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end,children: <Widget>[
                                  Text('-SOTG 20'),
                                  Text('Made with ❤ at'),
                                  Text('WebTeam MCG')
                                ],),
                              ],)
                            ],
                          )),
                      verticalOffset: MediaQuery.of(context).size.height),
                  duration: const Duration(seconds: 1))),
        ));
  }
}
