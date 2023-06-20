// import 'dart:html';

import 'package:flow/event.dart';
import 'package:flow/page/new_task.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  // buat calendar
  DateTime selectedCalendarDay = DateTime.now();
  var focusedDate = DateTime.now();  
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    if(!isSameDay(selectedCalendarDay, selectedDay)){
      setState(() {
        selectedCalendarDay = selectedDay;
        focusedDate = focusedDay;
      });
    }
  }

  // buat fab
  var fabVisible = true;
  void onFabClick(bool state){
    setState(() {
      fabVisible = state;
    });
  }

  // buat sliding panel
  final panelController = PanelController();

  // buat event
  late Map<DateTime, List<MyEvent>> mySelectedEvents;   

  @override
  void initState(){
    selectedCalendarDay = focusedDate;
    mySelectedEvents = {};
    super.initState();
  }

  List<MyEvent> _listOfDayEvents(DateTime dateTime){
    return mySelectedEvents[dateTime] ?? [];
  }

  @override
  Widget build(BuildContext context) => Scaffold(          
    body: Stack(
      // alignment: Alignment.bottomRight,
      children: <Widget>[
        SlidingUpPanel(
          body: SafeArea(
            child: SingleChildScrollView(
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
                      selectedDayPredicate: (day) => isSameDay(day, selectedCalendarDay),
                      firstDay: DateTime(2010),
                      focusedDay: selectedCalendarDay,
                      lastDay: DateTime(2050),
                      onDaySelected: _onDaySelected,
                      eventLoader: _listOfDayEvents,
                      calendarBuilders: CalendarBuilders(
                        markerBuilder: (context, day, events) {
                          if(events.isNotEmpty){
                            return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: HexColor("FF7360"),
                              ),
                              width: 5,
                              height: 5,
                              margin: const EdgeInsets.symmetric(horizontal: 1.5),
                            );
                          }else{
                            return Container();
                          }
                        },
                      ),                    
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
                  ),
                  Container(                  
                    height: 1,
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    color: HexColor("585858"),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    child: Text(
                      "Tasks 🙌",
                      style: TextStyle(
                        color: HexColor("F5F5F7"),
                        fontSize: 18
                      ),
                    ),
                  ),

                  ..._listOfDayEvents(selectedCalendarDay).map(
                    (myEvent) {
                      var startTimeHour = myEvent.startTime.hour.toString().padLeft(2, '0');
                      var startTimeMinute = myEvent.startTime.minute.toString().padLeft(2, '0');

                      var endTimeHour = myEvent.endTime.hour.toString().padLeft(2, '0');
                      var endTimeMinute = myEvent.endTime.minute.toString().padLeft(2, '0');

                      return Container(   
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),                 
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              myEvent.color,
                              HexColor("2F2F2F"),
                            ]
                          ),
                          borderRadius: BorderRadius.circular(21)
                        ),
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,                            
                                children: [
                                  Text(
                                    myEvent.title,
                                    style: TextStyle(
                                      color: HexColor("F5F5F7"),
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    myEvent.description,
                                    style: TextStyle(
                                      color: HexColor("F5F5F7"),                                  
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              )
                            )
                            ,
                            Column(
                              children: [
                                Text(
                                  '$startTimeHour:$startTimeMinute', 
                                  style: TextStyle(
                                    color: HexColor("B7B7B7")
                                  ),
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                    color: HexColor("B7B7B7")
                                  ),
                                ),
                                Text(
                                  '$endTimeHour:$endTimeMinute',
                                  style: TextStyle(
                                    color: HexColor("B7B7B7")
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  )
                ],
              ),
            )
            
          ),
          controller: panelController,
          defaultPanelState: PanelState.CLOSED,
          onPanelClosed: () {
            onFabClick(true);
          },
          minHeight: 0,
          maxHeight: 600,
          backdropTapClosesPanel: true,
          backdropEnabled: true,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          color: HexColor("202124"),
          panelBuilder: (controller) => NewTask(
            controller: controller,
            panelController: panelController,
            selectedDate: focusedDate,
            mySelectedEvents: mySelectedEvents,
          ),
        ),
      ]
    ),
        
    floatingActionButton: Visibility(
      visible: fabVisible,
      child: FloatingActionButton(
        onPressed: (){
          panelController.open();
          onFabClick(false);
        },      
        
        backgroundColor: HexColor("333336"),
        child: Icon(
          Icons.add,
          color: HexColor("FF7360"),
          size: 35,
        ),
      ),
    )
           
  );
}