import 'package:flutter/material.dart';

class StaffTimetableScreen extends StatelessWidget {
  const StaffTimetableScreen({super.key});

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
              'Weekly Timetable',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16.0),

            // Timetable
            Expanded(
              child: ListView(
                children: [
                  _buildDaySchedule(
                    context,
                    day: 'Monday',
                    classes: [
                      TimetableClass(
                        subject: 'Advanced Mathematics',
                        time: '10:00 AM - 11:30 AM',
                        location: 'Room 201',
                      ),
                      TimetableClass(
                        subject: 'Physics 101',
                        time: '1:00 PM - 2:30 PM',
                        location: 'Room 301',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  _buildDaySchedule(
                    context,
                    day: 'Tuesday',
                    classes: [
                      TimetableClass(
                        subject: 'Computer Science',
                        time: '10:00 AM - 11:30 AM',
                        location: 'Lab 101',
                      ),
                      TimetableClass(
                        subject: 'Mathematics',
                        time: '2:00 PM - 3:30 PM',
                        location: 'Room 201',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Add more days as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaySchedule(BuildContext context,
      {required String day, required List<TimetableClass> classes}) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day Title
            Text(
              day,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 12.0),

            // Class Details
            ...classes
                .map((classInfo) => _buildClassInfo(context, classInfo))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildClassInfo(BuildContext context, TimetableClass classInfo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(Icons.book, color: Theme.of(context).primaryColor),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                classInfo.subject,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                '${classInfo.time} | ${classInfo.location}',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimetableClass {
  final String subject;
  final String time;
  final String location;

  TimetableClass({
    required this.subject,
    required this.time,
    required this.location,
  });
}
