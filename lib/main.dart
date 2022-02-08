import 'package:app_test/screen/screen_around.dart';
import 'package:app_test/screen/screen_chat.dart';
import 'package:app_test/screen/screen_home.dart';
import 'package:app_test/screen/screen_profile.dart';
import 'package:app_test/screen/screen_town.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  String _dropdownValue = '목2동';
  final screens = [
    HomeScreen(),
    TownScreen(),
    AroundScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: DropdownButton(
            value: _dropdownValue,
            // elevation: 50,
            underline: Container(
              height: 0,
            ),
            icon: Icon(
              Boxicons.bx_chevron_down,
              color: Colors.black,
            ),
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            onChanged: (String? newVal) {
              setState(() {
                _dropdownValue = newVal!;
              });
            },
            items: ['목2동', '마곡동', '대치동'].map((e) {
              return DropdownMenuItem(
                child: Text(e),
                value: e,
              );
            }).toList(),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 5),
              constraints: BoxConstraints(),
              onPressed: null,
              icon: Icon(
                Boxicons.bx_search,
                color: Colors.black,
              ),
            ),
            IconButton(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              constraints: BoxConstraints(),
              onPressed: null,
              icon: Icon(
                Boxicons.bx_menu,
                color: Colors.black,
              ),
            ),
            IconButton(
              padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
              constraints: BoxConstraints(),
              onPressed: null,
              icon: Icon(
                Boxicons.bx_bell,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          selectedItemColor: Colors.redAccent,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Boxicons.bx_home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Boxicons.bx_receipt),
              label: '동네생활',
            ),
            BottomNavigationBarItem(
              icon: Icon(Boxicons.bx_map),
              label: '내 근처',
            ),
            BottomNavigationBarItem(
              icon: Icon(Boxicons.bx_chat),
              label: '채팅',
            ),
            BottomNavigationBarItem(
              icon: Icon(Boxicons.bx_user),
              label: '나의 당근',
            ),
          ],
        ),
      ),
    );
  }
}
