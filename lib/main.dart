import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'layout/home.dart';
import 'layout/employee_list.dart';
import 'layout/employee_detail.dart';
import 'layout/planning.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sakartone',
      routes: {
        '/': (context) => const Home(),
        '/employees': (context) => const EmployeeList(),
        '/employee': (context) => const EmployeeDetails(),
        '/planning': (context) => const Planning(),
      },
      initialRoute: '/',
    );
  }
}
