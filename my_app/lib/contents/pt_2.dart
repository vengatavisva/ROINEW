import 'package:flutter/material.dart';
import 'package:login_signup/quizeasy/pt_2.dart';
import 'package:video_player/video_player.dart';

const String videoUrl =
    'https://firebasestorage.googleapis.com/v0/b/myappconsi.appspot.com/o/p2.mp4?alt=media&token=a2fb4840-6af4-4672-be00-35f6cc255256';

class VideoPlayerScreen2 extends StatefulWidget {
  @override
  _VideoPlayerScreen2State createState() => _VideoPlayerScreen2State();
}

class _VideoPlayerScreen2State extends State<VideoPlayerScreen2>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  bool _isVideoLoaded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _loadVideo() {
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isVideoLoaded = true;
        });
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            setState(() {
              _controller.pause();
            });
            _showQuizPromptDialog();
          }
        });
      });
  }

  void _showQuizPromptDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Time!'),
          content: Text(
              'You have completed the video. Would you like to take the quiz now or later?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Later'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToQuizScreen();
              },
              child: Text('Take Quiz Now'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToQuizScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizScreen2()),
    );
  }

  void _showDescriptionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Video Description'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '''Description:

Welcome to our in-depth exploration of Part II of the Indian Constitution, which deals with Citizenship. In this video, we break down the essential aspects of Indian citizenship as outlined in the Constitution, helping you understand who qualifies as a citizen and the rights and responsibilities that come with it.

In this video, we will cover:

Article 5: Citizenship at the Commencement of the Constitution
Learn about the criteria for citizenship at the time the Constitution was adopted in 1950. Understand who was considered a citizen based on birth, parentage, and residency.

Article 6: Citizenship for Migrants from Pakistan
Discover the provisions for individuals who migrated from Pakistan to India before 1950 and how their citizenship status was determined.

Article 7: Citizenship for Returnees from Pakistan
Explore the process for individuals who moved to Pakistan after 1950 and later returned to India, including the requirements to regain citizenship.

Article 8: Citizenship for Persons of Indian Origin Residing Abroad
Understand the rights of Indian origin persons living abroad and the conditions under which they can retain or acquire Indian citizenship.

Article 9: Loss of Citizenship for Voluntarily Acquiring Foreign Citizenship
Learn about the automatic loss of Indian citizenship for those who voluntarily acquire citizenship of another country.

Article 10: Continuance of Citizenship Rights
Get insights into how citizenship rights are maintained and the legal framework ensuring their continuation.

Article 11: Parliament’s Role in Regulating Citizenship
Discover the powers of Parliament to regulate and make laws regarding the acquisition, termination, and management of citizenship.

Key Takeaways:

Definition of Citizenship: Who qualifies as a citizen under various circumstances.
Regulations and Procedures: How citizenship is acquired, retained, and lost.
Legislative Power: The role of Parliament in shaping citizenship laws.
''',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    if (_isVideoLoaded) {
      _controller.removeListener(() {});
      _controller.dispose();
    }
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Part II: Citizenship'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: _showDescriptionDialog,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFE0F7FA), Color(0xFFE1BEE7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Center(
                  child: !_isVideoLoaded
                      ? ScaleTransition(
                          scale: _animation,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blueAccent,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 8.0,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                            ),
                            onPressed: _loadVideo,
                            child: Text(
                              'Play Video',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              VideoPlayer(_controller),
                              VideoProgressIndicator(
                                _controller,
                                allowScrubbing: true,
                                padding: EdgeInsets.all(8.0),
                                colors: VideoProgressColors(
                                  playedColor: Colors.blue,
                                  backgroundColor: Colors.grey,
                                  bufferedColor: Colors.lightBlue,
                                ),
                              ),
                              _buildControls(),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: _isVideoLoaded
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            )
          : null,
    );
  }

  // Custom video controls
  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.replay_10),
          onPressed: () {
            final currentPosition = _controller.value.position;
            final rewindPosition =
                Duration(seconds: currentPosition.inSeconds - 10);
            _controller.seekTo(rewindPosition);
          },
        ),
        IconButton(
          icon: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.forward_10),
          onPressed: () {
            final currentPosition = _controller.value.position;
            final forwardPosition =
                Duration(seconds: currentPosition.inSeconds + 10);
            _controller.seekTo(forwardPosition);
          },
        ),
      ],
    );
  }
}
