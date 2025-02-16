import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusdatin_end/module/controller/ctrl_event.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarctrl = Get.put(EventCtrl());

    void showdialog(List<dynamic> events) {
      Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            constraints:
                BoxConstraints(maxWidth: 200),
            child: events.isEmpty
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.nightlight_sharp,
                          size: 40, color: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        'Tidak ada kegiatan',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: events
                        .map(
                          (event) => ListTile(
                            leading: Icon(Icons.event, color: Colors.grey),
                            title: Text(event['event']),
                            // subtitle: Text(event['date']),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ),
      );
    }

    return Card(
      elevation: 5,
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            Obx(
              () => TableCalendar(
                focusedDay: calendarctrl.focusday.value,
                firstDay: DateTime.utc(2024, 01, 01),
                lastDay: DateTime.utc(2050, 12, 31),
                calendarFormat: calendarctrl.calendarformat.value,
                selectedDayPredicate: (day) {
                  return isSameDay(calendarctrl.selectday.value, day);
                },
                onDaySelected: (selectDay, focusDay) {
                  calendarctrl.selectday.value = selectDay;
                  calendarctrl.focusday.value = focusDay;

                  DateTime normalize = DateTime(
                    selectDay.year,
                    selectDay.month,
                    selectDay.day,
                  );

                  var eventlist = calendarctrl.events[normalize] ?? [];

                  showdialog(eventlist);
                  // if (eventlist.isNotEmpty) {
                  //   Get.snackbar('${selectDay.toLocal()}',
                  //       eventlist.map((e) => e['event']).join(', '),
                  //       snackPosition: SnackPosition.BOTTOM);
                  // } else {
                  //   Get.snackbar('', 'Tidak ada kegiatan',
                  //       snackPosition: SnackPosition.BOTTOM);
                  // }
                },
                eventLoader: (day) {
                  DateTime normalize = DateTime(
                    day.year,
                    day.month,
                    day.day,
                  );
                  return calendarctrl.events[normalize] ?? [];
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                  headerPadding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 20,
                  ),
                  formatButtonVisible: false,
                  titleCentered: false,
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                ),
              ),
            ),
            // Obx(
            //   () {
            //     var selectday = DateTime(
            //       calendarctrl.selectday.value.year,
            //       calendarctrl.selectday.value.month,
            //       calendarctrl.selectday.value.day,
            //     );
            //     var eventlist = calendarctrl.events[selectday] ?? [];
            //     return Expanded(
            //       child: ListView.builder(
            //         itemCount: eventlist.length,
            //         itemBuilder: (context, index) {
            //           var event = eventlist[index];
            //           return ListTile(
            //             title: Text(event['event']),
            //             subtitle: Text(event['date']),
            //           );
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
