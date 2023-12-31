import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast extends StatelessWidget {
  final String? message;
  final Color color;
  const FlutterToast({Key? key, this.message, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showToast();
      },
      child: const Text('Show Toast'),
    );
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: message ?? "Default Message",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.white,
      textColor: color,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
