import 'package:flutter/material.dart';
import 'package:login_signup/quizhard/pt_1h.dart';
import 'package:login_signup/quizhard/pt_10h.dart';
import 'package:login_signup/quizhard/pt_11h.dart';
import 'package:login_signup/quizhard/pt_12h.dart';
import 'package:login_signup/quizhard/pt_13h.dart';
import 'package:login_signup/quizhard/pt_14h.dart';
import 'package:login_signup/quizhard/pt_14A.dart';
import 'package:login_signup/quizhard/pt_15h.dart';
import 'package:login_signup/quizhard/pt_16h.dart';
import 'package:login_signup/quizhard/pt_17h.dart';
import 'package:login_signup/quizhard/pt_18h.dart';
import 'package:login_signup/quizhard/pt_19h.dart';
import 'package:login_signup/quizhard/pt_2h.dart';
import 'package:login_signup/quizhard/pt_20h.dart';
import 'package:login_signup/quizhard/pt_21h.dart';
import 'package:login_signup/quizhard/pt_22h.dart';
import 'package:login_signup/quizhard/pt_3h.dart';
import 'package:login_signup/quizhard/pt_4h.dart';
import 'package:login_signup/quizhard/pt_4Ah.dart';
import 'package:login_signup/quizhard/pt_5h.dart';
import 'package:login_signup/quizhard/pt_6h.dart';
import 'package:login_signup/quizhard/pt_7h.dart';
import 'package:login_signup/quizhard/pt_8h.dart';
import 'package:login_signup/quizhard/pt_9h.dart';
import 'package:login_signup/quizhard/s1h.dart';
import 'package:login_signup/quizhard/s10h.dart';
import 'package:login_signup/quizhard/s11h.dart';
import 'package:login_signup/quizhard/s12h.dart';
import 'package:login_signup/quizhard/s2h.dart';
import 'package:login_signup/quizhard/s3h.dart';
import 'package:login_signup/quizhard/s4h.dart';
import 'package:login_signup/quizhard/s5h.dart';
import 'package:login_signup/quizhard/s6h.dart';
import 'package:login_signup/quizhard/s7h.dart';
import 'package:login_signup/quizhard/s8h.dart';
import 'package:login_signup/quizhard/s9h.dart';
import 'package:login_signup/screens/dashpage.dart';

class Contents2 extends StatefulWidget {
  const Contents2({super.key});

  @override
  State<Contents2> createState() => _ContentsState();
}

