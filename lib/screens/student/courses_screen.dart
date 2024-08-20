import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

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
              'My Courses',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16.0),

            // Courses List
            Expanded(
              child: ListView(
                children: const [
                  CourseCard(
                    courseName: 'Introduction to Computer Science',
                    courseCode: 'CS101',
                    instructor: 'Dr. Alan Turing',
                    schedule: 'Mon & Wed 10:00 AM - 11:30 AM',
                  ),
                  SizedBox(height: 16.0),

                  CourseCard(
                    courseName: 'Linear Algebra',
                    courseCode: 'MATH201',
                    instructor: 'Prof. John Nash',
                    schedule: 'Tue & Thu 12:00 PM - 1:30 PM',
                  ),
                  SizedBox(height: 16.0),

                  CourseCard(
                    courseName: 'Modern Physics',
                    courseCode: 'PHY301',
                    instructor: 'Dr. Albert Einstein',
                    schedule: 'Fri 2:00 PM - 4:00 PM',
                  ),
                  SizedBox(height: 16.0),

                  // Add more courses as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseName;
  final String courseCode;
  final String instructor;
  final String schedule;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.courseCode,
    required this.instructor,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Name
            Text(
              courseName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8.0),

            // Course Code and Instructor
            Text(
              '$courseCode - $instructor',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8.0),

            // Schedule
            Row(
              children: [
                Icon(Icons.schedule, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8.0),
                Text(
                  schedule,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
