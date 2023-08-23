import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/constatns/callscard.dart';
import 'package:medical_app/constants.dart';

class callsScreen extends StatefulWidget {
  const callsScreen({super.key});

  @override
  State<callsScreen> createState() => _callsScreenState();
}

class _callsScreenState extends State<callsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(
            backarrow, // Replace with the path to your SVG icon
            width: 14, // Set the width of the SVG
            height: 14, // Set the height of the SVG
          ),
          onPressed: () {
            Navigator.pop(context); // Add your navigation logic here
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "calls",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16, // You can adjust the font size as needed

              ),
            ),
            SizedBox(width: 45),
          ],
        ),
      ),



      body:Column(
        children: [
          callCard(
        name: 'Youssef Ayman',
        date: 'June 30, 2023 - 10:00 AM',
        onBusyPressed: () {
          // Handle busy button press
        },
        onAcceptPressed: () {
          // Handle accept button press
        },
      ),


        ],
      )
      ,
    );
  }
}


