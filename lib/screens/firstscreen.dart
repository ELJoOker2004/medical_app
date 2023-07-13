import 'package:flutter/material.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/screens/loginscreen.dart';
import 'package:medical_app/screens/splashscreen.dart';

class FirstScreen extends StatelessWidget {
  final ButtonStyle commonButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white,
    onPrimary: Color(0xFF22C7B8),
    elevation: 0,
    side: BorderSide(color: grey, width: 1),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
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
                  onPressed: () => _navigateToLoginScreen(context, 'Doctor'),
                  child: Text('Doctor'),
                  style: commonButtonStyle,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _navigateToLoginScreen(context, 'Receptionist'),
                  child: Text('Receptionist'),
                  style: commonButtonStyle,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _navigateToLoginScreen(context, 'Nurse'),
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
                  onPressed: () => _navigateToLoginScreen(context, 'Analysis Employee'),
                  child: Text('Analysis Employee'),
                  style: commonButtonStyle,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _navigateToLoginScreen(context, 'Manager'),
                  child: Text('Manager'),
                  style: commonButtonStyle,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _navigateToLoginScreen(context, 'HR'),
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

  void _navigateToLoginScreen(BuildContext context, String option) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(option: option), // Pass the selected option to the LoginScreen widget
      ),
    );
  }
}
