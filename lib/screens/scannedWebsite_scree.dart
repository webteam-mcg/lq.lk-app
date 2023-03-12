import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lq_live_app/themes.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show DocumentSnapshot, FirebaseFirestore,QuerySnapshot;
import 'dart:async';


class PulseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PulseScreenState();
  }
}

class _PulseScreenState extends State<PulseScreen> {
  String theUrl = '';

  Future<String> getData() async {
    var collection = FirebaseFirestore.instance.collection('appdata');
    var docSnapshot = await collection.doc('data').get();

      Map<String, dynamic> data = docSnapshot.data();
      var value = data['wave_link'];
      setState(() {
        theUrl =value;
      });
      return value;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.white,
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Image.asset(
                'assets/icons/pulse.png',
                height: 30,
              )
      ),
      body:
      /*
      Container(
        child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10.0),
            child: AnimationConfiguration.synchronized(
                child: SlideAnimation(
                    child: FadeInAnimation(
                        child: Container(
                            padding: EdgeInsets.all(0.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 100,
                            child: WebView(
                                    initialUrl: theUrl,
                                    javascriptMode: JavascriptMode.unrestricted,
                                    gestureNavigationEnabled: false,
                                  ),
                            decoration: setBlackCard,
                        )
                    ),
                    verticalOffset: MediaQuery.of(context).size.height),
                duration: const Duration(seconds: 1))),
      ),
      */
      FutureBuilder<String>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String initialUrl = snapshot.data;
            return Container(
              child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(10.0),
                  child: AnimationConfiguration.synchronized(
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: Container(
                                padding: EdgeInsets.all(0.0),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height - 100,
                                child: WebView(
                                  initialUrl: initialUrl,
                                  javascriptMode: JavascriptMode.unrestricted,
                                  gestureNavigationEnabled: false,
                                ),
                                decoration: setBlackCard,
                              )
                          ),
                          verticalOffset: MediaQuery.of(context).size.height),
                      duration: const Duration(seconds: 1))),
            );
          }
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(child: Text("check internet connection",
              style: TextStyle(fontSize: 25),),height: 100,),
              CircularProgressIndicator(color: Colors.white,),
              Container(height: 70,)
            ],
          ));
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