class _ContentsState extends State<Contents2> {
  final List<Map<String, String>> contents = [
    {'title': 'Part I: Union and its Territory', 'route': '/part1'},
    {'title': 'Part II: Citizenship', 'route': '/part2'},
    {'title': 'Part III: Fundamental Rights', 'route': '/part3'},
    {
      'title': 'Part IV: Directive Principles of State Policy',
      'route': '/part4'
    },
    {'title': 'Part IV-A: Fundamental Duties', 'route': '/part4A'},
    {'title': 'Part V: The Union', 'route': '/part5'},
    {'title': 'Part VI: The States', 'route': '/part6'},
    {
      'title':
          'Part VII: States in the B-Part of the First Schedule (repealed)',
      'route': '/part7'
    },
    {'title': 'Part VIII: The Union Territories', 'route': '/part8'},
    {'title': 'Part IX: The Panchayats', 'route': '/part9'},
    {'title': 'Part IX-A: The Municipalities', 'route': '/part9A'},
    {'title': 'Part X: The Scheduled and Tribal Areas', 'route': '/part10'},
    {
      'title': 'Part XI: Relations between the Union and the States',
      'route': '/part11'
    },
    {
      'title': 'Part XII: Finance, Property, Contracts, and Suits',
      'route': '/part12'
    },
    {
      'title':
          'Part XIII: Trade, Commerce, and Intercourse within the Territory of India',
      'route': '/part13'
    },
    {
      'title': 'Part XIV: Services under the Union and the States',
      'route': '/part14'
    },
    {'title': 'Part XIV-A: Tribunals', 'route': '/part14A'},
    {'title': 'Part XV: Elections', 'route': '/part15'},
    {
      'title': 'Part XVI: Special Provisions relating to certain classes',
      'route': '/part16'
    },
    {'title': 'Part XVII: Official Language', 'route': '/part17'},
    {'title': 'Part XVIII: Emergency Provisions', 'route': '/part18'},
    {'title': 'Part XIX: Miscellaneous', 'route': '/part19'},
    {'title': 'Part XX: Amendment of the Constitution', 'route': '/part20'},
    {
      'title': 'Part XXI: Temporary, Transitional, and Special Provisions',
      'route': '/part21'
    },
    {
      'title': 'Part XXII: Short title, commencement, and repeal',
      'route': '/part22'
    },
    {
      'title': 'Schedule I: Territories of the Union and States',
      'route': '/schedule1'
    },
    {'title': 'Schedule II: Oaths and Affirmations', 'route': '/schedule2'},
    {
      'title': 'Schedule III: Forms of Oaths and Affirmations',
      'route': '/schedule3'
    },
    {
      'title': 'Schedule IV: Allocation of Seats in the Rajya Sabha',
      'route': '/schedule4'
    },
    {
      'title':
          'Schedule V: Provisions relating to the Administration and Control of Scheduled Areas and Tribal Areas',
      'route': '/schedule5'
    },
    {
      'title':
          'Schedule VI: Provisions relating to the Administration of Tribal Areas in the States of Assam, Meghalaya, Tripura, and Mizoram',
      'route': '/schedule6'
    },
    {
      'title':
          'Schedule VII: Distribution of Powers and Responsibilities between the Union and the States',
      'route': '/schedule7'
    },
    {'title': 'Schedule VIII: Languages', 'route': '/schedule8'},
    {
      'title': 'Schedule IX: Laws Providing for the Acquisition of Estates',
      'route': '/schedule9'
    },
    {'title': 'Schedule X: Anti-defection Act', 'route': '/schedule10'},
    {
      'title':
          'Schedule XI: Powers, Authority, and Responsibilities of Panchayats',
      'route': '/schedule11'
    },
    {
      'title':
          'Schedule XII: Powers, Authority, and Responsibilities of Municipalities',
      'route': '/schedule12'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Constitution App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/part1': (context) => QuizScreen1h(),
        '/part2': (context) => QuizScreen2h(),
        '/part3': (context) => QuizScreen3h(),
        '/part4': (context) => QuizScreen4h(),
        '/part4A': (context) => QuizScreen4Ah(),
        '/part5': (context) => QuizScreen5h(),
        '/part6': (context) => QuizScreen6h(),
        '/part7': (context) => QuizScreen7h(),
        '/part8': (context) => QuizScreen8h(),
        '/part9': (context) => QuizScreen9h(),
        '/part10': (context) => QuizScreen10h(),
        '/part11': (context) => QuizScreen11h(),
        '/part12': (context) => QuizScreen12h(),
        '/part13': (context) => QuizScreen13h(),
        '/part14': (context) => QuizScreen14h(),
        '/part14A': (context) => QuizScreen14Ah(),
        '/part15': (context) => QuizScreen15h(),
        '/part16': (context) => QuizScreen16h(),
        '/part17': (context) => QuizScreen17h(),
        '/part18': (context) => QuizScreen18h(),
        '/part19': (context) => QuizScreen19h(),
        '/part20': (context) => QuizScreen20h(),
        '/part21': (context) => QuizScreen21h(),
        '/part22': (context) => QuizScreen22h(),
        '/schedule1': (context) => QuizScreenS1h(),
        '/schedule2': (context) => QuizScreenS2h(),
        '/schedule3': (context) => QuizScreenS3h(),
        '/schedule4': (context) => QuizScreenS4h(),
        '/schedule5': (context) => QuizScreenS5h(),
        '/schedule6': (context) => QuizScreenS6h(),
        '/schedule7': (context) => QuizScreenS7h(),
        '/schedule8': (context) => QuizScreenS8h(),
        '/schedule9': (context) => QuizScreenS9h(),
        '/schedule10': (context) => QuizScreenS10h(),
        '/schedule11': (context) => QuizScreenS11h(),
        '/schedule12': (context) => QuizScreenS12h(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contents : Hard'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Dashpage()),
              );
            },
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg4.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Scrollbar(
              child: ListView.builder(
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, contents[index]['route']!);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white.withOpacity(0.8),
                      shadowColor: Colors.black54,
                      elevation: 8,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: ListTile(
                        title: Text(
                          contents[index]['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
