import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/constatns/reportscard.dart';
import 'package:medical_app/screens/createreportscreen.dart';
import 'package:intl/intl.dart';


class tasksScreen extends StatefulWidget {
  const tasksScreen({super.key});

  @override
  State<tasksScreen> createState() => _tasksScreenState();
}

class _tasksScreenState extends State<tasksScreen> {
  List<Task> tasks = [];

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
              "Tasks",
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
                  final newTask = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateReportScreen()),
                  );

                  if (newTask != null) {
                    setState(() {
                      tasks.add(newTask);
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
          for (var task in tasks)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => taskDetailsScreen(task: task), // Pass the selected report
                  ),
                );
              },
              child: ReportCard(
                name: task.name,
                date: task.date,
                description: task.description,
                navigator: (context) {
                  // No need for the navigator here
                }, images: [],
              ),
            ),
        ],
      ),
    );
  }
}

class taskDetailsScreen extends StatelessWidget {                   //unfinished screen (for example only)
  final Task task;

  taskDetailsScreen({required this.task});

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
              "Task Details",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16, // You can adjust the font size as needed

              ),
            ),
            SizedBox(width: 45),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${task.name}"),
            Text("Date: ${task.date}"),
            Text("Description: ${task.description}"), // Display the description
            // Add more information about the report if needed
          ],
        ),
      ),
    );
  }
}


class Task {
  final String name;
  final String date;
  final String description;

  Task({required this.name, required this.date, required this.description});
}


