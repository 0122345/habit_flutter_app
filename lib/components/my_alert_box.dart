import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final controller;
  final VoidCallback onBika;
  final VoidCallback onSiba;

  const MyAlertBox({
    super.key,
    required this.controller,
    required this.onBika,
    required this.onSiba
     });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onBika,
          child: Text(
            "Bika",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black45,
        ),
        MaterialButton(
          onPressed: onSiba,
          child:  Text(
            "Siba",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black45,
        ),
      ],
    );
  }
}
