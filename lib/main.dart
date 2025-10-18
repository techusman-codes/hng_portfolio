// lib/main.dart

import 'package:flutter/material.dart';
import 'package:hng_task_one/about_section.dart';
import 'package:hng_task_one/contact_section.dart';
import 'package:hng_task_one/theme.dart';


void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  // --- Theme State Variable ---
  bool _isDarkMode = true; // Start with Dark Mode (or false for Light Mode)

  void _toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
    // In a real app, you'd save this to SharedPreferences here.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Personal Portfolio',
      // --- Apply Theme based on state ---
      theme: _isDarkMode ? darkTheme : lightTheme,
      home: MainAppShell(
        isDarkMode: _isDarkMode,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}

class MainAppShell extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggleTheme;

  const MainAppShell({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const AboutScreen(),
    const ContactScreen(),
    // Add SkillsScreen() here later
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        actions: [
          // --- Theme Toggle Switch ---
          Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
          Switch(
            value: widget.isDarkMode,
            onChanged: widget.onToggleTheme, // Calls the function in MyApp
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Contact',
          ),
          // Add Skills tab here:
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.code),
          //   label: 'Skills',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
        onTap: _onItemTapped,
      ),
    );
  }
}