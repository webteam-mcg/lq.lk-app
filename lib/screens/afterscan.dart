import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'scannedWebsite_scree.dart';
showAlertDialog2(BuildContext context){
  Navigator.of(context).pop();
  Navigator.push(
    context,
  MaterialPageRoute(builder: (context) => PulseScreen())
  );
  /*
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
   */
}

showAlertDialog(BuildContext context) {
  Widget retryButton = TextButton(
    child: Text("Retry",style: TextStyle(color: Colors.white),),
    onPressed: () => Navigator.of(context).pop(),  );
  Widget cancelButton = TextButton(
    child: Text("Cancel",style: TextStyle(color: Colors.white),),
    onPressed: () => Navigator.pushNamed(context, '/'),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Center(child: Text("Wave not detected",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
    content: Container(
        height: 100,
        child: Column(
          children: [
            Container(child: Text("Make sure you scan the Wave of Mahinda",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),alignment: Alignment.topCenter,),
            //SizedBox(height: 25,),
            Spacer(),
            Container(child: Image(image: AssetImage("assets/icons/pulse.png"),fit: BoxFit.fill,),height: 37,alignment: Alignment.center,),
          ],
        ),
      padding: EdgeInsets.all(0),
    ),
    actions: [
      retryButton,
      Container(width: 90,),
      cancelButton,
      Container(width: 20,),
    ],
    backgroundColor: Color(0xff1b1b1b),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}