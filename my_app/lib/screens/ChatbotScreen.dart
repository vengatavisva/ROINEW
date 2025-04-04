import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final CollectionReference _messagesCollection =
      FirebaseFirestore.instance.collection('messages');
  final CollectionReference _feedbackCollection =
      FirebaseFirestore.instance.collection('feedback');

  @override
  void initState() {
    super.initState();
    _sendIntroMessage();
  }

  void _sendIntroMessage() {
    _messagesCollection.add({
      'text':
          'Welcome to the ChatBot! This bot is here to answer your questions about the Constitution and provide technical support.',
      'createdAt': FieldValue.serverTimestamp(),
      'isUser': false,
    });
  }

  void _sendMessage() {
    String userMessage = _controller.text.trim();
    if (userMessage.isNotEmpty) {
      _messagesCollection.add({
        'text': userMessage,
        'createdAt': FieldValue.serverTimestamp(),
        'isUser': true,
      });

      String replyMessage = _getReplyMessage(userMessage);
      if (replyMessage.isNotEmpty) {
        _messagesCollection.add({
          'text': replyMessage,
          'createdAt': FieldValue.serverTimestamp(),
          'isUser': false,
        });
      }

      _controller.clear();
    }
  }

  String _getReplyMessage(String userMessage) {
    switch (userMessage.toLowerCase()) {
      case "hello":
        return "Hi there! How can I assist you today?";
      case "what is your name?":
        return "I'm your virtual assistant!";
      case "how are you?":
        return "I'm just a program, but I'm doing great!";
      case "what is the constitution of india?":
        return "The Constitution of India is the supreme law of India that outlines the framework for the political principles, procedures, and powers of government institutions, as well as the fundamental rights and duties of citizens.";
      default:
        return "Sorry, I didn't understand that.";
    }
  }

  void _clearMessages() async {
    final snapshot = await _messagesCollection.get();
    for (var doc in snapshot.docs) {
      await _messagesCollection.doc(doc.id).delete();
    }
  }

  void _showFeedbackDialog() {
    final TextEditingController feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feedback'),
          content: TextField(
            controller: feedbackController,
            decoration:
                InputDecoration(hintText: "Enter your feedback here..."),
            maxLines: 3,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _sendFeedback(feedbackController.text);
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _sendFeedback(String feedback) {
    if (feedback.isNotEmpty) {
      _feedbackCollection.add({
        'feedback': feedback,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Feedback submitted!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.feedback, color: Colors.white),
            onPressed: _showFeedbackDialog,
          ),
          IconButton(
            icon: Icon(Icons.clear, color: Colors.white),
            onPressed: _clearMessages,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _messagesCollection.orderBy('createdAt').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                return ListView(
                  padding: EdgeInsets.all(8.0),
                  children: snapshot.data!.docs.map((doc) {
                    bool isUserMessage = doc['isUser'] ?? false;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Align(
                        alignment: isUserMessage
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          elevation: 5.0,
                          color: isUserMessage
                              ? Colors.teal[300]
                              : Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              doc['text'],
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.teal),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
