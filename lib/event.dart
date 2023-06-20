import 'package:flutter/material.dart';

class MyEvent{
  final String title;
  final String description;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Color color;

  MyEvent({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.color
  });
}