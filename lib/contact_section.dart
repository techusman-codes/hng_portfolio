// lib/contact_screen.dart

import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // Helper function to create a contact tile
  Widget _buildContactTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor, size: 30),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        _buildContactTile(
          context: context,
          icon: Icons.mail,
          title: 'Email',
          subtitle: 'ugarba202@gmail.com',
          onTap: () {
            print('Launch ugarba202@gmail.com');
          },
        ),
        _buildContactTile(
          context: context,
          icon: Icons.link,
          title: 'LinkedIn',
          subtitle: '@Usman Umar Garba',
          onTap: () {
            // ACTION: Launch browser to LinkedIn URL (use url_launcher package)
            print('https://www.linkedin.com/in/usman-umar-garba/');
          },
        ),
        _buildContactTile(
          context: context,
          icon: Icons.code,
          title: 'GitHub',
          subtitle: '@techusman_codes',
          onTap: () {
            // ACTION: Launch browser to GitHub URL (use url_launcher package)
            print('https://github.com/techusman-codes');
          },
        ),

        // Add more contact methods (e.g., Phone, Portfolio website)
      ],
    );
  }
}
