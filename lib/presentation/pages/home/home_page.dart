import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:putone/components/music_post_card.dart';
import 'package:putone/components/user_icon_list.dart';
import 'package:putone/mock/mock_story.dart';
import 'package:putone/presentation/pages/post/post_music_page.dart';
import 'package:putone/presentation/pages/story/story_mucis_page.dart';
import 'package:putone/theme/app_color_theme.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorTheme.dark().mainColor,
        elevation: 0,
        title: Text('Putone'),
      ),
      body: Padding(
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
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Gap(16),
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
                      onPostTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return PostMusicPage(
                              music: mockMusicList[index],
                            );
                          },
                        ),
                      ),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
