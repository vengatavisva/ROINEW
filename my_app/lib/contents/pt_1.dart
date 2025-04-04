import 'package:flutter/material.dart';
import 'package:login_signup/quizeasy/pt_1.dart';
import 'package:video_player/video_player.dart';

const String videoUrl =
    'https://firebasestorage.googleapis.com/v0/b/myappconsi.appspot.com/o/pt_1English.mp4?alt=media&token=0fbf9a2b-1691-4514-adb4-b5c3f9654e60';

class VideoPlayerScreen1 extends StatefulWidget {
  @override
  _VideoPlayerScreen1State createState() => _VideoPlayerScreen1State();
}

class _VideoPlayerScreen1State extends State<VideoPlayerScreen1>
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
      MaterialPageRoute(builder: (context) => QuizScreen1()),
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
                  '''Video Description:

Welcome to our series on the Constitution of India! In this video, we explore Part I: Union and Its Territory, which lays the foundational framework for the country's territorial boundaries and the formation of states and union territories.

Key Highlights:

Overview of Part I: Introduction to the Union and its Territory, highlighting its significance in defining the geographical boundaries of India.

Article 1: The Union of India: Explains that India is a Union of States, covering the meaning of terms like "territory of India" which includes states, union territories, and other areas acquired by India.

Article 2: Admission and Establishment of New States: Discusses how Parliament can admit new states into the Union or establish new states on terms and conditions it deems fit.

Article 3: Formation of New States and Alteration of Areas: Explores the procedures for forming new states, altering boundaries, renaming states, and the role of Parliament in these processes.

Article 4: Laws Made Under Articles 2 and 3: Details how laws made for admitting or altering states are not considered constitutional amendments and can be passed by a simple majority.

Interactive Learning: Throughout the video, we'll use engaging visuals and easy-to-understand language to help you grasp the complex concepts of Part I. There will be quizzes and interactive elements to test your understanding along the way.

Relevance and Current Implications: We'll also look at real-life examples, such as the reorganization of states like Telangana, Jammu & Kashmir, and others, to showcase how these constitutional provisions have been applied in modern India.

Conclusion: Summarizing the importance of Part I in maintaining the integrity and unity of India as a nation.
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
        title: Text('Part I: Union and Its Territory'),
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
          // Lighter gradient background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE0F7FA),
                    Color(0xFFE1BEE7)
                  ], // Custom lighter colors
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
                              backgroundColor:
                                  Colors.white, // Lighter background
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
