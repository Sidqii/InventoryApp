import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/getx/getx_event.dart';
import 'package:table_calendar/table_calendar.dart';

class Customcalendar extends StatefulWidget {
  const Customcalendar({super.key});

  @override
  State<Customcalendar> createState() => _CustomcalendarState();
}

class _CustomcalendarState extends State<Customcalendar> {
  final calendarctrl = Get.put(GetxEvent());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            Obx(
              () {
                return TableCalendar(
                  focusedDay: calendarctrl.focusday.value,
                  firstDay: DateTime.utc(2024, 01, 01),
                  lastDay: DateTime.utc(2050, 12, 31),
                  calendarFormat: calendarctrl.calendarformat.value,
                  selectedDayPredicate: (day) {
                    return isSameDay(calendarctrl.selectday.value, day);
                  },
                  onDaySelected: (selectDay, focusDay) {
                    calendarctrl.selectday.value = selectDay;
                    calendarctrl.selectday.value = focusDay;
                  },
                  eventLoader: (day) {
                    DateTime normalized =
                        DateTime(day.year, day.month, day.day);
                    return calendarctrl.events[normalized] ?? [];
                  },
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
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
                );
              },
            ),
            Obx(
              () {
                var selectday = DateTime(
                  calendarctrl.selectday.value.year,
                  calendarctrl.selectday.value.month,
                  calendarctrl.selectday.value.day,
                );
                var eventlist = calendarctrl.events[selectday]??[];
                return Expanded(
                  child: ListView.builder(
                    itemCount: eventlist.length,
                    itemBuilder: (context, index){
                      var event = eventlist[index];
                      return ListTile(
                        title: Text(event['event']),
                        subtitle: Text(event['date']),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
