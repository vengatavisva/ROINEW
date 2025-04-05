import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

enum Operation { addition, multiplication }

class MathGameBase extends StatefulWidget {
  final Operation operation;

  MathGameBase({required this.operation});

  @override
  _MathGameBaseState createState() => _MathGameBaseState();
}

class _MathGameBaseState extends State<MathGameBase> {
  final Random _random = Random();
  List<List<int>> grid = [];
  Set<String> selectedPositions = {};
  int target = 0;
  int gridSize = 5;
  int score = 0;
  int level = 1;
  int timeLeft = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    generateGrid();
    score = 0;
    level = 1;
    timeLeft = 30;
    startTimer();
  }

  void generateGrid() {
    grid = List.generate(gridSize, (i) =>
        List.generate(gridSize, (j) => _random.nextInt(9) + 1));

    if (widget.operation == Operation.addition) {
      target = _random.nextInt(15 + level * 2) + 10;
    } else {
      do {
        target = _random.nextInt(30) + 20;
      } while (isPrime(target));
    }

    selectedPositions.clear();
  }

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= sqrt(number).toInt(); i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        showGameOverDialog();
      }
    });
  }

  void showCorrectDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.green[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(30),
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emoji_events, color: Colors.yellowAccent, size: 70),
              SizedBox(height: 20),
              Text(
                "Correct Answer!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("New round starting...", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );

    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop(); // Close dialog
    });
  }

  void showSnack(String message, Color color, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 12),
          Text(message),
        ],
      ),
      duration: Duration(seconds: 1),
    ));
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Time's Up!"),
        content: Text("Your final score: $score\nLevel reached: $level"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                startNewGame();
              });
            },
            child: Text("Restart"),
          ),
        ],
      ),
    );
  }

  void selectTile(int row, int col) {
    String positionKey = "$row-$col";
    if (selectedPositions.contains(positionKey)) return;

    setState(() {
      selectedPositions.add(positionKey);
      List<int> values = selectedPositions.map((pos) {
        var parts = pos.split("-");
        return grid[int.parse(parts[0])][int.parse(parts[1])];
      }).toList();

      int result = widget.operation == Operation.addition
          ? values.reduce((a, b) => a + b)
          : values.reduce((a, b) => a * b);

      if (result == target) {
        score += 10;
        level += 1;
        timeLeft += 5;
        showCorrectDialog();
        generateGrid();
      } else if ((widget.operation == Operation.addition && result > target) ||
          (widget.operation == Operation.multiplication && result > target * 2)) {
        showSnack("Too much! Try again.", Colors.red, Icons.error);
        selectedPositions.clear();
      }
    });
  }

  bool isTileSelected(int row, int col) {
    return selectedPositions.contains("$row-$col");
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String mode = widget.operation == Operation.addition ? "Addition" : "Multiplication";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$mode Mode",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                startNewGame();
              });
            },
            icon: Icon(Icons.refresh),
            tooltip: "Restart Game",
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          _buildStatsBar(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "Target: $target",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridSize,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: gridSize * gridSize,
              itemBuilder: (context, index) {
                int row = index ~/ gridSize;
                int col = index % gridSize;
                int number = grid[row][col];
                bool selected = isTileSelected(row, col);

                return GestureDetector(
                  onTap: () => selectTile(row, col),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: selected
                            ? [Colors.teal[800]!, Colors.tealAccent]
                            : [Colors.deepOrange, Colors.orangeAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        )
                      ],
                    ),
                    child: Text(
                      "$number",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _statItem("Score", "$score", Icons.star, Colors.amber),
          _statItem("Level", "$level", Icons.trending_up, Colors.greenAccent),
          _statItem("Time", "$timeLeft", Icons.timer, Colors.cyanAccent),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, color: color),
        SizedBox(width: 4),
        Column(
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(label, style: TextStyle(fontSize: 14)),
          ],
        )
      ],
    );
  }
}
