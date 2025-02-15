import 'package:flutter/material.dart';
import 'package:pusdatin_end/widget/customcalendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        shadowColor: Colors.black.withValues(alpha: 5),
        title: Row(
          children: [
            Text(
              'Assets',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Hub',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              '.',
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_sharp,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Customcalendar(),
            ],
          ),
        ),
      ),
    );
  }
}
