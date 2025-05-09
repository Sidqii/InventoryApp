import 'package:flutter/material.dart';
import 'package:pusdatin_end/page/main/barang.dart';
import 'package:pusdatin_end/page/main/home.dart';
import 'package:pusdatin_end/page/main/request.dart';
import 'package:pusdatin_end/page/main/riwayat.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _pageController.jumpToPage(1);
      await Future.delayed(const Duration(milliseconds: 100));
      _pageController.jumpToPage(0);
    });
  }

  void _onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomePage(),
          BarangPage(),
          RequestPage(),
          RiwayatPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8.0,
              offset: Offset(0, -2),
            )
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: 'Barang',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Pengajuan',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
            ),
          ],
        ),
      ),
    );
  }
}
