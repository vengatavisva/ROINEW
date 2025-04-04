import 'package:flutter/material.dart';
import 'package:login_signup/quizeasy/pt_1.dart';
import 'package:login_signup/quizeasy/pt_10.dart';
import 'package:login_signup/quizeasy/pt_11.dart';
import 'package:login_signup/quizeasy/pt_12.dart';
import 'package:login_signup/quizeasy/pt_13.dart';
import 'package:login_signup/quizeasy/pt_14.dart';
import 'package:login_signup/quizeasy/pt_14A.dart';
import 'package:login_signup/quizeasy/pt_15.dart';
import 'package:login_signup/quizeasy/pt_16.dart';
import 'package:login_signup/quizeasy/pt_17.dart';
import 'package:login_signup/quizeasy/pt_18.dart';
import 'package:login_signup/quizeasy/pt_19.dart';
import 'package:login_signup/quizeasy/pt_2.dart';
import 'package:login_signup/quizeasy/pt_20.dart';
import 'package:login_signup/quizeasy/pt_21.dart';
import 'package:login_signup/quizeasy/pt_22.dart';
import 'package:login_signup/quizeasy/pt_3.dart';
import 'package:login_signup/quizeasy/pt_4.dart';
import 'package:login_signup/quizeasy/pt_4A.dart';
import 'package:login_signup/quizeasy/pt_5.dart';
import 'package:login_signup/quizeasy/pt_6.dart';
import 'package:login_signup/quizeasy/pt_7.dart';
import 'package:login_signup/quizeasy/pt_8.dart';
import 'package:login_signup/quizeasy/pt_9.dart';
import 'package:login_signup/quizeasy/s1.dart';
import 'package:login_signup/quizeasy/s10.dart';
import 'package:login_signup/quizeasy/s11.dart';
import 'package:login_signup/quizeasy/s12.dart';
import 'package:login_signup/quizeasy/s2.dart';
import 'package:login_signup/quizeasy/s3.dart';
import 'package:login_signup/quizeasy/s4.dart';
import 'package:login_signup/quizeasy/s5.dart';
import 'package:login_signup/quizeasy/s6.dart';
import 'package:login_signup/quizeasy/s7.dart';
import 'package:login_signup/quizeasy/s8.dart';
import 'package:login_signup/quizeasy/s9.dart';
import 'package:login_signup/screens/dashpage.dart';

class Contents1 extends StatefulWidget {
  const Contents1({super.key});

  @override
  State<Contents1> createState() => _ContentsState();
}

class _ContentsState extends State<Contents1> {
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
        '/part1': (context) => QuizScreen1(),
        '/part2': (context) => QuizScreen2(),
        '/part3': (context) => QuizScreen3(),
        '/part4': (context) => QuizScreen4(),
        '/part4A': (context) => QuizScreen4A(),
        '/part5': (context) => QuizScreen5(),
        '/part6': (context) => QuizScreen6(),
        '/part7': (context) => QuizScreen7(),
        '/part8': (context) => QuizScreen8(),
        '/part9': (context) => QuizScreen9(),
        '/part10': (context) => QuizScreen10(),
        '/part11': (context) => QuizScreen11(),
        '/part12': (context) => QuizScreen12(),
        '/part13': (context) => QuizScreen13(),
        '/part14': (context) => QuizScreen14(),
        '/part14A': (context) => QuizScreen14A(),
        '/part15': (context) => QuizScreen15(),
        '/part16': (context) => QuizScreen16(),
        '/part17': (context) => QuizScreen17(),
        '/part18': (context) => QuizScreen18(),
        '/part19': (context) => QuizScreen19(),
        '/part20': (context) => QuizScreen20(),
        '/part21': (context) => QuizScreen21(),
        '/part22': (context) => QuizScreen22(),
        '/schedule1': (context) => QuizScreenS1(),
        '/schedule2': (context) => QuizScreenS2(),
        '/schedule3': (context) => QuizScreenS3(),
        '/schedule4': (context) => QuizScreenS4(),
        '/schedule5': (context) => QuizScreenS5(),
        '/schedule6': (context) => QuizScreenS6(),
        '/schedule7': (context) => QuizScreenS7(),
        '/schedule8': (context) => QuizScreenS8(),
        '/schedule9': (context) => QuizScreenS9(),
        '/schedule10': (context) => QuizScreenS10(),
        '/schedule11': (context) => QuizScreenS11(),
        '/schedule12': (context) => QuizScreenS12(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contents : Easy'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Dashpage()), // Replace with your actual Dashpage class
              );
            },
          ),
        ),
        body: Stack(
          children: [
            // Background image
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
