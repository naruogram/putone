import 'package:flutter/material.dart';
import 'package:putone/components/user_card.dart';
import 'package:putone/mock/community_dummy_data.dart';

class CommunityUserList extends StatelessWidget {
  CommunityUserList({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: communityDummyUserList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //←横に表示するグリッド数
        childAspectRatio: 186 / 302, //←グリッドの横縦比率
        crossAxisSpacing: 12, //←グリッド間の横スペース
        mainAxisSpacing: 12, //←グリッド間の縦スペース
      ),
      itemBuilder: (context, index) {
        return UserCard(
          key: ValueKey(communityDummyUserList[index].id),
          user: communityDummyUserList[index],
          music: communityDummyMusicList[index],
          artists: commynityDummyArtistList[index],
        );
      },
    );
  }
}
