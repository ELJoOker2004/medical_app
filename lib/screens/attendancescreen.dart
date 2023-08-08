import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/screens/doctor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool isTapped = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadIsTapped();
  }

  Future<void> _loadIsTapped() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      isTapped = _prefs.getBool('isTapped') ?? false;
    });
  }

  void _onImageTapped() {
    if (!isTapped) {
      _prefs.setBool('isTapped', true);
      setState(() {
        isTapped = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: mainColor,
      body: Center( // Wrap the content with Center widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _onImageTapped,
              child: isTapped
                  ? SvgPicture.asset(
                mark,
                width: 200,
                height: 200,
              )
                  : SvgPicture.asset(
                fingerprint,
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              isTapped
                  ? 'Your attendance has been registered'
                  : 'Please touch ID sensor to verify registration',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center, // Align text to the center
            ),

            if (isTapped)
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: GestureDetector(
                  onTap:() {
                    Navigator.pop(context); // Navigate back to the previous screen
                  },
                  child: SvgPicture.asset(
                    arrow, // Replace with the path to your second SVG image
                    width: 58,
                    height: 58,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
