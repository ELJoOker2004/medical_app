import 'package:flutter/material.dart';
import 'package:medical_app/screens/attendancescreen.dart';

class ReceptionistScreen extends StatelessWidget {
  const ReceptionistScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
        leading: Icon(Icons.ac_unit_sharp),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0), 
        children: [
          CustomCard(
            title: 'Calls',
            color: Colors.blue,
            onTap: () {
              // Handle card 1 tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Attendance()),
              );
            },
          ),
          CustomCard(
            title: 'Tasks',
            color: Colors.green,
            onTap: () {
              // Handle card 2 tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Attendance()),
              );
            },
          ),
          CustomCard(
            title: 'Reports',
            color: Colors.purple,
            onTap: () {
              // Handle card 3 tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Attendance()),
              );
            },
          ),
          CustomCard(
            title: 'Attendance - Leaving',
            color: Colors.cyan,
            onTap: () {
              // Handle card 4 tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Attendance()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;

  const CustomCard({
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

