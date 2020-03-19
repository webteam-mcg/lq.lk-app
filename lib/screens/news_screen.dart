import 'package:flutter/material.dart';
import 'package:tweet_webview/tweet_webview.dart';

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
        body: Center(
            child: TweetWebView.tweetUrl('https://twitter.com/MahindaCollege')
        ),
      ),
    );
  }
}
