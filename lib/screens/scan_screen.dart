// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lq_live_app/main.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:path/path.dart';
import 'afterscan.dart';

// ignore: use_key_in_widget_constructors
class ScanScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScanScreenState();
  }
}

class _ScanScreenState extends State<ScanScreen> {
  List outputt;
  List<CameraDescription> _cameras;
  CameraController _controller;
  CameraImage imgj;
  int imageCount = 0;
  bool isdistake = false;
  final String imagePath = '';
  BuildContext badContext;

  @override
  void dispose() {
    _controller?.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _intilTensorFlite();
  }

  Future<void> _intilTensorFlite() async {
    setupCamera();
    String res = await Tflite.loadModel(
        model: "assets/ssd_mobilenet.tflite",
        labels: "assets/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
        true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
        false // defaults to false, set to true to use GPU delegate
    );
  }

  Future<void> setupCamera() async {
    _cameras = await availableCameras();
    var controller = await selectCamera();
    await controller.lockCaptureOrientation();
    setState(() => _controller = controller);
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
    var controller = CameraController(_cameras[0], ResolutionPreset.high);
    await controller.initialize();
    return controller;
  }

  void afterDoingTheScan(BuildContext badContext){
    bool isLogoDetected = false;
    String objectToLookFor = "hot dog";
    double maxAccuracyFound = 0.01;
    print("dummy text");
    print(outputt);
    if(outputt.isEmpty) {
      showAlertDialog(badContext);
    }
    else{
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
    }
  }

  Future<void> objectRecognizer(CameraImage img) async {
    var recognitions = await Tflite.detectObjectOnFrame(
        bytesList: img.planes.map((plane) {
          return plane.bytes;
        }).toList(), // required
        model: "SSDMobileNet",
        imageHeight: img.height,
        imageWidth: img.width,
        imageMean: 127.5, // defaults to 127.5
        imageStd: 127.5, // defaults to 127.5
        rotation: 90, // defaults to 90, Android only
        threshold: 0.3, // defaults to 0.1
        asynch: true // defaults to true
    );
    setState(() {
      outputt = recognitions;
    });
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
                child: CameraPreview(_controller),
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
                      margin: const EdgeInsets.only(bottom: 150),
                      height: 400,
                      //width: MediaQuery.of(context).size.width * 0.65,
                      width: 300,
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
                  margin: const EdgeInsets.only(bottom: 150),
                  height: 400,
                  //width: MediaQuery.of(context).size.width * 0.65,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 9,
                        color: Colors.white,
                      )
                    //border: Border.symmetric(vertical: 2,horizontal:  ),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 500),
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
              backdropColor: Colors.transparent,
              minHeight: 70,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              panel: Center(
                child: Container(
                    color: Colors.grey,
                    child: outputt != null
                        ? SizedBox(
                      height: 50,
                      width: 200,
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(children: const [
                          Text("detected"),
                        ]
                        ),
                      ),
                    )
                        : Text('adfa')),
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
