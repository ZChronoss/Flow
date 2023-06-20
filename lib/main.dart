import 'package:flow/page/focus.dart';
import 'package:flow/page/home.dart';
import 'package:flow/page/notes.dart';
import 'package:flow/page/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


void main() {
  runApp(const Calendar());
}
GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // buat bottom nav bar
  int _currentIndex = 0;
  final tabs = <Widget>[
    const Home(),
    const Tasks(),
    const Notes(),
    const FocusPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("202124")
      ),
      home: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(          
          key: _bottomNavigationKey,
          backgroundColor: Colors.transparent,          
          color: const Color.fromRGBO(51, 51, 54, 1.0),
          items: <Widget>[
            SvgPicture.asset(
              "assets/icons/Home.svg",
              colorFilter: _currentIndex == 0 ? ColorFilter.mode(HexColor("FF7360"), BlendMode.srcIn) : ColorFilter.mode(HexColor("9BA0A5"), BlendMode.srcIn)
            ),
            SvgPicture.asset(
              "assets/icons/Tasks.svg",
              colorFilter: _currentIndex == 1 ? ColorFilter.mode(HexColor("FF7360"), BlendMode.srcIn) : ColorFilter.mode(HexColor("9BA0A5"), BlendMode.srcIn)
            ),
            SvgPicture.asset(
              "assets/icons/Notes.svg",
              colorFilter: _currentIndex == 2 ? ColorFilter.mode(HexColor("FF7360"), BlendMode.srcIn) : ColorFilter.mode(HexColor("9BA0A5"), BlendMode.srcIn)
            ),
            SvgPicture.asset(
              "assets/icons/Focus.svg",
              colorFilter: _currentIndex == 3 ? ColorFilter.mode(HexColor("D085FF"), BlendMode.srcIn) : ColorFilter.mode(HexColor("9BA0A5"), BlendMode.srcIn)
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        // BottomNavigationBar(
        //   currentIndex: _currentIndex,
        //   type: BottomNavigationBarType.fixed,
        //   backgroundColor: const Color.fromRGBO(51, 51, 54, 1),
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   selectedItemColor: const Color.fromRGBO(255, 115, 96, 1),
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;
        //     });
        //   },
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: SvgPicture.asset("assets/icons/Home.svg"),
        //       label: 'Home',
        //       activeIcon: SvgPicture.asset(
        //         "assets/icons/Home.svg",
        //         colorFilter: ColorFilter.mode(HexColor("FF7360"), BlendMode.srcIn) 
        //       )
        //     ),

        //     BottomNavigationBarItem(
        //       icon: SvgPicture.asset("assets/icons/Tasks.svg"),
        //       label: 'Tasks',
        //       activeIcon: SvgPicture.asset(
        //         "assets/icons/Tasks.svg",
        //         colorFilter: ColorFilter.mode(HexColor("FF7360"), BlendMode.srcIn) 
        //       )
        //     ),

        //     BottomNavigationBarItem(
        //       icon: SvgPicture.asset("assets/icons/Notes.svg"),
        //       label: 'Notes',
        //       activeIcon: SvgPicture.asset(
        //         "assets/icons/Notes.svg",
        //         colorFilter: ColorFilter.mode(HexColor("FF7360"), BlendMode.srcIn) 
        //       )
        //     ),

        //     BottomNavigationBarItem(
        //       icon: SvgPicture.asset("assets/icons/Focus.svg"),
        //       label: 'Focus',
        //       activeIcon: SvgPicture.asset(
        //         "assets/icons/Focus.svg",
        //         colorFilter: ColorFilter.mode(HexColor("D085FF"), BlendMode.srcIn) 
        //       )
        //     )
        //   ],          
        // ),
      ),
    );
  }
}

