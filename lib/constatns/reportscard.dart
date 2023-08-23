import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';

class ReportCard extends StatelessWidget {
  final String name;
  final String date;
  final String description;

  final Function(BuildContext context) navigator; // Add navigator parameter

  ReportCard({
    required this.name,
    required this.date,
    required this.description,
    required this.navigator, required List<File> images, // Pass the navigator function
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
                SvgPicture.asset(personIcon, width: 20, height: 20),
                SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(fontSize: 14, color: Color(0xFF2C2C2C)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset(calenderIcon, width: 20, height: 20),
                SizedBox(width: 10),
                Text(
                  date,
                  style: TextStyle(fontSize: 14, color: Color(0xFF2C2C2C)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
