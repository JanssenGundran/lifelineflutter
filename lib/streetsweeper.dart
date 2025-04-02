import 'package:flutter/material.dart';
import 'jobboard.dart';
import 'contact.dart';
import 'home.dart';

class FormScreen extends StatefulWidget {
  final String jobTitle;

  FormScreen({required this.jobTitle});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  List<String> pendingApplications = [];
  List<String> approvedApplications = [];

  void submitApplication() {
    setState(() {
      if (nameController.text.isNotEmpty) {
        pendingApplications.add(nameController.text);
      }
    });
    nameController.clear();
    emailController.clear();
    contactController.clear();
    dobController.clear();
  }

  void approveApplication(String applicantName) {
    setState(() {
      pendingApplications.remove(applicantName);
      approvedApplications.add(applicantName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9f8),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        toolbarHeight: 100,
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/L.png',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'LIFELINE PAMPANGA',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu, color: Colors.black),
            onSelected: (String choice) {
              if (choice == 'Home') {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => HomeScreen()));
              } else if (choice == 'Find A Job') {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => JobScreen()));
              } else if (choice == 'Contact Us') {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ContactScreen()));
              }
            },
            itemBuilder: (BuildContext context) {
              return ['Home', 'Find A Job', 'Contact Us'].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                widget.jobTitle, 
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Colors.grey,
                      offset: Offset(1.5, 1.5),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildLabel('NAME'),
              _buildTextField(nameController),
              _buildLabel('EMAIL'),
              _buildTextField(emailController),
              _buildLabel('CONTACT NO.'),
              _buildTextField(contactController),
              _buildLabel('DATE OF BIRTH'),
              _buildTextField(dobController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitApplication,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(
                    children: [
                      _buildTableCell('PENDING'),
                      _buildTableCell('APPROVED'),
                    ],
                  ),
                  ...pendingApplications.map((name) {
                    return TableRow(children: [
                      _buildTableCell(name),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () => approveApplication(name),
                          child: Text("Approve"),
                        ),
                      ),
                    ]);
                  }).toList(),
                  ...approvedApplications.map((name) {
                    return TableRow(children: [
                      _buildTableCell(''),
                      _buildTableCell(name),
                    ]);
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[700],
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildTableCell(String label) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
