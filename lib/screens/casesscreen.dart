import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/constatns/callscard.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/constatns/casescard.dart';
import 'package:medical_app/screens/casedetailsscreen.dart';

class casesScreen extends StatefulWidget {
  const casesScreen({super.key});

  @override
  State<casesScreen> createState() => _casesScreenState();
}

class _casesScreenState extends State<casesScreen> {
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
          CaseCard(
            name: 'Youssef Ayman',
            date: 'June 30, 2023 - 10:00 AM',
            navigator: (context) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CaseDetailsScreen(name: 'Youssef Ayman', // Pass the name
                date: 'June 30, 2023 - 10:00 AM', // Pass the date), // Your other screen
                ),
                ),
              );
            },
          ),


        ],
      )
      ,
    );
  }
}


