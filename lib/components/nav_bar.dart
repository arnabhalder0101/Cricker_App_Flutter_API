import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  void Function(int)? onTap;
  int currentIndex;

  MyNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
      unselectedItemColor: Theme.of(context).colorScheme.primary,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "Squads",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "Upcomings",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }
}
