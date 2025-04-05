import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/screens/ChatbotScreen.dart';
import 'package:login_signup/screens/dashpage.dart';
import 'package:login_signup/screens/language.dart';
import 'package:login_signup/screens/helpline_info_screen.dart';
import 'package:login_signup/screens/FinesAndDutiesScreen.dart'; // Add this
import 'package:url_launcher/url_launcher.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen>
    with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _showHelpline = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _showHelpline = true;
      });
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
      level = 'Beginner';
      progressColor = Colors.red;
    } else if (totalQuizzesCompleted < 50) {
      level = 'Intermediate';
      progressColor = Colors.orange;
    } else {
      level = 'Pro';
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
            "User Information",
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
                'Username: ${userInfo['username'] ?? "No username available"}',
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Text(
                'Email: ${userInfo['email'] ?? "No email available"}',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Text(
                'Quiz Completion Level: $level',
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
                '$totalQuizzesCompleted quizzes completed',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              if (totalQuizzesCompleted >= 0)
                _buildCertificateLink(
                  'Participation Certificate',
                  'https://docs.google.com/forms/d/e/1FAIpQLSdB_nfiXXQPDBbwHvv2Bv2U98JbhLYLB1-dGnfu5iJ1IrTjAQ/viewform',
                ),
              if (totalQuizzesCompleted >= 45)
                _buildCertificateLink(
                  'Intermediate Certificate',
                  'https://docs.google.com/forms/d/e/1FAIpQLSehMcMy_fbbELmPCb6l-OmKwyjlBCIld6Cbnq74oxHy8Kavmg/viewform',
                ),
              if (totalQuizzesCompleted >= 68)
                _buildCertificateLink(
                  'Pro Certificate',
                  'https://yourprolink.com',
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:
                  const Text("OK", style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        );
      },
    );
  }

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
          title: Text('Customer Support'),
          content: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'For any queries, contact us at: ',
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
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
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
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 163, 115, 118),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
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
                        text: 'ROI  \n',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Let\'s learn the constitution in a simple manner',
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
                        builder: (e) => const Dashpage(),
                      ),
                    );
                  },
                  child: const Text("Get Started"),
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
          if (_showHelpline)
            Positioned(
              top: kToolbarHeight - 20,
              right: 16,
              child: SlideTransition(
                position: _slideAnimation,
                child: Row(
                  children: [
                    _BlinkingFinesButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FinesAndDutiesScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    _BlinkingHelplineButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelplineInfoScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
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

class _BlinkingHelplineButton extends StatefulWidget {
  final VoidCallback onTap;

  const _BlinkingHelplineButton({required this.onTap});

  @override
  State<_BlinkingHelplineButton> createState() =>
      _BlinkingHelplineButtonState();
}

class _BlinkingHelplineButtonState extends State<_BlinkingHelplineButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _blinkController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.3).animate(
      CurvedAnimation(parent: _blinkController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: const [
            Icon(Icons.help_outline, size: 30, color: Colors.white),
            SizedBox(height: 4),
            Text(
              "Helpline",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 3,
                    color: Colors.black,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BlinkingFinesButton extends StatefulWidget {
  final VoidCallback onTap;

  const _BlinkingFinesButton({required this.onTap});

  @override
  State<_BlinkingFinesButton> createState() => _BlinkingFinesButtonState();
}

class _BlinkingFinesButtonState extends State<_BlinkingFinesButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _blinkController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.3).animate(
      CurvedAnimation(parent: _blinkController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: const [
            Icon(Icons.warning_amber, size: 30, color: Colors.white),
            SizedBox(height: 4),
            Text(
              "Fines",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 3,
                    color: Colors.black,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
