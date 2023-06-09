import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tp_agile/data/worker_data.dart';
import 'layout/home.dart';
import 'layout/employee_list.dart';
import 'layout/employee_detail.dart';
import 'layout/planning.dart';
import 'layout/add_employee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sakartone',
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xfffeb701))),
      routes: {
        '/': (context) => const MainPage(),
        '/employee': (context) => EmployeeDetails(worker: workers[0],),
        '/add-employee': (context) => const AddEmployee(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      const Home(),
      const EmployeeList(),
      const Planning(),
    ];
    List<String> tabNames = [
      'Accueil',
      'Employés',
      'Planning',
    ];
    return Scaffold(
      backgroundColor: const Color(0xfffeb701),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          tabNames.elementAt(_selectedIndex),
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        backgroundColor: Colors.white,
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Accueil'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.list),
            title: const Text('Employés'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.calendar_month),
            title: const Text('Planning'),
          ),
        ],
      ),
      body: pageList.elementAt(_selectedIndex),
      floatingActionButton: Visibility(
        visible: _selectedIndex == 1,
        child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: new Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add-employee');
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
