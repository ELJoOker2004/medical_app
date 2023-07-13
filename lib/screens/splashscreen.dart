import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/screens/firstscreen.dart';
import 'package:medical_app/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = false;
  double _progressValue = 0.0; // Initial progress value

  @override
  void initState() {
    super.initState();
    _loadData((progress) {
      setState(() {
        _progressValue = progress; // Update progress value based on reported progress
      });
    });
  }

  Future<void> _loadData(Function(double) onProgress) async {
    setState(() {
      _isLoading = true;
    });

    // Perform any asynchronous operations here, such as loading data from an API or initializing resources
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      onProgress((i + 1) / 10.0); // Report progress using the callback function
    }

    setState(() {
      _isLoading = false;
    });

    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FirstScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSplashScreen(
            duration: 5,
            splashIconSize: double.infinity,
            centered: true,
            splashTransition: SplashTransition.fadeTransition,
            splash: SvgPicture.asset(splashscreen),
            nextScreen: FirstScreen(),
          ),
          if (_isLoading)
            Positioned(
              left: 0,
              right: 0,
              bottom: 220,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), // Set the desired border radius
                        child: Container(
                          width: 260.0, // Set the desired width
                          height: 4.0, // Set the desired height
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.transparent,
                            value: _progressValue, // Set the progress value
                            valueColor: AlwaysStoppedAnimation<Color>(
                              mainColor, // Customize the color of the loading bar
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}