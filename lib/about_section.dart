// lib/about_screen.dart

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access theme colors dynamically
    final textColor = Theme.of(context).textTheme.bodyMedium?.color;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Profile Picture
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/images/ucee.jpg"),
            backgroundColor: Color(0xFF00ADB5),
          ),
          const SizedBox(height: 16),

          Text(
            'Usman Umar Garba',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const Text(
            'Intern Mobile Engineer at HNG \n Bitcoin and Lighting Enthusiast',
            style: TextStyle(fontSize: 20, color: Color(0xFF00ADB5)),
          ),
          const Divider(height: 32),

          // About Section Text
          Text(
            'Hello! I am a passionate and driven intern specializing in mobile development. I thrive on learning new technologies and am currently focused on building robust, scalable applications using Flutter. This app serves as my digital portfolio, showcasing my commitment to clean design and functional code. I look forward to contributing innovative solutions to real-world problems.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16, height: 1.5, color: textColor),
          ),
          // Add more sections here (e.g., Education, Interests)
        ],
      ),
    );
  }
}
