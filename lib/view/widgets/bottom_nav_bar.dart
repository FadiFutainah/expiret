import 'dart:developer';

import 'package:expiret/config/config.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Screen screen;

  const BottomNavBar({
    Key? key,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: screen.index,
      onTap: (index) {
        log('$index');
        switch (index) {
          case 0:
            Navigator.of(context).pushNamed('home');
            break;
          case 1:
            Navigator.of(context).pushNamed('history');
            break;
          case 2:
            Navigator.of(context).pushNamed('settings');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          activeIcon: Column(
            children: [
              const SizedBox(height: 2),
              Text(screen.getString(),
                  style: Theme.of(context).textTheme.subtitle2),
              const SizedBox(height: 2),
              const Icon(Icons.circle, size: 10, color: Colors.black),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.list,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          activeIcon: Column(
            children: [
              const SizedBox(height: 2),
              Text(screen.getString(),
                  style: Theme.of(context).textTheme.subtitle2),
              const SizedBox(height: 2),
              const Icon(Icons.circle, size: 10, color: Colors.black),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          activeIcon: Column(
            children: [
              const SizedBox(height: 2),
              Text(screen.getString(),
                  style: Theme.of(context).textTheme.subtitle2),
              const SizedBox(height: 2),
              const Icon(Icons.circle, size: 10, color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }
}
