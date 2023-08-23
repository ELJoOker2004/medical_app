import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/screens/nursescreen.dart';

class CaseDetailsScreen extends StatelessWidget {
  final String name;
  final String date;

  CaseDetailsScreen({required this.name, required this.date});

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
              "Case Details",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16, // You can adjust the font size as needed

              ),
            ),
            SizedBox(width: 45),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Patient Name',
                    style: TextStyle(fontSize: 18, color: Color(0xFF989898)),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 18,color: Color(0xFF2C2C2C) , fontWeight: FontWeight.w300),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Age',
                    style: TextStyle(fontSize: 18, color: Color(0xFF989898)),
                  ),
                  Text(
                    'name',
                    style: TextStyle(fontSize: 18,color: Color(0xFF2C2C2C) , fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 18, color: Color(0xFF989898)),
                  ),
                  Text(
                    'name',
                    style: TextStyle(fontSize: 18,color: Color(0xFF2C2C2C) , fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(fontSize: 18, color: Color(0xFF989898)),
                  ),
                  Text(
                    date,
                    style: TextStyle(fontSize: 18,color: Color(0xFF2C2C2C) , fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Doctor',
                    style: TextStyle(fontSize: 18, color: Color(0xFF989898)),
                  ),
                  Text(
                    'name',
                    style: TextStyle(fontSize: 18,color: Color(0xFF2C2C2C) , fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nurse',
                    style: TextStyle(fontSize: 18, color: Color(0xFF989898)),
                  ),
                  Text(
                    'name',
                    style: TextStyle(fontSize: 18,color: Color(0xFF2C2C2C) , fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status',
                    style: TextStyle(fontSize: 18, color: Color(0xFF989898)),
                  ),
                  Text(
                    'name',
                    style: TextStyle(fontSize: 18,color: Color(0xFF2C2C2C) , fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Case Description",style: TextStyle(fontSize: 18, color: Color(0xFF989898)),),
                  Text("Details note : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's"
                      ,style: TextStyle(fontSize: 18,color: Color(0xFF2C2C2C) , fontWeight: FontWeight.w300))
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left:40.0),
                child: Row(

                  children: [


                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SelectNurseScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF1AD672),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(126, 40), // Adjust the width here
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            plus, // Replace with the path to your SVG icon
                            width: 20, // Adjust the icon size as needed
                            height: 20,
                          ),
                          SizedBox(width: 8), // Add some spacing between icon and text
                          Text(
                            'Add Nurse',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),





                    SizedBox(width: 10), // Add spacing
          ElevatedButton(
            onPressed: () {
              // Handle the 'Request' button press
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF1AD672),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minimumSize: Size(126, 40), // Adjust the width here
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  plus, // Replace with the path to your SVG icon
                  width: 20, // Adjust the icon size as needed
                  height: 20,
                ),
                SizedBox(width: 8), // Add some spacing between icon and text
                Text(
                  'Request',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),


                  ],
                ),
              ),

              SizedBox(height: 20), // Add spacing

              Container(                                             //can't make the button at the bottom
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the 'End Case' button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16), // Increase the button size
                  ),
                  child: Text('End Case', style: TextStyle(fontSize: 18)),
                ),
              ),





              // Add more details as needed
            ],
          ),
        ),
      ),
    );
  }
}
