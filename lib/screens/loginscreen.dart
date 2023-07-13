import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/screens/homescreen.dart';

class LoginScreen extends StatefulWidget {
  final String option; // Add a variable to hold the selected option

  LoginScreen({required this.option}); // Constructor that accepts the option

  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false; // Track the visibility state of the password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Add SingleChildScrollView here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 10),
                  child: SvgPicture.asset(
                    appicon, // Replace with your SVG icon path
                    width: 104,
                    height: 103,
                  ),
                ),
                Center(
                  child: Text(
                    "Welcome Back!\n${widget.option}",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 26, // Adjust the font size as desired
                      height: 1.1, // Adjust the line height as desired
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: Text(
                      "To Continue, Login Now",
                      style: TextStyle(color: grey, fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: grey, width: .2),
                    // Adjust the width as desired
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: SvgPicture.asset(
                          phoneicon, // Replace with your SVG icon path
                          width: 15,
                          height: 15,
                          color: mainColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: SvgPicture.asset(
                          line, // Replace with your SVG icon path
                          width: 1,
                          height: 17,
                          color: mainColor,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone Number',

                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a phone number.';
                            }
                            if (value.length != 11) {
                              return 'Phone number must be 11 digits.';
                            }
                            if (!isNumeric(value)) {
                              return 'Phone number must contain only numbers.';
                            }
                            if (value.substring(0, 2) != '01' ||
                                !['5', '2', '1', '0'].contains(
                                    value.substring(2, 3))) {
                              return 'type a valid phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: mainColor),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: SvgPicture.asset(
                          passwordicon,
                          width: 15,
                          height: 15,
                          color: mainColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: SvgPicture.asset(
                          line, // Replace with your SVG icon path
                          width: 1,
                          height: 17,
                          color: mainColor,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password.';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: SvgPicture.asset(
                            _passwordVisible ? eyeicon : eyeicon,
                            width: 20,
                            height: 19,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: TextButton(
                        onPressed: () {
                          // Handle forget password button press
                        },
                        child: Text('Forgot Password ?'),
                        style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(grey)),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Get the entered data and navigate to another screen
                      final phoneNumber = _phoneNumberController.text;
                      final password = _passwordController.text;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(

                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 14),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll<Size>(
                        Size(double.infinity, 48)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(mainColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }
}
