import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:putone/components/user_icon.dart';

class UserIconList extends StatelessWidget {
  const UserIconList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              UserCircleIcon(
                size: 60,
              ),
              Gap(4),
              Text('name'),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
        padding: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        itemCount: 30,
      ),
    );
  }
}
