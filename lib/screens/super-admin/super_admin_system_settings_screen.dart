import 'package:flutter/material.dart';

class SuperAdminSystemSettingsScreen extends StatefulWidget {
  const SuperAdminSystemSettingsScreen({super.key});

  @override
  _SuperAdminSystemSettingsScreenState createState() =>
      _SuperAdminSystemSettingsScreenState();
}

class _SuperAdminSystemSettingsScreenState
    extends State<SuperAdminSystemSettingsScreen> {
  bool _darkMode = false;
  String _appLanguage = 'English';
  String _schoolName = 'My School';
  String _contactEmail = 'contact@myschool.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Title
            Text(
              'System Settings',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // School Name Field
            TextFormField(
              initialValue: _schoolName,
              decoration: const InputDecoration(
                labelText: 'School Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _schoolName = value;
                });
              },
            ),
            const SizedBox(height: 16.0),

            // Contact Email Field
            TextFormField(
              initialValue: _contactEmail,
              decoration: const InputDecoration(
                labelText: 'Contact Email',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _contactEmail = value;
                });
              },
            ),
            const SizedBox(height: 16.0),

            // App Language Dropdown
            DropdownButtonFormField<String>(
              value: _appLanguage,
              decoration: const InputDecoration(
                labelText: 'App Language',
                border: OutlineInputBorder(),
              ),
              items: <String>['English', 'Spanish', 'French', 'German']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _appLanguage = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),

            // Dark Mode Toggle
            SwitchListTile(
              title: const Text('Enable Dark Mode'),
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
            const SizedBox(height: 24.0),

            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save settings action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Save Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
