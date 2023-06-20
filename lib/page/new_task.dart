import 'package:flow/event.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class NewTask extends StatefulWidget {
  final ScrollController controller;
  final PanelController panelController;
  final DateTime selectedDate;
  late Map<DateTime, List<MyEvent>> mySelectedEvents;

  NewTask({
    Key? key,
    required this.controller,
    required this.panelController,
    required this.selectedDate,
    required this.mySelectedEvents
  }) : super(key: key);  

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  // buat text box
  final titleController = TextEditingController();
  final descController = TextEditingController();

  // buat time picker
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(const Duration(hours: 1));

  @override
  Widget build(BuildContext context) => ListView(
      children: <Widget>[
        Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              
                icon: Icon(Icons.close, color: HexColor("#F5F5F7"),),
                onPressed: () {
                  widget.panelController.close();
                  startTime = DateTime.now();
                  endTime = DateTime.now().add(const Duration(hours: 1));
                } 
                // '${widget.panelController.close()}',
            
            ),
            Center(            
              child: Text("Create New Task", style: TextStyle(color: HexColor("#F5F5F7")), textAlign: TextAlign.center),              
            ),
            IconButton(
              
                icon: const Icon(Icons.close, color: Colors.transparent,),
                onPressed: () {} ,
            
            ),
          ],
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text(
                DateFormat('EEEE').format(widget.selectedDate),
                style: TextStyle(
                  color: HexColor("F5F5F7"),
                  fontSize: 32,                
                ),
              ),

            ),
            Text(
              DateFormat('d MMMM yyyy').format(widget.selectedDate),
              style: TextStyle(
                color: HexColor("F5F5F7"),
                fontSize: 17
              ),
            ),
          ],
        ),
        buildEventDetails()
      ],
    );

    Widget buildEventDetails() {
      Color selectedColor = Colors.red;

      return Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            textBoxBuilder("Task Name", "Name", titleController),
            textBoxBuilder("Task Description", "Description", descController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                clockPickerBuilder(startTime, "81FF62", "Start Time"),
                clockPickerBuilder(endTime, "FF3E3E", "End Time")
              ],
            ),
            Row(
              children: [
                labelBuilder("Task Color"),
                Container(width: 11,),
                StatefulBuilder(builder: (context, setState){
                  return ElevatedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Pick a color"),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: selectedColor,
                              onColorChanged: (Color color){
                                setState(() {
                                  selectedColor = color;
                                });
                              },
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text("Done"),
                              onPressed: () => Navigator.of(context).pop(),
                            )
                          ],
                        );
                      },
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("333336"),
                      elevation: 0,
                      padding: const EdgeInsets.all(5),
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)
                      )  
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: selectedColor
                          ),
                          width: 20,
                          height: 20,
                          // color: selectedColor,
                        ),
                        Icon(Icons.keyboard_arrow_down, color: HexColor("7D7D7D"),)
                      ]
                    )
                  );
                })
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 27),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    HexColor("FF7360"),
                    HexColor("FFA99E")
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                borderRadius: BorderRadius.circular(9)
              ),
              child: ElevatedButton(
                onPressed: (){
                  if(titleController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      snackBarBuilder("Task's name is required!")
                    );
                  } else if(startTime.compareTo(endTime) > 0){
                    ScaffoldMessenger.of(context).showSnackBar(
                      snackBarBuilder("Are you trying to time travel? End time can't be earlier than start time.")
                    );
                  } else{
                    setState(() {
                      if(widget.mySelectedEvents[widget.selectedDate] != null){
                        widget.mySelectedEvents[widget.selectedDate]?.add(
                          MyEvent(title: titleController.text, description: descController.text, startTime: TimeOfDay.fromDateTime(startTime), endTime: TimeOfDay.fromDateTime(endTime), color: selectedColor)
                        );
                      }else{
                        widget.mySelectedEvents[widget.selectedDate] = [
                          MyEvent(title: titleController.text, description: descController.text, startTime: TimeOfDay.fromDateTime(startTime), endTime: TimeOfDay.fromDateTime(endTime), color: selectedColor)
                        ];
                      }
                    });
                    titleController.clear();
                    descController.clear();
                    widget.panelController.close();
                  }
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,                  
                  minimumSize: const Size.fromHeight(50)
                ),   
                child: const Text("Create Task!"),
              ),
            )
          ],
        ),
      );
    } 

    SnackBar snackBarBuilder(String text){
      return SnackBar(
        dismissDirection: DismissDirection.down,
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
        behavior: SnackBarBehavior.floating,                        
        content: Text(text, textAlign: TextAlign.center,), 
        duration: const Duration(seconds: 3),        
      );
    }

    Widget labelBuilder(String label){
      return Text(
        label,
        style: TextStyle(
          color: HexColor("F5F5F7"),
          fontSize: 12
        ),
      );
    }

    Widget textBoxBuilder(String label, String placeholder, TextEditingController textController) => Container(
      margin: const EdgeInsets.only(bottom: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          labelBuilder(label),

          Container(
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: HexColor("333336")
            ),
            child: TextFormField(    
              controller: textController,          
              onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
              cursorColor: HexColor("F5F5F7"),
              style: TextStyle(
                color: HexColor("F5F5F7")
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: HexColor("747474")
                ),
              ),
            ),
          )
        ],
      ),
    );

    Widget clockPickerBuilder(DateTime currentTime, String hexCode, String label) {
      var hour = currentTime.hour.toString().padLeft(2, '0');
      var minute = currentTime.minute.toString().padLeft(2, '0');

      return Container(
        margin: const EdgeInsets.only(bottom: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            labelBuilder(label),
            Container(margin: const EdgeInsets.only(top: 5)),
            StatefulBuilder(builder: (context, setState){
              return ElevatedButton(
                onPressed: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(currentTime)
                  );

                  if(newTime == null) return;
                  setState(() {
                    currentTime = DateTime.now().copyWith(hour: newTime.hour, minute: newTime.minute);
                    hour = currentTime.hour.toString().padLeft(2, '0');
                    minute = currentTime.minute.toString().padLeft(2, '0');

                    if(hexCode == "81FF62"){ //start
                      startTime = currentTime;
                    }else{ //end
                      endTime = currentTime;
                    }
                  });
                },
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor("333336"),
                  elevation: 0,
                  padding: const EdgeInsets.all(15),
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)
                  )  
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Clock.svg',
                      colorFilter: ColorFilter.mode(HexColor(hexCode), BlendMode.srcIn)
                    ),
                    Container(                    
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        '$hour:$minute',
                        style: TextStyle(
                          color: HexColor("F5F5F7")
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),       
      );
    } 
}