import 'package:flutter/material.dart';
import 'package:putone/components/user_icon_list.dart';
import 'package:putone/presentation/pages/main/community/community_screen.dart';
import 'package:putone/presentation/pages/main/home/home_screen.dart';
import 'package:putone/theme/app_color_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabs extends StatefulWidget {
  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  late List _currentContent = [
    HomeScreen(),
    CommunityScreen(),
  ];
  late List _appBarList;

  @override
  void initState() {
    super.initState();
    _appBarList = [_homeAppBar, _community_appbar];
  }

  void _onBottomBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final Widget _homeAppBar = AppBar(
    backgroundColor: AppColorTheme.dark().mainColor,
    elevation: 0,
    title: Text(
      'Putone', //各bottomNavBarのindexに合わせて変更する
      style: GoogleFonts.getFont('Carter One'),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.library_music_outlined),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.notifications_none),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.chat),
      ),
    ],
  );

  final Widget _community_appbar = AppBar(
    backgroundColor: AppColorTheme.dark().mainColor,
    elevation: 0,
    title: Text(
      'フレンド追加',
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w900,
        fontSize: 24,
      ),
    ),
    actions: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'ID検索',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            fixedSize: Size.fromHeight(30),
          ),
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _appBarList[_currentIndex], //_currentIndexによって表示するAppBarを変更する
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
