import 'package:flutter/material.dart';
import 'package:pusdatin_end/page/main/inventori.dart';
import 'package:pusdatin_end/page/main/home.dart';
import 'package:pusdatin_end/page/main/pengajuan.dart';
import 'package:pusdatin_end/page/main/riwayat.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const InventoriPage();
      case 2:
        return const PengajuanPage();
      case 3:
        return const RiwayatPage();
      default:
        return const HomePage();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: 4,
        itemBuilder: (context, index) {
          return _getPage(index);
        },
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
