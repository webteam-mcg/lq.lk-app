import 'package:flutter/material.dart';

showAlertDialog2(BuildContext context){
  AlertDialog alert = const AlertDialog(
      title:  Center(child: Text("It there",textAlign: TextAlign.center,)),
      content: Text("get redirected fool"),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog(BuildContext context) {
  Widget retryButton = TextButton(
    child: Text("retry"),
    onPressed: () => Navigator.of(context).pop(),  );
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () => Navigator.pushNamed(context, '/'),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Center(child: Text("unfortunately the logo was not detected",textAlign: TextAlign.center,)),
    content: Container(
        height: 50,
        child: const Text("try rescanning"),
    ),
    actions: [
      retryButton,
      cancelButton
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}