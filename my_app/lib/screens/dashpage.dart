import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:login_signup/contents/contents.dart';
import 'package:login_signup/quizeasy/contentsquize.dart';
import 'package:login_signup/quizhard/contentsquizh.dart';
import 'package:login_signup/screens/match.dart';

class Dashpage extends StatefulWidget {
  const Dashpage({super.key});

  @override
  State<Dashpage> createState() => _DashpageState();
}

class _DashpageState extends State<Dashpage>
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
        title: const Text('Dashboard'),
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
                    title: const Text("About the App"),
                    content: const Text(
                      "This app helps you learn about the Constitution of India through engaging quizzes on Fundamental Rights and Duties.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"),
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
                          title: "Contents",
                          icon: Icons.video_library,
                          color: const Color.fromARGB(255, 139, 182, 204),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => Contents(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        _buildStageButton(
                          context,
                          title: "Stage 1 : Easy Mode",
                          icon: Icons.quiz,
                          color: const Color.fromARGB(255, 139, 182, 204),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => Contents1(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        _buildStageButton(
                          context,
                          title: "Stage 2 : Hard Mode",
                          icon: Icons.quiz_outlined,
                          color: const Color.fromARGB(255, 139, 182, 204),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => Contents2(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        // New Match Game Button
                        _buildStageButton(
                          context,
                          title: "Match Game",
                          icon: Icons.gamepad,
                          color: const Color.fromARGB(255, 139, 182, 204),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => MatchGameScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        // New Match Game Button
                        /*_buildStageButton(
                          context,
                          title: "Scenario game",
                          icon: Icons.gamepad,
                          color: const Color.fromARGB(255, 139, 182, 204),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => MatchGameScreen(),
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
      'quote': '“The power to tax is the power to destroy.” - John Marshall',
    },
    {
      'image': 'assets/images/b1.jpg',
      'quote':
          '“Injustice anywhere is a threat to justice everywhere.” - Martin Luther King Jr.',
    },
  ];
}
