import 'package:flutter/material.dart';
import 'package:schoolproject/models/arguments/hour_selection_arguments.dart';
import 'package:schoolproject/models/arguments/teacher_calendar_argument.dart';
import 'package:schoolproject/routes/routes.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TeacherCalendarScreen extends StatefulWidget {
  const TeacherCalendarScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<TeacherCalendarScreen> createState() => _TeacherCalendarScreenState();

  final TeacherCalendarArgument arguments;
}

class _TeacherCalendarScreenState extends State<TeacherCalendarScreen> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    print(widget.arguments.lessonType);
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Calendar"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 13,
              child: SfCalendar(
                view: CalendarView.month,
                onTap: (details) {
                  selectedDate = details.date as DateTime;
                  setState(() {});
                },
                minDate: DateTime.now(),
                blackoutDates: [
                  DateTime.now().subtract(
                    Duration(days: 2),
                  ),
                ],
                dataSource: MeetingDataSource(_getDataSource()),
                showCurrentTimeIndicator: false,
                monthViewSettings: MonthViewSettings(
                  showAgenda: true,
                  agendaViewHeight: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
            ),
            Visibility(
              visible: selectedDate == null ? false : true,
              child: Expanded(
                child: ElevatedButton(
                  child: Text('Select a Hour'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.hourSelectionScreen,
                      arguments: HourSelectionArguments(
                        teacherId: widget.arguments.teacherId,
                        date: selectedDate as DateTime,
                        lessonType: widget.arguments.lessonType,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting('Free Time For Lessons', startTime, endTime,
      const Color(0xFF0F8644), false));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
