import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';

class Nurse {
  final String name;
  final String specialist;
  final String svgPath;
  bool isSelected;

  Nurse({required this.name, required this.specialist, required this.svgPath, this.isSelected = false});
}

class SelectNurseScreen extends StatefulWidget {
  @override
  _SelectNurseScreenState createState() => _SelectNurseScreenState();
}

class _SelectNurseScreenState extends State<SelectNurseScreen> {
  final List<Nurse> nurses = [
    Nurse(name: "Youssef Ayman", specialist: "Cardiology-Nurse", svgPath: ''),      //add svg path gere
    Nurse(name: "Youssef Ayman", specialist: "Pediatrics-Nurse", svgPath: ''),   //add svg path gere
    // Add more nurses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(
            cross, // Replace with the path to your SVG icon
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
              "Select Nurse",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16, // You can adjust the font size as needed

              ),
            ),
            SizedBox(width: 45),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: nurses.length,
              itemBuilder: (context, index) {
                return NurseCard(
                  nurse: nurses[index],
                  onTap: () {
                    setState(() {
                      for (int i = 0; i < nurses.length; i++) {
                        nurses[i].isSelected = (i == index);
                      }
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle the 'Select Nurse' button press
              },
              style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: Size(343,48)),
              child: Text('Select Nurse'),
            ),
          ),

        ],
      ),
    );
  }
}

class NurseCard extends StatelessWidget {
  final Nurse nurse;
  final VoidCallback onTap;

  NurseCard({required this.nurse, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align elements to the right edge
        children: [
          Row(
            children: [
              SvgPicture.asset(nurse.svgPath, width: 32, height: 32), // SVG Icon
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nurse.name, style: TextStyle(fontSize: 16)),
                  Text(nurse.specialist, style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: nurse.isSelected ? Colors.blue : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
