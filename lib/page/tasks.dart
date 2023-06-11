import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:table_calendar/table_calendar.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(      
      body: SafeArea(
        child: Column(
          children: [
            Card(
              color: HexColor("202124"),
              elevation: 0,              
              margin: const EdgeInsets.symmetric(horizontal: 27),
              child: TableCalendar(
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: HexColor("#F5F5F7"),
                    fontSize: 18
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: HexColor("#F5F5F7"),
                    size: 18,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: HexColor("#F5F5F7"),
                    size: 18,
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: Color.fromRGBO(183, 183, 183, 1)
                  ),
                  weekendStyle: TextStyle(
                    color: Color.fromRGBO(183, 183, 183, 1)
                  )
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                firstDay: DateTime(2010),
                focusedDay: today,
                lastDay: DateTime(2050),
                onDaySelected:_onDaySelected,                
                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(
                    color: HexColor("#F5F5F7")
                  ),
                  weekendTextStyle: TextStyle(
                    color: HexColor("#F5F5F7")
                  ),
                  outsideDaysVisible: false,
                  selectedDecoration: BoxDecoration(
                    color: HexColor("D085FF"),
                    shape: BoxShape.circle,
                    
                  ),
                  todayDecoration: BoxDecoration(
                    color: HexColor("A020F0"),
                    shape: BoxShape.circle
                  ),
                  selectedTextStyle: const TextStyle(
                    fontSize: 14
                  ),
                  todayTextStyle: TextStyle(
                    fontSize: 14,
                    color: HexColor("#F5F5F7")
                  )
                ),                
              ),
            )
          ],
        ),
      )
    );
}