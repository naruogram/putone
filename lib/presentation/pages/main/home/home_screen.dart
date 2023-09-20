import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:putone/components/music_post_card.dart';
import 'package:putone/components/user_icon_list.dart';
import 'package:putone/mock/mock_data.dart';
import 'package:putone/presentation/pages/post/post_music_page.dart';
import 'package:putone/presentation/pages/story/story_mucis_page.dart';
import 'package:putone/theme/app_color_theme.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColorTheme.dark().mainColor,
          child: SafeArea(
            child: Container(
              color: AppColorTheme.dark().mainColor,
              padding: EdgeInsets.fromLTRB(12, 6, 8, 6),
              child: Row(
                children: [
                  Text(
                    'Putone',
                    style: GoogleFonts.getFont(
                      'Carter One',
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.library_music_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chat,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 3),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      UserIconList(
                        // FIXME: 遷移の仕方を変更する
                        onIconTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return TikTokStyleFullPageScroller(
                                contentSize: mockMusicList.length,
                                swipePositionThreshold: 0.2,
                                swipeVelocityThreshold: 2000,
                                animationDuration:
                                    const Duration(milliseconds: 200),
                                builder: (BuildContext context, int index) {
                                  return StoryMusicPage(
                                    index: index,
                                    music: mockMusicList[index],
                                    user: mockUserList[index],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Gap(8),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 8,
                      crossAxisCount: 2,
                      // NOTE: childAspectRatio = 要素のWidth / 要素のHeight
                      childAspectRatio: 178 / 286,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return MusicPostCard(
                          music: mockMusicList[index],
                          user: mockUserList[index],
                          onPostTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PostMusicPage(
                                  music: mockMusicList[index],
                                  user: mockUserList[index],
                                );
                              },
                            ),
                          ),
                        );
                      },
                      childCount: mockMusicList.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Gap(64),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
