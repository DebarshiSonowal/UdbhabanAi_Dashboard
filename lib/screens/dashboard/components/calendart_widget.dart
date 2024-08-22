import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/models/data.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/calendar_list_widget.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  List<CalendarData> _selectedDate = [];

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  List<CalendarData> _eventLoader(DateTime date) {
    return calendarData
        .where((element) => isSameDay(date, element.date))
        .toList();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedDate = calendarData
            .where((element) => isSameDay(selectedDay, element.date))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${DateFormat("MMM, yyyy").format(_focusedDay)}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _focusedDay =
                            DateTime(_focusedDay.year, _focusedDay.month - 1);
                      });
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: greenColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        print(_focusedDay);
                        _focusedDay =
                            DateTime(_focusedDay.year, _focusedDay.month + 1);
                      });
                    },
                    child: Icon(
                      Icons.chevron_right,
                      color: greenColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          TableCalendar<CalendarData>(
              selectedDayPredicate: (day) => isSameDay(_focusedDay, day),
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2018),
              lastDay: DateTime.utc(2025),
              headerVisible: false,
              onDaySelected: _onDaySelected,
              onFormatChanged: (result) {},
              headerStyle: HeaderStyle(
                titleTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 7.sp,
                    ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter: (date, locale) {
                  return DateFormat("EEE").format(date).toUpperCase();
                },
                // decoration: BoxDecoration(
                //   color: Colors.white70
                // ),
                weekendStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 6.5.sp,
                ),
                weekdayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 6.5.sp,
                ),
              ),
              onPageChanged: (day) {
                _focusedDay = day;
                setState(() {});
              },
              calendarStyle: CalendarStyle(
                todayTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 8.sp,
                    ),
                defaultTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 8.sp, color: Colors.white54),
                selectedTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 8.sp, color: Colors.white70),
                outsideTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 8.sp, color: Colors.white70),
                disabledTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 8.sp, color: Colors.white54),
                weekNumberTextStyle:Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 8.sp, color: Colors.white70),
                weekendTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 8.sp, color: Colors.white70),
                todayDecoration: BoxDecoration(
                  color: greenColor,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: greenColor,
                  shape: BoxShape.circle,
                ),
              ),
              eventLoader: _eventLoader),
          SizedBox(
            height: 4,
          ),
          CalendartList(datas: _selectedDate),
          SizedBox(
            height: 4,
          ),
          Divider(),
        ],
      ),
    );
  }
}
