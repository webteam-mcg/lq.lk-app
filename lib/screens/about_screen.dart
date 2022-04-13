import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lq_live_app/settings.dart';
import 'package:lq_live_app/themes.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AboutScreenState();
  }
}

class _AboutScreenState extends State<AboutScreen> {
  String webTeam = 'https://www.facebook.com/webteam.mcg/';
  String arch = 'https://www.facebook.com/arch1892/';
  String faceBook = 'https://www.facebook.com/MahindaCollege/';
  String instagram = 'https://www.instagram.com/mahindacollege/';
  String twitter = 'https://twitter.com/MahindaCollege/';
  String youTube = 'https://www.youtube.com/channel/UCRnbcK82wzCZEQ1mTbKIVng/';
  String web = 'https://www.mahindacollege.lk';

  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{'header_key': 'header_value'});
    } else {
      SnackBar(content: Text("Can't open $url"));
    }
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
                      child: Column(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 14.7, bottom: 17),
                              child: Text("About Us",
                                  style: TextStyle(
                                    color: Provider.of<Settings>(context)
                                            .isDarkMode
                                        ? Color(0xffffffff)
                                        : Color(0xff444b54),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                            new Container(
                                width: 982,
                                height: 1.5,
                                decoration: new BoxDecoration(
                                    color: Color(0xffe0e3e5))),
                            SizedBox(
                              height: 20,
                            ),
                            Container(padding: EdgeInsets.only(),height: 40,
                              child: Image.asset(
                                'assets/images/WebTeamMCG.png',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                  "Mahinda College Web Team established in 2007, is Sri Lanka’s First Ever School Web Casting Crew. ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
//                                    color: Color(0xff444b54),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(),height: 40,
                              child: Provider.of<Settings>(context).isDarkMode
                                  ? Image.asset(
                                'assets/images/ARCH92(ForLightMode).png',
                              )
                                  : Image.asset(
                                'assets/images/ARCH92(ForDarkMode).png',
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'Arch92 is a diverse creative multimedia crew, established and developed as a subsidiary of Mahinda College Web Team.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'ProductSans',
//                                  color: Color(0xff444b54),
                                  fontSize: 14,
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
                        decoration: Provider.of<Settings>(context).isDarkMode
                            ? setBlackCard
                            : setWhiteCard,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: Provider.of<Settings>(context).isDarkMode
                            ? setBlackCard
                            : setWhiteCard,
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                                icon: Image.asset(
                                  'assets/icons/Facebook.png',
                                  height: 40,
                                ),
                                onPressed: () {
                                  _launchInApp(faceBook);
                                }),
                            IconButton(
                                icon: Image.asset(
                                  'assets/icons/Instagram.png',
                                  height: 40,
                                ),
                                onPressed: () {
                                  _launchInApp(instagram);
                                }),
                            IconButton(
                                icon: Image.asset(
                                  'assets/icons/Twitter.png',
                                  height: 40,
                                ),
                                onPressed: () {
                                  _launchInApp(twitter);
                                }),
                            IconButton(
                                icon: Image.asset(
                                  'assets/icons/Youtube.png',
                                  height: 40,
                                ),
                                onPressed: () {
                                  _launchInApp(youTube);
                                }),
                            IconButton(
                                icon: Image.asset(
                                  'assets/icons/Web1.png',
                                  height: 35,
                                ),
                                onPressed: () {
                                  _launchInApp(web);
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('Dark Mode'),
                              Switch(
                                value:
                                    Provider.of<Settings>(context).isDarkMode,
                                onChanged: (bool newValue) {
                                  changeTheme(
                                      Provider.of<Settings>(context,
                                                  listen: false)
                                              .isDarkMode
                                          ? false
                                          : true,
                                      context);
                                },
                                activeColor: setLightTheme.primaryColor,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('-SOTG 22'),
                              Text('Made with ❤ at'),
                              Text('WebTeam MCG')
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
                  verticalOffset: MediaQuery.of(context).size.height),
              duration: const Duration(seconds: 1))),
    );
  }

  void changeTheme(bool set, BuildContext context) {
    ///Call setDarkMode method inside our Settings ChangeNotifier class to
    ///Notify all the listeners of the change.
    Provider.of<Settings>(context, listen: false).setDarkMode(set);
  }
}
