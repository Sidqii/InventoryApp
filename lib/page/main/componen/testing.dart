import 'package:flutter/material.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  String? selectedItem;
  final List<String> items = [
    'Laptop Asus',
    'Printer Epson',
    'Meja Kantor',
    'Kertas A4 Sidu',
    'Stapler Joyko',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownMenu<String>(
              hintText: 'Pilih data',
              inputDecorationTheme: InputDecorationTheme(
                border: UnderlineInputBorder(),
                filled: true,
              ),
              initialSelection: selectedItem,
              onSelected: (value) {
                setState(() {
                  selectedItem = value;
                });
              },
              dropdownMenuEntries: items.map((item) {
                return DropdownMenuEntry(
                  value: item,
                  label: item,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
