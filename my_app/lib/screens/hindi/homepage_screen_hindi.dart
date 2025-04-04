import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/screens/hindi/ChatbotScreenHindi.dart';
import 'package:login_signup/screens/hindi/dashpageHindi.dart';
import 'package:login_signup/screens/language.dart';
import 'package:url_launcher/url_launcher.dart';

class HomepageScreenHindi extends StatefulWidget {
  const HomepageScreenHindi({super.key});

  @override
  State<HomepageScreenHindi> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreenHindi> {
  final user = FirebaseAuth.instance.currentUser;

  Future<Map<String, dynamic>> _getUserInfo() async {
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user!.uid)
          .get();
      final totalQuizzesCompleted =
          userDoc.data()?['totalQuizzesCompleted'] ?? 0;
      return {
        'username': userDoc.data()?['username'],
        'email': user!.email,
        'totalQuizzesCompleted': totalQuizzesCompleted,
      };
    }
    return {'username': null, 'email': null, 'totalQuizzesCompleted': 0};
  }

  void _showUserInfo() async {
    Map<String, dynamic> userInfo = await _getUserInfo();
    final totalQuizzesCompleted = userInfo['totalQuizzesCompleted'] as int;

    String level;
    Color progressColor;
    if (totalQuizzesCompleted < 20) {
      level = 'शुरुआती';
      progressColor = Colors.red;
    } else if (totalQuizzesCompleted < 50) {
      level = 'मध्यम';
      progressColor = Colors.orange;
    } else {
      level = 'प्रो';
      progressColor = Colors.green;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            "उपयोगकर्ता जानकारी",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 199, 167, 205),
                radius: 40,
                child: Text(
                  userInfo['username']?[0].toUpperCase() ?? '?',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'उपयोगकर्ता नाम: ${userInfo['username'] ?? "उपलब्ध नहीं"}',
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Text(
                'ईमेल: ${userInfo['email'] ?? "उपलब्ध नहीं"}',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Text(
                'क्विज़ पूर्ण स्तर: $level',
                style: TextStyle(
                  fontSize: 18,
                  color: progressColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: totalQuizzesCompleted / 30,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              ),
              const SizedBox(height: 10),
              Text(
                '$totalQuizzesCompleted क्विज़ पूर्ण किए',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Participation Certificate
              if (totalQuizzesCompleted >= 0)
                _buildCertificateLink(
                  'भागीदारी प्रमाणपत्र',
                  'https://docs.google.com/forms/d/e/1FAIpQLSdB_nfiXXQPDBbwHvv2Bv2U98JbhLYLB1-dGnfu5iJ1IrTjAQ/viewform',
                ),

              // Intermediate Certificate
              if (totalQuizzesCompleted >= 45)
                _buildCertificateLink(
                  'मध्यम प्रमाणपत्र',
                  'https://docs.google.com/forms/d/e/1FAIpQLSehMcMy_fbbELmPCb6l-OmKwyjlBCIld6Cbnq74oxHy8Kavmg/viewform',
                ),

              // Pro Certificate
              if (totalQuizzesCompleted >= 68)
                _buildCertificateLink(
                  'प्रो प्रमाणपत्र',
                  'https://yourprolink.com',
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "ठीक है",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        );
      },
    );
  }

// Helper function for generating certificate links
  Widget _buildCertificateLink(String title, String url) {
    return GestureDetector(
      onTap: () => launch(url),
      child: Row(
        children: [
          Icon(Icons.file_download, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  void _showCustomerSupport() {
    final String email = "sivasaran8667@gmail.com";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ग्राहक सहायता'),
          content: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'किसी भी प्रश्न के लिए, हमसे संपर्क करें: ',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch('mailto:$email');
                    },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('बंद करें'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LanguageSelectionScreen(),
              ),
            );
          },
        ),
        title: const Text('होम'),
        backgroundColor: const Color.fromARGB(255, 163, 115, 118),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreenHindi()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _showUserInfo,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hbg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'आरओआई  \n',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'आइए संविधान को सरल तरीके से सीखें',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (e) => const Dashpagehindi(),
                      ),
                    );
                  },
                  child: const Text("शुरू करें"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    backgroundColor: const Color.fromARGB(255, 199, 167, 205),
                    textStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Customer care support icon at the bottom right
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: _showCustomerSupport,
              child: Icon(Icons.support_agent),
              backgroundColor: const Color.fromARGB(255, 199, 167, 205),
            ),
          ),
        ],
      ),
    );
  }
}
