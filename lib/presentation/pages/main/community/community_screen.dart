import 'package:flutter/material.dart';
import 'package:putone/theme/app_color_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColorTheme.dark().mainColor,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  Text(
                    'フレンド追加',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'ID検索',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        //fixedSize: Size.fromHeight(30),
                      ),
                    ),
                  )
                ],
              ),
              color: AppColorTheme.dark().mainColor,
              //elevation: 0,
            ),
          ),
        ),
        Center(
          child: Text('communityScreen'),
        ),
      ],
    );
  }
}
