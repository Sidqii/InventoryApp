import 'package:flutter/material.dart';
import 'package:pusdatin_end/widget/customappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Home',
        boldTitle: 'Page',
        onNotifPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Column(
              spacing: 0,
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
