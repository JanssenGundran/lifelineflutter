import 'package:flutter/material.dart';
import 'jobboard.dart';
import 'contact.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        toolbarHeight: 80,
        title: Text(
          'LIFELINE PAMPANGA',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/L.png', fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Empowering Communities,\nOne Job at a Time',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(context, 'Find A Job', JobScreen()),
                SizedBox(width: 10),
                _buildButton(context, 'Contact Us', ContactScreen()),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[500],
        child: Container(height: 50),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget destination) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[500],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
