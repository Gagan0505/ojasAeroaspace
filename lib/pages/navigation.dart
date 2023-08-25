import 'package:flutter/material.dart';
import 'package:krishakthi/pages/my_station.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 1;
  void _navigatebottom( int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const Center(child: Text('Home'),),
    const MyStation(),
    const Center(child: Text('Krishi Bazaar'),),
    const Center(child: Text('My Farm'),),
    const Center(child: Text('Krishi Gyan'),),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigatebottom,
        selectedItemColor: const Color(0xFFE36E26),
        type: BottomNavigationBarType.fixed,
        items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("lib/Icons/Home.png")), 
          label: 'Home'
          ),

        BottomNavigationBarItem(
            icon: StackedIcon(
              bottomImage: "lib/Icons/station.png",
              topImage: "lib/Icons/Pin.png",
            ),
            label: 'My Station',
          ),

        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("lib/Icons/Bazaar.png")), 
          label: 'Krishi Bazaar'
         ),

        BottomNavigationBarItem(
         icon: ImageIcon(AssetImage("lib/Icons/farm.png")),
         label: 'My Farm'
         ),

        BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("lib/Icons/Gyan.png")), 
        label: 'Krishi Gyan'
        ),
      ],
      ),
    );
  }
}

class StackedIcon extends StatelessWidget {
  final String bottomImage;
  final String topImage;

  const StackedIcon({super.key, required this.bottomImage, required this.topImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ImageIcon(AssetImage(bottomImage)),
        Positioned(
          top: 3,
          child: ImageIcon(AssetImage(topImage)),
        ),
      ],
    );
  }
}






