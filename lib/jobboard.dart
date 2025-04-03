import 'package:flutter/material.dart';
import 'streetsweeper.dart';
import 'contact.dart';
import 'home.dart';

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final Map<String, int> jobSlots = {
    'Street Sweeper': 5,
    'Barangay Tanod': 3,
    'Garbage Collector': 4,
  };

  final List<Map<String, String>> pendingApplications = [];
  final List<Map<String, String>> approvedApplications = [];

  void _applyJob(String jobTitle, Map<String, String> applicationData) {
    setState(() {
      pendingApplications.add(applicationData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        toolbarHeight: 100,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/L.png',
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              'LIFELINE PAMPANGA',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu, color: Colors.black),
            onSelected: (String choice) {
              if (choice == 'Home') {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              } else if (choice == 'Find A Job') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JobScreen()));
              } else if (choice == 'Contact Us') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactScreen()));
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Find A Job',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: jobSlots.keys
                  .map((job) => _buildJobTile(context, job))
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[500],
        child: SizedBox(height: 50),
      ),
    );
  }

  Widget _buildJobTile(BuildContext context, String jobTitle) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            '$jobTitle (Slots: ${jobSlots[jobTitle]})',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          trailing: CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(Icons.arrow_forward, color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormScreen(
                  jobTitle: jobTitle,
                  onApply: (applicationData) =>
                      _applyJob(jobTitle, applicationData),
                  pendingApplications: pendingApplications,
                  approvedApplications: approvedApplications,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
