import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
  // String darkUrl = 'http://apps.kushan.info/twitter/';
  // String whiteUrl = 'http://apps.kushan.info/twitter/light.html';
  // <a class="twitter-timeline" href="https://twitter.com/TwitterDev?ref_src=twsrc%5Etfw">Tweets by TwitterDev</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
  // String whiteUrl = 'https://www.lq.lk';
  // String darkUrl = 'https://www.lq.lk';
  //String whiteUrl = 'https://rebrand.ly/yx9olh3';
  String whiteUrl = 'https://rebrand.ly/bc4dc7';
  String darkUrl = 'https://rebrand.ly/yx9olh3';

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
                          padding: EdgeInsets.all(0.0),
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
