import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:login_signup/screens/hindi/contents/contentsHindi.dart';
import 'package:login_signup/screens/hindi/matchhindi.dart';
import 'package:login_signup/screens/hindi/quizeasyhindi/contentsquizehindi.dart';
import 'package:login_signup/screens/hindi/quizhardhindi/contentshardhindi.dart';

class Dashpagehindi extends StatefulWidget {
  const Dashpagehindi({super.key});

  @override
  State<Dashpagehindi> createState() => _DashpageState();
}

class _DashpageState extends State<Dashpagehindi>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('डैशबोर्ड'),
        backgroundColor: const Color.fromARGB(255, 175, 214, 245),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            color: Colors.black45,
            iconSize: 30,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("एप्लिकेशन के बारे में"),
                    content: const Text(
                      "यह ऐप आपको मौलिक अधिकारों और कर्तव्यों पर आकर्षक क्विज़ के माध्यम से भारतीय संविधान के बारे में सीखने में मदद करता है।",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("ठीक है"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: Swiper(
              itemCount: _constitutionSlides.length,
              itemBuilder: (BuildContext context, int index) {
                final slide = _constitutionSlides[index];
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(slide['image']!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        slide['quote']!,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.white54,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
              autoplay: true,
              pagination: SwiperPagination(),
              control: SwiperControl(),
            ),
          ),
          // Main content
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/bg4.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                FadeTransition(
                  opacity: _animation,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStageButton(
                          context,
                          title: "सामग्री",
                          icon: Icons.video_library,
                          color: const Color.fromARGB(255, 139, 182, 204),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => Contentshindi(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        _buildStageButton(
                          context,
                          title: "चरण 1: आसान मोड",
                          icon: Icons.quiz,
                          color: const Color.fromARGB(255, 139, 182, 204),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => Contents1hindi(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        _buildStageButton(
                          context,
                          title: "चरण 2: कठिन मोड",
                          icon: Icons.quiz_outlined,
                          color: const Color.fromARGB(255, 139, 182, 204),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => Contents2hindi(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        // New Match Game Button
                        _buildStageButton(
                          context,
                          title: "मैच गेम",
                          icon: Icons.gamepad,
                          color: const Color.fromARGB(255, 139, 182, 204),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => MatchGameScreenHindi(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        /*// New Match Game Button
                        _buildStageButton(
                          context,
                          title: "परिदृश्य खेल",
                          icon: Icons.gamepad,
                          color: const Color.fromARGB(255, 139, 182, 204),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => MatchGameScreenHindi(),
                              ),
                            );
                          },
                        ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStageButton(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 30),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          shadowColor: Colors.black38,
        ),
      ),
    );
  }

  final List<Map<String, String>> _constitutionSlides = [
    {
      'image': 'assets/images/b1.jpg',
      'quote': '“कर लगाने की शक्ति नष्ट करने की शक्ति है।” - जॉन मार्शल',
    },
    {
      'image': 'assets/images/b1.jpg',
      'quote':
          '“कहीं भी अन्याय हर जगह न्याय के लिए खतरा है।” - मार्टिन लूथर किंग जूनियर',
    },
  ];
}
