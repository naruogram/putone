import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:putone/components/music_post_card.dart';
import 'package:putone/components/user_icon_list.dart';
import 'package:putone/theme/app_color_theme.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserIconList(),
            Gap(16),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                  itemBuilder: (context, index) {
                    return MusicPostCard();
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 8,
                    crossAxisCount: 2,
                    // NOTE: childAspectRatio = 要素のWidth / 要素のHeight
                    childAspectRatio: 178 / 286,
                  ),
                  itemCount: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
