import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:pusdatin_end/module/service/services_event.dart';

class GetxEvent extends GetxController {
  var events = <DateTime, List<dynamic>>{}.obs;
  var selectday = DateTime.now().obs;
  var focusday = DateTime.now().obs;
  var calendarformat = CalendarFormat.month.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEvent();
  }

  void fetchEvent() async {
    try {
      List<dynamic> data = await ServicesEvent().fetchEvent();
      events.clear();

      for (var event in data) {
        DateTime eventdate = DateTime.parse(event['date']).toLocal();
        DateTime normalize = DateTime(eventdate.year, eventdate.month, eventdate.day);
        if (!events.containsKey(normalize)) {
          events[normalize] = [];
        }
        events[normalize]?.add(event);
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }
}
