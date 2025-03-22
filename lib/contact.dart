import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
            ContactCard(),
            SizedBox(height: 20),
            Text(
              'Contact us on Social Media',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            SocialMediaTile(
                icon: Icons.camera_alt,
                name: 'Instagram',
                url: 'https://www.instagram.com/'),
            SocialMediaTile(
                icon: Icons.send, name: 'Telegram', url: 'https://telegram.org/'),
            SocialMediaTile(
                icon: Icons.facebook,
                name: 'Facebook',
                url: 'https://www.facebook.com/'),
            SocialMediaTile(
                icon: Icons.chat, name: 'WhatsApp', url: 'https://www.whatsapp.com/'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[500],
        child: Container(height: 50),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactRow(icon: Icons.phone, text: 'Call Us: +0962 2191 2191'),
          SizedBox(height: 15),
          ContactRow(
              icon: Icons.email,
              text: 'Email Us: lifelinepampanga@gmail.com'),
        ],
      ),
    );
  }
}

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  ContactRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class SocialMediaTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final String url;

  SocialMediaTile({required this.icon, required this.name, required this.url});

  void _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.black),
        title: Text(name, style: TextStyle(fontSize: 18)),
        trailing: Icon(Icons.arrow_circle_right_sharp, color: Colors.red),
        onTap: _launchURL,
      ),
    );
  }
}
