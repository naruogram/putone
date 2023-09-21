import 'package:flutter/material.dart';
import 'package:putone/mock/community_dummy_data.dart';
import 'package:putone/theme/app_color_theme.dart';

class CommonArtists extends StatelessWidget {
  CommonArtists({
    super.key,
    required this.artists,
  });
  final List<String> artists;

  @override
  Widget build(BuildContext context) {
    List<Widget> createCommonArtistCards(List<String> artists) {
      final List<Widget> artistList = [];
      for (final artist in artists) {
        artistList.add(
          Container(
            height: 24,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: AppColorTheme.dark().gray300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              artist,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
      return artistList;
    }

    return Container(
      child: Wrap(
        //alignment: WrapAlignment.,
        spacing: 6,
        runSpacing: 6,
        children: [
          ...createCommonArtistCards(artists),
        ],
      ),
    );
  }
}
