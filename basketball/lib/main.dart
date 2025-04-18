import 'package:flutter/material.dart';

void main() {
  runApp(BasketballCounterApp());
}

class BasketballCounterApp extends StatefulWidget {
  @override
  _BasketballCounterAppState createState() => _BasketballCounterAppState();
}

class _BasketballCounterAppState extends State<BasketballCounterApp> {
  int teamAScore = 0;
  int teamBScore = 0;

  void addPoints(String team, int points) {
    setState(() {
      if (team == 'A') {
        teamAScore += points;
      } else {
        teamBScore += points;
      }
    });
  }

  void resetScores() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Basketball Pointer Counter'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 126, 27),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(child: buildTeamColumn('Team A', teamAScore, 'A')),
                VerticalDivider(
                  thickness: 2,
                  color: Colors.black,
                ),
                Expanded(child: buildTeamColumn('Team B', teamBScore, 'B')),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: resetScores,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800],
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Reset Scores', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTeamColumn(String teamName, int score, String teamKey) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(teamName, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text('$score', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.orange[800])),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => addPoints(teamKey, 1),
            child: Text('Add 1 Point'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => addPoints(teamKey, 2),
            child: Text('Add 2 Point'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => addPoints(teamKey, 3),
            child: Text('Add 3 Point'),
          ),
        ],
      ),
    );
  }
}
 