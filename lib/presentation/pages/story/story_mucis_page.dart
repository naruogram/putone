import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:putone/components/movie_indicator.dart';
import 'package:putone/components/user_icon.dart';
import 'package:putone/model/music.dart';
import 'package:putone/model/user.dart';
import 'package:putone/utill/constant.dart';
import 'package:blur/blur.dart';

class StoryMusicPage extends StatefulWidget {
  final int index;
  final Music music;
  final User user;
  const StoryMusicPage({
    Key? key,
    required this.index,
    required this.music,
    required this.user,
  }) : super(key: key);

  @override
  State<StoryMusicPage> createState() => _StoryMusicPageState();
}

class _StoryMusicPageState extends State<StoryMusicPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Blur(
            blur: 10,
            blurColor: Colors.black12,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AssetsExt.imagePath(widget.music.imagePath),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 24,
            ),
            child: Column(
              children: [
                MovieIndicator(
                  index: widget.index,
                ),
                Gap(12),
                _UserInfoHeader(
                  user: widget.user,
                ),
                Gap(width * 0.25),
                Image.asset(
                  AssetsExt.imagePath(widget.music.imagePath),
                  width: 272,
                  height: 272,
                ),
                Gap(24),
                Text(
                  widget.music.artist,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(20),
                Text(
                  widget.music.name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(width * 0.15),
                _MenuSection(),
                Gap(width * 0.15),
                _MessageTextField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserInfoHeader extends StatelessWidget {
  final User user;
  const _UserInfoHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserCircleIcon(
          size: 38,
          imagePath: user.imagePath,
        ),
        Gap(12),
        Text(
          user.name,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(12),
        Text(
          "${user.fakeIndex}時間前 最終視聴",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            AssetsExt.svgPath('cross'),
            height: 20,
            width: 20,
            colorFilter: ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuSection extends StatelessWidget {
  const _MenuSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _CircleButton(
          svgTitle: 'heart_fill',
        ),
        Gap(16),
        _CircleButton(
          svgTitle: 'book_mark',
        ),
        Gap(16),
        _CircleButton(
          svgTitle: 'spotify',
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  final String svgTitle;
  const _CircleButton({
    Key? key,
    required this.svgTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      padding: EdgeInsets.all(8),
      height: 40,
      width: 40,
      child: SvgPicture.asset(
        AssetsExt.svgPath(svgTitle),
        colorFilter: ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

class _MessageTextField extends StatelessWidget {
  const _MessageTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Text(
        "メッセージを送信",
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
