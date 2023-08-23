import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/screens/reportsscreen.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CustomDateTimePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime) onDateTimeChanged;
  final String leftArrowSvgPath;
  final String rightArrowSvgPath;

  const CustomDateTimePicker({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateTimeChanged,
    required this.leftArrowSvgPath,
    required this.rightArrowSvgPath,
  }) : super(key: key);

  @override
  _CustomDateTimePickerState createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _selectedTime = TimeOfDay.fromDateTime(widget.initialDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).copyWith().size.height / 2,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: SvgPicture.asset(widget.leftArrowSvgPath),
                onPressed: () {
                  setState(() {
                    _selectedDate = DateTime(
                      _selectedDate.year,
                      _selectedDate.month - 1,
                    );
                  });
                },
              ),
              Text(
                '${monthName(_selectedDate)} ${_selectedDate.year}',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),
              ),
              IconButton(
                icon: SvgPicture.asset(widget.rightArrowSvgPath),
                onPressed: () {
                  setState(() {
                    _selectedDate = DateTime(
                      _selectedDate.year,
                      _selectedDate.month + 1,
                    );
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: daysInMonth(_selectedDate),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
              itemBuilder: (context, index) {
                final day = index + 1;
                final date = DateTime(_selectedDate.year, _selectedDate.month, day);
                return InkWell(
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _selectedTime = pickedTime;
                        widget.onDateTimeChanged(DateTime(
                          date.year,
                          date.month,
                          date.day,
                          _selectedTime.hour,
                          _selectedTime.minute,
                        ));
                      });
                    }
                  },
                  child: Center(child: Text(day.toString(),style: TextStyle(color: Colors.black),)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int daysInMonth(DateTime date) {
    final lastDayOfMonth = (date.month <12)
        ? DateTime(date.year, date.month +1,0)
        : DateTime(date.year +1,1,0);
    return lastDayOfMonth.day;
  }

  String monthName(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[date.month -1];
  }
}

class CreateReportScreen extends StatefulWidget {
  @override
  _CreateReportScreenState createState() => _CreateReportScreenState();
}

class _CreateReportScreenState extends State<CreateReportScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  DateTime? selectedDate;
  List<File> _images = [];
  final picker = ImagePicker();

  bool isCreateButtonEnabled() {
    return nameController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
  }

  Future<void> _selectDate() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CustomDateTimePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
            onDateTimeChanged: (DateTime value) {
              setState(() {
                selectedDate = value;
                dateController.text =
                    DateFormat('yyyy-MM-dd – kk:mm').format(selectedDate!);
              });
              Navigator.pop(context);
            },
            leftArrowSvgPath: 'assets/leftarrowcal.svg',
            rightArrowSvgPath: 'assets/rightarrowcal.svg');
      },
    );
  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

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
              TextField(
                controller:nameController,
                decoration:
                InputDecoration(labelText:"Name"),
                onChanged:(value)=>setState((){}),
              ),
              GestureDetector(
                onTap:_selectDate,
                child:
                AbsorbPointer(
                  child:
                  TextField(
                    controller:dateController,
                    decoration:
                    InputDecoration(labelText:"Date"),
                  ),
                ),
              ),
              TextField(
                controller:descriptionController,
                decoration:
                InputDecoration(labelText:"Description"),
                onChanged:(value)=>setState((){}),
              ),
              Center(
                child:ElevatedButton(
                  onPressed:
                  pickImage,
                  style:ElevatedButton.styleFrom(
                    primary:
                    Colors.white,elevation: 0, // Set the background color to transparent
                  minimumSize: Size(343, 209)),
                  child:
                  SvgPicture.asset(
                    uploadImage, // Replace with the path to your SVG icon
                     // Set the height of the SVG
                  ),
                ),
              ),
              SizedBox(height:16),
              GridView.count(
                shrinkWrap:true,
                crossAxisCount:3,
                crossAxisSpacing:4.0,
                mainAxisSpacing:8.0,
                children:_images.map((image) => GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder:(BuildContext context) {
                        return Column(
                          mainAxisSize:MainAxisSize.min,
                          children:[
                            ListTile(
                              leading:Icon(Icons.delete),
                              title:
                              Text('Delete Image'),
                              onTap: () {
                                setState(() {
                                  _images.remove(image);
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading:
                              Icon(Icons.edit),
                              title:
                              Text('Change Image'),
                              onTap: () {
                                pickImage();
                                setState(() {
                                  _images.remove(image);
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child:Image.file(image),
                )).toList(),
              ),
              SizedBox(height:16),
              SizedBox(
                width:
                double.infinity,
                child:ElevatedButton(
                  onPressed:
                  isCreateButtonEnabled()
                      ? () {
                    if (isCreateButtonEnabled()) {
                      // Ensure all fields are filled before proceeding
                      Navigator.pop(context, Report(
                        name:nameController.text,
                        date:dateController.text,
                        description:
                        descriptionController.text, images: [],
                      ));
                    }
                  }
                      :null,style:ElevatedButton.styleFrom(
                  primary:
                  mainColor,minimumSize:
                Size(343,48),),
                  child:
                  Text("Create Report"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}