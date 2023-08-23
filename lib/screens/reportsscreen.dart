import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/constatns/reportscard.dart';
import 'package:medical_app/screens/createreportscreen.dart';
import 'package:intl/intl.dart';


class reportsScreen extends StatefulWidget {
  const reportsScreen({super.key});

  @override
  State<reportsScreen> createState() => _reportsScreenState();
}

class _reportsScreenState extends State<reportsScreen> {
  List<Report> reports = [];

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
              "Create Report",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16, // You can adjust the font size as needed

              ),
            ),
            SizedBox(width: 45),
          ],
        ),
      ),
      // ... App bar code ...

      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () async {
                  final newReport = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateReportScreen()),
                  );

                  if (newReport != null) {
                    setState(() {
                      reports.add(newReport);
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: mainColor, // Change the background color here
                    shape: BoxShape.rectangle, // You can adjust the shape if needed
                  ),
                  padding: EdgeInsets.all(8), // Add padding to create space around the SVG icon
                  child: SvgPicture.asset(
                    plus, // Replace with the path to your SVG icon
                    width: 24,
                    height: 24,
                  ),
                ),
              ),

            ),
          ),
          for (var report in reports)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportDetailsScreen(report: report), // Pass the selected report
                  ),
                );
              },
              child: ReportCard(
                name: report.name,
                date: report.date,
                description: report.description,
                images: report.images,
                navigator: (context) {
                  // No need for the navigator here
                },
              ),
            ),
        ],
      ),
    );
  }
}

class ReportDetailsScreen extends StatelessWidget {
  final Report report;

  ReportDetailsScreen({required this.report});

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
              "Report Details",
              style: TextStyle(
                color: Colors.black,
                fontSize:
                16, // You can adjust the font size as needed
              ),
            ),
            SizedBox(width: 45),
          ],
        ),
      ),
      body:
      Padding(
        padding:
        const EdgeInsets.all(16.0),
        child:
        SingleChildScrollView(
          child:
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children:[
              Text("Name: ${report.name}"),
              Text("Date: ${report.date}"),
              Text("Description: ${report.description}"),
              SizedBox(height:16),
              GridView.count(
                shrinkWrap:true,
                crossAxisCount:3,
                crossAxisSpacing:4.0,
                mainAxisSpacing:8.0,
                children:
                report.images.map((image) => Image.file(image)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Report {
  final String name;
  final String date;
  final String description;
  final List<File> images;

  Report({
    required this.name,
    required this.date,
    required this.description,
    required this.images,
  });
}
