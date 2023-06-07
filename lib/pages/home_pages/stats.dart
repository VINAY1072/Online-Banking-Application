import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/stat.png'),
            SizedBox(height: 16.0),
            Image.asset('images/stat.png'),
            SizedBox(height: 16.0),
            Image.asset('images/stat.png'),
            SizedBox(height: 16.0),
            Image.asset('images/stat.png'),
            SizedBox(height: 16.0),
            Image.asset('images/stat.png'),
          ],
        ),
      ),
    ));
  }
}
