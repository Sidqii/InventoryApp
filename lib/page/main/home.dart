import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarformat = CalendarFormat.month;
  DateTime _focusday = DateTime.now();
  DateTime? _selectday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        shadowColor: Colors.black.withValues(alpha: 5),
        title: Row(
          children: [
            Text(
              'Assets',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Hub',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              '.',
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_sharp,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: SizedBox(
                height: 400,
                child: TableCalendar(
                  focusedDay: _focusday,
                  daysOfWeekVisible: false,
                  firstDay: DateTime.utc(2024, 1, 1),
                  lastDay: DateTime.utc(2050, 12, 31),
                  calendarFormat: _calendarformat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectday, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectday = selectedDay;
                      _focusday = focusedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    defaultDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    headerPadding: EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 20,
                    ),
                    formatButtonVisible: false,
                    titleCentered: false,
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
