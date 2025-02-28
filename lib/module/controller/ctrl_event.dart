import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:pusdatin_end/module/service/services_event.dart';

class CtrlEvent extends GetxController {
  var events = <DateTime, List<dynamic>>{}.obs;
  var selectday = DateTime.now().obs;
  var focusday = DateTime.now().obs;
  var calendarformat = CalendarFormat.month.obs;
  var isloading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEvent();
    debounce(
      events,
      (_) {
        update();
      },
      time: Duration(milliseconds: 300),
    );
    // ever(events, (_)=>update());
  }

  void fetchEvent() async {
    isloading.value = true;
    try {
      List<dynamic> data = await ServicesEvent().fetchEvent();
      var tempevent = <DateTime, List<dynamic>>{};

      for (var event in data) {
        DateTime eventdate = DateTime.parse(event['date']);
        DateTime normalize = DateTime(
          eventdate.year,
          eventdate.month,
          eventdate.day,
        );
        if (!tempevent.containsKey(normalize)) {
          tempevent[normalize] = [];
        }
        tempevent[normalize]?.add(event);
      }
      events.value = tempevent;
      focusday.value = DateTime.now();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Exception error on connected to calendar server',
        duration: Duration(seconds: 2),
      );
      isloading.value = false;
    }
  }
}
