import 'package:flutter/material.dart';
import 'package:school_app_demo/screens/admin/admin_dashboard.dart';
import 'package:school_app_demo/screens/contact_us_screen.dart';
import 'package:school_app_demo/screens/parent/parent_dashboard.dart';
import 'package:school_app_demo/screens/staff/staff_dashboard.dart';
import 'package:school_app_demo/screens/student/student_dashboard.dart';
import 'package:school_app_demo/screens/super-admin/super_admin_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? userType = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo at the top
                Center(
                  child: Image.asset(
                    'assets/images/school_logo.png', // Replace with your logo asset
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(height: 48.0),

                // User Type Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select User Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'student', child: Text('Student')),
                    DropdownMenuItem(value: 'staff', child: Text('Staff')),
                    DropdownMenuItem(value: 'admin', child: Text('Admin')),
                    DropdownMenuItem(
                        value: 'super_admin', child: Text('Super Admin')),
                    DropdownMenuItem(value: 'parent', child: Text('Parent')),
                  ],
                  onChanged: (value) {
                    // Handle user type selection
                    userType = value;
                  },
                ),
                const SizedBox(height: 24.0),

                // Name Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Password Field
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Handle login action
                    if (userType == 'student') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StudentDashboard()));
                    } else if (userType == 'staff') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StaffDashboard()));
                    } else if (userType == 'parent') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ParentDashboard()));
                    } else if (userType == 'admin') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdminDashboard()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SuperAdminDashboard()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Login', style: TextStyle(fontSize: 18.0)),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Contact Us Button
                TextButton(
                  onPressed: () {
                    // Navigate to Contact Us screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactUsScreen()));
                  },
                  child: const Text('Contact Us'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
