// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'afterscan.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show DocumentSnapshot, FirebaseFirestore, QuerySnapshot;


// ignore: use_key_in_widget_constructors
class ScanScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScanScreenState();
  }
}

class _ScanScreenState extends State<ScanScreen> {
  StreamSubscription<DocumentSnapshot> infoWaveQ;
  final documentReference = FirebaseFirestore.instance.collection("appdata").doc("scanscreen");
  bool Showbackbutton = false;
  bool notControllerReady = true;
  List outputt;
  List<CameraDescription> _cameras;
  CameraController _controller;
  CameraImage imgj;
  int imageCount = 0;
  bool isdistake = false;
  final String imagePath = '';
  String stringToShow="Scan the Wave of Mahinda and you will be redirected to a surprise";
  String stringToShow2="";
  BuildContext badContext;

  @override
  void dispose() {
    _controller?.dispose();
    Tflite.close();
    infoWaveQ.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _intilTensorFlite();
    infoWaveQ = documentReference.snapshots().listen((dataSnapshot) {
      if (dataSnapshot.exists) {
        setState(() {
          stringToShow = dataSnapshot.data()['text1'];
          stringToShow2 = dataSnapshot.data()['text2'];
        });
      }
    });
  }

  Future<void> _intilTensorFlite() async {
    String res = await Tflite.loadModel(
        //model: "assets/ssd_mobilenet.tflite",
        //labels: "assets/labels.txt",
        model: "assets/android.tflite",
        labels: "assets/labels2.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
    setupCamera();
  }

  Future<void> setupCamera() async {
    _cameras = await availableCameras();
    var controller = await selectCamera();
    await controller.lockCaptureOrientation();
    setState(() => _controller = controller);
    setState(() {
      notControllerReady = false;
    });
    _controller.startImageStream((image) {
      imageCount++;
      if (imageCount == 2 && isdistake) {
        imageCount = 0;
        objectRecognizer(image);
        setState(() {
          imageCount = 0;
          isdistake = false;
        });
      }
    });
  }

  selectCamera() async {
    var controller = CameraController(_cameras[0], ResolutionPreset.high, enableAudio: false);
    await controller.initialize();
    return controller;
  }

  void afterDoingTheScan(BuildContext badContext) {
    String objectToLookFor = "LOGO";
    double logoconfidence = 0.0;
    print(outputt);
    if (outputt.isEmpty) {
      showAlertDialog(badContext);
    } else {
      if (outputt[0]['label'] == "LOGO") {
        logoconfidence = outputt[0]['confidence'];
      } else {
        logoconfidence = 1 - outputt[0]['confidence'];
      }
      if (logoconfidence > 0.35) {
        showAlertDialog2(badContext);
        //dispose();
      } else {
        showAlertDialog(badContext);
      }
      /*
      for (int j = 0; j < outputt.length; j++) {
        if (outputt[j]['detectedClass'] == objectToLookFor &&
            outputt[j]['confidenceInClass'] > maxAccuracyFound) {
          maxAccuracyFound = outputt[j]['confidenceInClass'];
        }
      }
      if (maxAccuracyFound > 0.35) {
        showAlertDialog2(badContext);
      }
      else {
        showAlertDialog(badContext);
      }
      */
    }
  }

  Future<void> objectRecognizer(CameraImage img) async {
    var recognitions = await Tflite.runModelOnFrame(
        bytesList: img.planes.map((plane) {
          return plane.bytes;
        }).toList(), // required
        // model: "SSDMobileNet",
        imageHeight: img.height,
        imageWidth: img.width,
        imageMean: 127.5, // defaults to 127.5
        imageStd: 127.5, // defaults to 127.5
        rotation: 90, // defaults to 90, Android only
        threshold: 0.01, // defaults to 0.1
        asynch: true // defaults to true
        );
    setState(() {
      outputt = recognitions;
    });
    print("adfasd");
    print(recognitions);
    afterDoingTheScan(badContext);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      badContext = context;
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              //color: Colors.black,
              //margin: const EdgeInsets.all(15),
              child: Container(
                //padding: const EdgeInsets.all(0),
                //height: 450,
                //alignment: Alignment.center,
                child: //CameraPreview(_controller),
                    notControllerReady
                        ?  Container(
                      child: Container(
                        child: Container(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: MediaQuery.of(badContext).size.height * 0.3,),
                                  Text(
                                    "Camera permissions not granted",
                                    style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Please enable camera permissions",
                                    style: TextStyle(color: Colors.white,fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ],

                              ),

                            ],
                          ),
                          width: MediaQuery.of(context).size.width * 0.58,
                        ),
                        alignment: Alignment.topCenter,

                      ),
                      color: Colors.black,
                    )
                        : CameraPreview(_controller),
              ),
            ),
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8),
                  BlendMode.srcOut), // This one will create the magic
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        backgroundBlendMode: BlendMode
                            .dstOut), // This one will handle background + difference out
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.2),
                      height: MediaQuery.of(context).size.height * 0.52,
                      width: MediaQuery.of(context).size.width * 0.78,
                      //width: 300,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(width: 9, color: Colors.white,)
                        //border: Border.symmetric(vertical: 2,horizontal:  ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  //   margin: EdgeInsets.all(0),
                  margin: EdgeInsets.only(bottom:MediaQuery.of(context).size.height * 0.2),
                  height: MediaQuery.of(context).size.height * 0.52,
                  width: MediaQuery.of(context).size.width * 0.78,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 10,
                        color: Colors.white,
                      )
                      //border: Border.symmetric(vertical: 2,horizontal:  ),
                      ),
                )),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.60,),
                child: IconButton(
                  icon: Icon(Icons.camera),
                  color: Colors.white,
                  onPressed: () {
                    // try {
                    //final path = join(
                    // (await getTemporaryDirectory()).path, //Temporary path
                    //'lqlk_app_scan.png',
                    //);
                    setState(() {
                      imageCount = 0;
                      isdistake = true;
                    });
                    isdistake = true;
                    imageCount = 0;
                    // see if hotdog is detected

                    //image.saveTo(path);
                    //final ImagePath = path;
                    // objectRecognizer(ImagePath);
                    //}catch (e) {
                    // print(e);
                    // }
                  },
                  iconSize: 50,
                ),
              ),
            ),

            ///*
            // sliding up panel
            SlidingUpPanel(
              color: Color(0xff1b1b1b),
              backdropColor: Colors.transparent,
              minHeight: 70,
              maxHeight: 400,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              panel: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                  Container(
                    child: Text(
                      "Scan the Wave of Mahinda ",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                  Container(
                    child: Text("$stringToShow",
                            style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    width: MediaQuery.of(context).size.width - 40,

                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    child: Text("$stringToShow2",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    width: MediaQuery.of(context).size.width - 40,

                  ),
                  //SizedBox(
                  //  height: MediaQuery.of(context).size.height / 14,
                  //),
                  Spacer(),
                  Container(
                    child: Image(
                      image: AssetImage("assets/icons/pulse.png"),
                      fit: BoxFit.fill,
                    ),
                    height: 60,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                ],
              ),
              collapsed: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                width: 10.0,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Column(
                      children: const [
                        Center(
                          child: Icon(
                            Icons.upload_rounded,
                            color: Colors.white,
                          ),
                        ),
                        Center(
                          child: Text(
                            "What does this do?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //*/

            /*
            Container(
              color: Colors.grey,
              child: outputt != null ?Column(
                children:  <Widget>[
                 Text('${outputt[0]['detectedClass']}:${outputt[0]['confidenceInClass']}'),
                 Text('${outputt[1]['detectedClass']}:${outputt[1]['confidenceInClass']}'),
              ]
              )
              :Text('adfa')

            )
            */
          ],
        ),
      ),
    );
  }
}
