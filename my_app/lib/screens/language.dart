import 'package:flutter/material.dart';
import 'package:login_signup/screens/hindi/homepage_screen_hindi.dart';
import 'homepage_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:ui'; // Import for BackdropFilter

class LanguageSelectionScreen extends StatelessWidget {
  // Signout function
  void signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hbg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          // Language selection UI
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decorative Icon
                Icon(
                  Icons.language,
                  size: 80,
                  color: Colors.blueAccent,
                ),
                SizedBox(height: 20),
                // Main Title
                Text(
                  'Select Language',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Roboto', // Use a custom font
                  ),
                ),
                SizedBox(height: 40),
                // English Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomepageScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.blueAccent.withOpacity(0.5),
                    elevation: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.language, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'English',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Hindi Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomepageScreenHindi(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.orangeAccent.withOpacity(0.5),
                    elevation: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.language, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'हिन्दी',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Positioned Logout Button
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () => signout(context),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: Colors.redAccent.withOpacity(0.5),
                elevation: 10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LanguageSelectionScreen(),
  ));
}
