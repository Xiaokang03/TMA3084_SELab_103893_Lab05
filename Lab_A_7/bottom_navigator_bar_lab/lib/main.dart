import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';
import 'tab_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TabModel(),
      child: const MaterialApp(home: BottomNavLab()),
    ),
  );
}

class BottomNavLab extends StatelessWidget {
  const BottomNavLab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar - Dyril was here oso'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const _TabBody(),
      bottomNavigationBar: const _TabNavBar(),
    );
  }
}

class _TabBody extends StatelessWidget {
  const _TabBody();

  static const List<Widget> screens = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.select<TabModel, int>(
      (model) => model.currentIndex,
    );

    return IndexedStack(index: currentIndex, children: screens);
  }
}

class _TabNavBar extends StatelessWidget {
  const _TabNavBar();

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.select<TabModel, int>(
      (model) => model.currentIndex,
    );

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      iconSize: 30,
      onTap: (int index) => context.read<TabModel>().select(index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
      ],
    );
  }
}
