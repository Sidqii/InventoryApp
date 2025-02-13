import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pusdatin_end/page/main/home.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  int _selectindex = 0;
  final _pagectrl = PageController();

  void _onitemtap(int index) {
    setState(() {
      _selectindex = index;
    });
    _pagectrl.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pagectrl,
        onPageChanged: (index) {
          setState(() {
            _selectindex = index;
          });
        },
        children: [
          HomePage(),
          Center(
            child: Text(
              'List Barang',
            ),
          ),
          Center(
            child: Text(
              'Peminjaman',
            ),
          ),
          Center(
            child: Text(
              'Persetujuan',
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectindex,
        onTap: _onitemtap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_sharp),
            label: 'Barang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_sharp),
            label: 'Peminjaman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: 'Profile',
          ),
        ],
      ).animate().fade(duration: 300.ms),
    );
  }
}
