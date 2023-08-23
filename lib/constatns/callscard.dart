import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';

class callCard extends StatelessWidget {
  final String name;
  final String date;

  final VoidCallback onBusyPressed;
  final VoidCallback onAcceptPressed;

  callCard({
    required this.name,
    required this.date,
    required this.onBusyPressed,
    required this.onAcceptPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
        SvgPicture.asset(personIcon,width: 20, // Set the width of the SVG
            height: 20),
                SizedBox(width: 10),
                Text(
                  name,
                    style: TextStyle(fontSize: 14, color: Color(0xFF2C2C2C))
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset(calenderIcon,width: 20, // Set the width of the SVG
                  height: 20,),
                SizedBox(width: 10),
                Text(date,style: TextStyle(fontSize: 14, color: Color(0xFF2C2C2C))),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onBusyPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1AD672), // Set the left button color
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(trueIcon), // Replace with your SVG icon
                      SizedBox(width: 5),
                      Text('Accept'),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onAcceptPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFEC9511), // Set the right button color
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(falseIcon), // Replace with your SVG icon
                      SizedBox(width: 5),
                      Text('Busy'),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
