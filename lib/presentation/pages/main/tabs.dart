import 'package:flutter/material.dart';
import 'package:putone/components/user_icon_list.dart';
import 'package:putone/presentation/pages/main/community/community_screen.dart';
import 'package:putone/presentation/pages/main/home/home_screen.dart';
import 'package:putone/theme/app_color_theme.dart';

class Tabs extends StatefulWidget {
  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  //bottomNavigationBarのitemを押した時にbodyに入れるwidgetを変化するためにwidgetをリスト化
  late List _currentContent = [
    HomeScreen(),
    CommunityScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onBottomBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentContent[_currentIndex], //_currentIndexによって表示するBodyを変更する
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColorTheme.dark().mainColor,
        fixedColor: Colors.white,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        currentIndex: _currentIndex,
        iconSize: 30,
        onTap: (index) {
          _onBottomBarTapped(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Community"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded),
              label: "Profile"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
