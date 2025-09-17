import 'package:csi_attendance/utils/styles.dart';
import 'package:flutter/material.dart';

class RectButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const RectButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(text);
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Center(child: Text(text, style: Styles.textStyle)),
      ),
    );
  }
}
