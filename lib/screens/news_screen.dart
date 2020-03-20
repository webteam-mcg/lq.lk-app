import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsScreenState();
  }
}

class _NewsScreenState extends State<NewsScreen> {
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
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10.0),
            child: AnimationConfiguration.synchronized(
                child: SlideAnimation(
                    child: FadeInAnimation(
                        child: Container(
                            padding: EdgeInsets.all(4.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 160,
                            child: WebView(
                              initialUrl:
                                  'http://apps.kushan.info/twitter/light.html',
                              javascriptMode: JavascriptMode.unrestricted,
                              gestureNavigationEnabled: false,
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
                duration: const Duration(seconds: 1))),
      ),
    );
  }
}
