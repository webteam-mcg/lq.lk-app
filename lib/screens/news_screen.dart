import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lq_live_app/settings.dart';
import 'package:lq_live_app/themes.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsScreenState();
  }
}

class _NewsScreenState extends State<NewsScreen> {
  String darkUrl = 'http://apps.kushan.info/twitter/';
  String whiteUrl = 'http://apps.kushan.info/twitter/light.html';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Provider.of<Settings>(context).isDarkMode
                              ? WebView(
                                  initialUrl: darkUrl,
                                  javascriptMode: JavascriptMode.unrestricted,
                                  gestureNavigationEnabled: false,
                                )
                              : WebView(
                                  initialUrl: whiteUrl,
                                  javascriptMode: JavascriptMode.unrestricted,
                                  gestureNavigationEnabled: false,
                                ),
                          decoration: Provider.of<Settings>(context).isDarkMode
                              ? setBlackCard
                              : setWhiteCard)),
                  verticalOffset: MediaQuery.of(context).size.height),
              duration: const Duration(seconds: 1))),
    );
  }
}
