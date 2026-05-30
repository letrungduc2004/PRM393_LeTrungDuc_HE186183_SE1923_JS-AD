import 'package:flutter/material.dart';
import 'exercise_1/core_widgets_demo.dart';
import 'exercise_2/input_widget_demo.dart';
import 'exercise_3/layout_basics.dart';
import 'exercise_4/app_structure.dart';
import 'exercise_5/common_ui_errors_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Exercide 1
      title: 'Core Widgets Demo',
      home: const CoreWidgetsDemo(),

      // Exercide 2
      //  title: 'Input Widgets',
      //  home: InputControlsDemo(),

      // Erercise 3
      // title: 'Layout Basics',
      // home: LayoutDemo(),

      // Exercise 4
      // title: 'App Structure',
      // home: ThemeDemo(),

      // Exercise 5
      // title: 'Common UI Errors',
      // home: CommonUIErrorsDemo(),
    );
  }
}