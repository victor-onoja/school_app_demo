import 'package:flutter/material.dart';

class ParentChildProgressScreen extends StatelessWidget {
  const ParentChildProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Page Title
            Text(
              'Academic Performance',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Grades Section
            const Text(
              'Grades',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),

            const GradesCard(
              subject: 'Mathematics',
              grade: 'A',
              teacherComment: 'Excellent performance!',
            ),
            const GradesCard(
              subject: 'Science',
              grade: 'B+',
              teacherComment: 'Good understanding of the concepts.',
            ),
            const GradesCard(
              subject: 'English',
              grade: 'A-',
              teacherComment: 'Great improvement over the semester.',
            ),
            const SizedBox(height: 24.0),

            // Recent Assignments Section
            const Text(
              'Recent Assignments',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),

            const AssignmentCard(
              title: 'Math Homework #5',
              dueDate: 'Due: August 15, 2024',
              status: 'Completed',
            ),
            const AssignmentCard(
              title: 'Science Project',
              dueDate: 'Due: August 20, 2024',
              status: 'In Progress',
            ),
            const AssignmentCard(
              title: 'English Essay',
              dueDate: 'Due: August 18, 2024',
              status: 'Not Started',
            ),
            const SizedBox(height: 24.0),

            // Teacher Comments Section
            const Text(
              'Teacher Comments',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),

            const TeacherCommentCard(
              teacher: 'Mrs. Smith',
              comment:
                  'Your child is doing exceptionally well in mathematics. Keep encouraging them to practice daily.',
            ),
            const TeacherCommentCard(
              teacher: 'Mr. Johnson',
              comment:
                  'There has been significant improvement in reading comprehension. Continue with the extra reading sessions at home.',
            ),
          ],
        ),
      ),
    );
  }
}

// Grades Card
class GradesCard extends StatelessWidget {
  final String subject;
  final String grade;
  final String teacherComment;

  const GradesCard({
    super.key,
    required this.subject,
    required this.grade,
    required this.teacherComment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Grade: $grade',
              style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Teacher Comment: $teacherComment',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

// Assignment Card
class AssignmentCard extends StatelessWidget {
  final String title;
  final String dueDate;
  final String status;

  const AssignmentCard({
    super.key,
    required this.title,
    required this.dueDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              dueDate,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Status: $status',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

// Teacher Comment Card
class TeacherCommentCard extends StatelessWidget {
  final String teacher;
  final String comment;

  const TeacherCommentCard({
    super.key,
    required this.teacher,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Teacher: $teacher',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              comment,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
