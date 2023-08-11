import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:putone/components/user_icon.dart';
import 'package:putone/model/music.dart';
import 'package:putone/model/user.dart';
import 'package:putone/utill/constant.dart';

class MusicPostCard extends StatelessWidget {
  final VoidCallback onPostTap;
  final User user;
  final Music music;
  const MusicPostCard({
    Key? key,
    required this.onPostTap,
    required this.user,
    required this.music,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPostTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 0.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MusicPostCardHeader(
              user: user,
            ),
            _MusicImage(
              music: music,
            ),
            _MusicPostCardFooter(
              postTitle: music.descroption,
            ),
          ],
        ),
      ),
    );
  }
}

class _MusicPostCardHeader extends StatelessWidget {
  final User user;
  const _MusicPostCardHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            height: 36,
            child: UserCircleIcon(
              imagePath: user.imagePath,
            ),
          ),
          Gap(4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.id,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MusicImage extends StatelessWidget {
  final Music music;

  const _MusicImage({
    Key? key,
    required this.music,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsExt.imagePath(
            music.imagePath,
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: ColoredBox(
                color: Colors.black.withOpacity(0.3),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsExt.svgPath('music'),
                    ),
                    Gap(4),
                    Text(
                      music.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(48),
                    SvgPicture.asset(
                      AssetsExt.svgPath('book_mark'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _MusicPostCardFooter extends StatelessWidget {
  final String postTitle;
  const _MusicPostCardFooter({
    Key? key,
    required this.postTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postTitle,
            style: TextStyle(
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Gap(8),
          Row(
            children: [
              SvgPicture.asset(
                AssetsExt.svgPath('heart'),
              ),
              Gap(4),
              SvgPicture.asset(
                AssetsExt.svgPath('comment'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
