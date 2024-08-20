import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

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
              'My Timetable',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16.0),

            // Timetable Content
            Expanded(
              child: ListView(
                children: [
                  // Monday
                  TimetableDayCard(
                    day: 'Monday',
                    classes: [
                      TimetableClass(
                        time: '08:00 AM - 09:00 AM',
                        subject: 'Mathematics',
                        room: 'Room 101',
                        teacher: 'Mr. Smith',
                      ),
                      TimetableClass(
                        time: '09:15 AM - 10:15 AM',
                        subject: 'Physics',
                        room: 'Room 102',
                        teacher: 'Mrs. Johnson',
                      ),
                      // Add more classes as needed
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Tuesday
                  TimetableDayCard(
                    day: 'Tuesday',
                    classes: [
                      TimetableClass(
                        time: '08:00 AM - 09:00 AM',
                        subject: 'Chemistry',
                        room: 'Room 103',
                        teacher: 'Dr. Brown',
                      ),
                      TimetableClass(
                        time: '09:15 AM - 10:15 AM',
                        subject: 'English Literature',
                        room: 'Room 104',
                        teacher: 'Ms. Taylor',
                      ),
                      // Add more classes as needed
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Add more days as needed (Wednesday, Thursday, etc.)

                  // Sample Weekend or Free Day
                  const TimetableDayCard(
                    day: 'Saturday',
                    classes: [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimetableDayCard extends StatelessWidget {
  final String day;
  final List<TimetableClass> classes;

  const TimetableDayCard({super.key, required this.day, required this.classes});

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
            // Day Title
            Text(
              day,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8.0),

            // Classes List
            if (classes.isEmpty)
              const Text(
                'No classes scheduled',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              )
            else
              ...classes.map((cls) => TimetableClassCard(cls)),
          ],
        ),
      ),
    );
  }
}

class TimetableClassCard extends StatelessWidget {
  final TimetableClass cls;

  const TimetableClassCard(this.cls, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.access_time, color: Theme.of(context).primaryColor),
          const SizedBox(width: 8.0),
          Text(
            cls.time,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cls.subject,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${cls.room} - ${cls.teacher}',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimetableClass {
  final String time;
  final String subject;
  final String room;
  final String teacher;

  TimetableClass({
    required this.time,
    required this.subject,
    required this.room,
    required this.teacher,
  });
}
