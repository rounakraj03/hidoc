import 'package:flutter/material.dart';

class DropdownMenuExample extends StatefulWidget {
  @override
  _DropdownMenuExampleState createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopupMenuButton<String>(
          icon: Icon(Icons.arrow_drop_down),
          onSelected: (String value) {
            setState(() {
              selectedOption = value;
            });
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: PopupMenuButton(icon: Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    setState(() {
                      selectedOption = value;
                    });
                    },
                  itemBuilder: (BuildContext context) {return [PopupMenuItem<String>(
                    value: 'pharma-services',
                    child: Text('For Pharma - Pharma Services'),
                  ),];}),
              ),
              PopupMenuItem<String>(
                value: 'pharma-services',
                child: Text('For Pharma - Pharma Services'),
              ),
              PopupMenuItem<String>(
                value: 'pharma-courses',
                child: Text('For Pharma - Pharma Courses'),
              ),
              PopupMenuItem<String>(
                value: 'doctors',
                child: Text('For Doctors'),
              ),
            ];
          },
        ),
        SizedBox(height: 10),
        Text('Selected option: $selectedOption'),
      ],
    );
  }
}
