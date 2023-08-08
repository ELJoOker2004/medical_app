import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final double height;
  final double width;
  final String svgIcon;
  final String mainText;
  final String? subText;
  final Color cardColor;
  final Function onTap;

  CustomCard({
    required this.height,
    required this.width,
    required this.svgIcon,
    required this.mainText,
    this.subText,
    required this.cardColor,
    required this.onTap, // Add the required onTap parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          // Call the onTap function passed from the parent widget
          onTap();
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: cardColor,
          child: Container(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Align text to the middle
              children: [
                SizedBox(height: 20),
                SvgPicture.asset(
                  svgIcon,
                  width: 66,
                  height: 66,
                ),
                SizedBox(height: 15),
                Text(
                  mainText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center, // Align text to the center horizontally
                ),
                if (subText != null) ...[

                  Text(
                    subText!,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center, // Align text to the center horizontally
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard2 extends StatelessWidget {
  final double height;
  final double width;
  final String svgIcon;
  final String mainText;
  final String? subText;
  final Color cardColor;
  final Function onTap;

  CustomCard2({
    required this.height,
    required this.width,
    required this.svgIcon,
    required this.mainText,
    this.subText,
    required this.cardColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: cardColor,
          child: Container(
            height: height,
            width: width,
            child: Row( // Change from Column to Row

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Align text to the right
                  children: [
                    Text(
                      mainText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (subText != null) ...[
                      SizedBox(height: 4),
                      Text(
                        subText!,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ],
                ),
                 // Add spacing between SVG and text
                Padding(
                  padding: const EdgeInsets.all(16.0), // Add padding
                  child:SvgPicture.asset(
                    svgIcon,
                    width: 66,
                    height: 66,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




