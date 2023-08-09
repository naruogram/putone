import 'package:flutter/material.dart';
import 'package:putone/utill/constant.dart';
import 'package:blur/blur.dart';

class PostMusicPage extends StatelessWidget {
  const PostMusicPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 8,
      blurColor: Colors.grey,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsExt.imagePath('sample.png'),
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              AssetsExt.imagePath('sample.png'),
              width: 272,
              height: 272,
            )
          ],
        ),
      ),
    );
  }
}
