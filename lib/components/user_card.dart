import 'package:flutter/material.dart';
import 'package:putone/components/common_artists.dart';
import 'package:putone/components/user_icon.dart';
import 'package:putone/model/music.dart';
import 'package:putone/model/user.dart';
import 'package:putone/utill/constant.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_color_theme.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
    required this.music,
    required this.artists,
  });

  final User user;
  final Music music;
  final List<String> artists;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 186,
      height: 302,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColorTheme.dark().gray300,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //ユーザー情報のウィジェット
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserCircleIcon(
                  size: 28,
                  imagePath: user.imagePath,
                ),
                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      user.id,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: AppColorTheme.dark().gray100,
            height: 0.2,
          ),
          //テーマソング情報のウィジェット
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    AssetsExt.imagePath(music.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      music.name,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      music.artist,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: AppColorTheme.dark().gray100,
            height: 0.2,
          ),
          //共通アーティストの表示
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '共通アーティスト',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                //共通アーティストの丸作成
                CommonArtists(
                  artists: artists,
                ),
                SizedBox(height: 24),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      //fixedSize: Size.fromHeight(20),
                      backgroundColor: AppColorTheme.dark().accentColor,
                      //disabledForegroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      //alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        //vertical: 4,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'フォロー',
                        softWrap: false,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
