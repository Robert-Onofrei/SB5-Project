import 'package:flutter/material.dart';

// Shared bottom navigation bar used across all screens
class BottomNavBar extends StatelessWidget {
  // Current selected index to highlight the active tab
  final int currentIndex;
  // Callback function when a tab is tapped
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      // Navigation tabs for the app
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Trails'),
        BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Attractions'),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Food'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
