// lib/contact_screen.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the package

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // --- 1. Function to Launch URLs (GitHub/LinkedIn) ---
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // Handle error (e.g., show a snackbar to the user)
      print('Could not launch $url');
    }
  }

  // --- 2. Function to Launch Email ---
  Future<void> _launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Portfolio Contact Inquiry',
        'body': 'Dear Usman, I saw your portfolio app and wanted to reach out...'
      }),
    );
    
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      print('Could not launch email to $email');
    }
  }
  
  // Helper function for URI encoding (required for mailto query)
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }


  // Helper function to create a contact tile (unchanged)
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
          leading: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
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
        // 1. Email Tile
        _buildContactTile(
          context: context,
          icon: Icons.mail,
          title: 'Email',
          subtitle: 'ugarba202@gmail.com',
          onTap: () {
            _launchEmail('ugarba202@gmail.com');
          },
        ),
        
        // 2. LinkedIn Tile
        _buildContactTile(
          context: context,
          icon: Icons.link,
          title: 'LinkedIn',
          subtitle: '@Usman Umar Garba',
          onTap: () {
            // ACTION: Replace with your actual LinkedIn profile URL
            _launchUrl('https://www.linkedin.com/in/YOUR_PROFILE_ID/'); 
          },
        ),
        
        // 3. GitHub Tile
        _buildContactTile(
          context: context,
          icon: Icons.code,
          title: 'GitHub',
          subtitle: '@techusman_codes',
          onTap: () {
            // ACTION: Replace with your actual GitHub profile URL
            _launchUrl('https://github.com/techusman_codes'); 
          },
        ),
      ],
    );
  }
}