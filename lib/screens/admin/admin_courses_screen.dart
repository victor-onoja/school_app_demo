import 'package:flutter/material.dart';

class AdminCoursesScreen extends StatelessWidget {
  const AdminCoursesScreen({super.key});

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
              'Manage Courses',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Add New Course Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle add new course action
                },
                icon: const Icon(Icons.add),
                label: const Text('Add New Course'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // List of Courses
            Expanded(
              child: ListView(
                children: [
                  CourseCard(
                    courseName: 'Mathematics',
                    courseCode: 'MATH101',
                    instructor: 'Mr. John Doe',
                    onTap: () {
                      // Handle course details action
                    },
                  ),
                  CourseCard(
                    courseName: 'Physics',
                    courseCode: 'PHYS201',
                    instructor: 'Mrs. Jane Smith',
                    onTap: () {
                      // Handle course details action
                    },
                  ),
                  CourseCard(
                    courseName: 'English Literature',
                    courseCode: 'ENG301',
                    instructor: 'Ms. Alice Johnson',
                    onTap: () {
                      // Handle course details action
                    },
                  ),
                  // Add more course cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Course Card
class CourseCard extends StatelessWidget {
  final String courseName;
  final String courseCode;
  final String instructor;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.courseCode,
    required this.instructor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text(
          courseName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Course Code: $courseCode\nInstructor: $instructor'),
        trailing: Icon(Icons.edit, color: Theme.of(context).primaryColor),
        onTap: onTap,
      ),
    );
  }
}
