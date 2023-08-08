import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/screens/attendancescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medical_app/screens/firstscreen.dart';
import 'package:medical_app/constatns/customcard.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  String? selectedOption;

  // Function to load the selected option from SharedPreferences
  _loadSelectedOption() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? option = prefs.getString('selectedOption');
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadSelectedOption();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Youssef Ayman",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              if (selectedOption != null)
                Text(
                  selectedOption!,
                  style: TextStyle(fontSize: 10, color: mainColor),
                ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SvgPicture.asset(notificationIcon),
          )
        ],
        leading: SvgPicture.asset('assets/Rectangle 4.svg'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCard(
                      height: 192,
                      width: 163,
                      svgIcon: calls, // Replace with the path to your SVG icon
                      mainText: 'Calls',
                      subText: 'Optional Subtitle',
                      cardColor: Color(0xFF5F9EDC),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Attendance(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    CustomCard(
                      height: 158,
                      width: 163,
                      svgIcon: reports, // Replace with the path to your SVG icon
                      mainText: 'Reports',
                      subText: 'Optional Subtitle',
                      cardColor: Color(0xFF915FDC),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Attendance(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCard(
                      height: 158,
                      width: 163,
                      svgIcon: tasks, // Replace with the path to your SVG icon
                      mainText: 'Tasks',
                      subText: 'Optional Subtitle',
                      cardColor: Color(0xFF5FDC89),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Attendance(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    CustomCard(
                      height: 192,
                      width: 163,
                      svgIcon: finger, // Replace with the path to your SVG icon
                      mainText: 'Attendance-Leaving',
                      subText: 'Optional Subtitle',
                      cardColor: Color(0xFF5FDCDC),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Attendance(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20), // Add some space between existing cards and the new card
            Align(
              alignment: Alignment.center,
              child: CustomCard2(
                height: 145,
                width: 343,
                svgIcon: cases, // Replace with the path to your SVG icon
                mainText: 'New Card',
                subText: 'Optional Subtitle',
                cardColor: Color(0xFFCCCCCC),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Attendance(), // Replace with the desired screen widget
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),


    );
  }
}
