import 'package:flutter/material.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final ButtonStyle commonButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white,
    onPrimary: Color(0xFF22C7B8),
    elevation: 0,
    side: BorderSide(color: grey, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    // Add border
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Prototype Map',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _navigateToScreen(context, 'Doctor'),
                  child: Text('Doctor'),
                  style: commonButtonStyle,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _navigateToScreen(context, 'Receptionist'),
                  child: Text('Receptionist'),
                  style: commonButtonStyle,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _navigateToScreen(context, 'Nurse'),
                  child: Text('Nurse'),
                  style: commonButtonStyle,
                ),
              ],
            ),
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _navigateToScreen(context, 'Analysis Employee'),
                  child: Text('Analysis Employee'),
                  style: commonButtonStyle,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _navigateToScreen(context, 'Manager'),
                  child: Text('Manager'),
                  style: commonButtonStyle,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _navigateToScreen(context, 'HR'),
                  child: Text('HR'),
                  style: commonButtonStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String option) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedOption', option); // Save the selected option

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
