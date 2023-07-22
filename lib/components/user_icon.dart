import 'package:flutter/material.dart';
import 'package:putone/utill/constant.dart';

class UserCircleIcon extends StatelessWidget {
  final double size;
  final String imagePath;
  const UserCircleIcon({
    Key? key,
    this.size = 44,
    this.imagePath = 'user_icon_sample.jpg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        AssetsExt.imagePath(imagePath),
        fit: BoxFit.cover,
      ),
    );
  }
}
