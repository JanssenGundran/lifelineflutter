import 'package:flutter/material.dart';
import 'jobboard.dart';
import 'home.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        toolbarHeight: 80,
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
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Text(
              'Contact Information',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Call us: +0962 2191 2191',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Email Us: lifelinepampanga@gmail.com',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Contact us on Social Media',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            _buildSocialMediaButton('Instagram', Icons.camera_alt),
            _buildSocialMediaButton('Telegram', Icons.send),
            _buildSocialMediaButton('Facebook', Icons.facebook),
            _buildSocialMediaButton('WhatsApp', Icons.chat),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[500],
        child: Container(height: 50),
      ),
    );
  }

  Widget _buildSocialMediaButton(String text, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.black26),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 25, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 15,
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
