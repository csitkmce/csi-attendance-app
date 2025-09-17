import 'package:csi_attendance/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class InfoBottomSheet extends StatelessWidget {
  const InfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Farhaan', style: Styles.titleStyle),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NOAH JOHN BYTE SIZED',
                      style: Styles.textStyle.copyWith(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'VEG',
                      style: Styles.textStyle.copyWith(
                        color: 'VEG' == 'VEG' ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 10),
              child: SlideAction(
                text: 'Slide to mark attendance',
                outerColor: Colors.green,
                onSubmit: () {},
                elevation: 0,
                borderRadius: 10,
                textStyle: Styles.textStyle,
              ),
            ),
            SizedBox(height: 10),
            Text('Event Name', style: Styles.smallTextStyle),
            Text('Hackade', style: Styles.textStyle),
            SizedBox(height: 10),
            Text('Email', style: Styles.smallTextStyle),
            Text('farhaan.nizam675@gmail.com', style: Styles.textStyle),
            SizedBox(height: 10),
            Text('Phone number', style: Styles.smallTextStyle),
            Text('8075221035', style: Styles.textStyle),
            SizedBox(height: 10),
            Text('Department', style: Styles.smallTextStyle),
            Text('Computer Science and Engineering', style: Styles.textStyle),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
