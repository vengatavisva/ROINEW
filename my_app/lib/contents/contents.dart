import 'package:flutter/material.dart';
import 'package:login_signup/contents/pt_1.dart';
import 'package:login_signup/contents/pt_10.dart';
import 'package:login_signup/contents/pt_11.dart';
import 'package:login_signup/contents/pt_12.dart';
import 'package:login_signup/contents/pt_13.dart';
import 'package:login_signup/contents/pt_14.dart';
import 'package:login_signup/contents/pt_14A.dart';
import 'package:login_signup/contents/pt_15.dart';
import 'package:login_signup/contents/pt_16.dart';
import 'package:login_signup/contents/pt_17.dart';
import 'package:login_signup/contents/pt_18.dart';
import 'package:login_signup/contents/pt_19.dart';
import 'package:login_signup/contents/pt_2.dart';
import 'package:login_signup/contents/pt_20.dart';
import 'package:login_signup/contents/pt_21.dart';
import 'package:login_signup/contents/pt_22.dart';
import 'package:login_signup/contents/pt_3.dart';
import 'package:login_signup/contents/pt_4.dart';
import 'package:login_signup/contents/pt_4A.dart';
import 'package:login_signup/contents/pt_5.dart';
import 'package:login_signup/contents/pt_6.dart';
import 'package:login_signup/contents/pt_7.dart';
import 'package:login_signup/contents/pt_8.dart';
import 'package:login_signup/contents/pt_9.dart';
import 'package:login_signup/contents/s1.dart';
import 'package:login_signup/contents/s10.dart';
import 'package:login_signup/contents/s11.dart';
import 'package:login_signup/contents/s12.dart';
import 'package:login_signup/contents/s2.dart';
import 'package:login_signup/contents/s3.dart';
import 'package:login_signup/contents/s4.dart';
import 'package:login_signup/contents/s5.dart';
import 'package:login_signup/contents/s6.dart';
import 'package:login_signup/contents/s7.dart';
import 'package:login_signup/contents/s8.dart';
import 'package:login_signup/contents/s9.dart';
import 'package:login_signup/screens/dashpage.dart';

class Contents extends StatefulWidget {
  const Contents({super.key});

  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
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
        '/part1': (context) => VideoPlayerScreen1(),
        '/part2': (context) => VideoPlayerScreen2(),
        '/part3': (context) => VideoPlayerScreen3(),
        '/part4': (context) => VideoPlayerScreen4(),
        '/part4A': (context) => VideoPlayerScreen4A(),
        '/part5': (context) => VideoPlayerScreen5(),
        '/part6': (context) => VideoPlayerScreen6(),
        '/part7': (context) => VideoPlayerScreen7(),
        '/part8': (context) => VideoPlayerScreen8(),
        '/part9': (context) => VideoPlayerScreen9(),
        '/part10': (context) => VideoPlayerScreen10(),
        '/part11': (context) => VideoPlayerScreen11(),
        '/part12': (context) => VideoPlayerScreen12(),
        '/part13': (context) => VideoPlayerScreen13(),
        '/part14': (context) => VideoPlayerScreen14(),
        '/part14A': (context) => VideoPlayerScreen14A(),
        '/part15': (context) => VideoPlayerScreen15(),
        '/part16': (context) => VideoPlayerScreen16(),
        '/part17': (context) => VideoPlayerScreen17(),
        '/part18': (context) => VideoPlayerScreen18(),
        '/part19': (context) => VideoPlayerScreen19(),
        '/part20': (context) => VideoPlayerScreen20(),
        '/part21': (context) => VideoPlayerScreen21(),
        '/part22': (context) => VideoPlayerScreen22(),
        '/schedule1': (context) => VideoPlayerScreenS1(),
        '/schedule2': (context) => VideoPlayerScreenS2(),
        '/schedule3': (context) => VideoPlayerScreenS3(),
        '/schedule4': (context) => VideoPlayerScreenS4(),
        '/schedule5': (context) => VideoPlayerScreenS5(),
        '/schedule6': (context) => VideoPlayerScreenS6(),
        '/schedule7': (context) => VideoPlayerScreenS7(),
        '/schedule8': (context) => VideoPlayerScreenS8(),
        '/schedule9': (context) => VideoPlayerScreenS9(),
        '/schedule10': (context) => VideoPlayerScreenS10(),
        '/schedule11': (context) => VideoPlayerScreenS11(),
        '/schedule12': (context) => VideoPlayerScreenS12(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contents : video'),
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
