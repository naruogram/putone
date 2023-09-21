import 'package:flutter/material.dart';
import 'package:putone/components/community_user_list.dart';
import 'package:putone/components/user_card.dart';
import 'package:putone/mock/community_dummy_data.dart';
import 'package:putone/theme/app_color_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityScreen extends StatefulWidget {
  CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final _filteringController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColorTheme.dark().mainColor,
          child: SafeArea(
            child: Container(
              color: AppColorTheme.dark().mainColor,
              padding: EdgeInsets.fromLTRB(12, 6, 12, 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'フレンド追加',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'ID検索',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Form(
                    child: Container(
                      height: 40,

                      //alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(45, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: Offset(2, 4),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: TextFormField(
                        controller: _filteringController,
                        //textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.cancel_outlined),
                          border: InputBorder.none,
                        ),
                        // onChanged: ((value) {
                        //   _filteringController.selection =
                        //       TextSelection.fromPosition(
                        //     TextPosition(
                        //       offset: 0,
                        //     ),
                        //   );
                        // }
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.fromLTRB(12, 4, 12, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColorTheme.dark().accentColor,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      child: Text(
                        '東京理科大学',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 200,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('所属中のコミュニティ'),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('東京理科大学'),
                                      Icon(
                                        Icons.check,
                                        color: AppColorTheme.dark().mainColor,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text('東京理科大学 経営学部'),
                                  SizedBox(height: 8),
                                  Text('理科大 バドミントンサークル'),
                                  SizedBox(height: 16),
                                  Divider(
                                    color: AppColorTheme.dark().gray300,
                                    height: 0.2,
                                  ),
                                  SizedBox(height: 16),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.add_circle_outline_outlined),
                                        SizedBox(width: 16),
                                        Text('コミュニティを追加'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 32,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person_add_rounded,
                      size: 32,
                    ),
                  ),
                ],
              ),
              Expanded(child: CommunityUserList()),
            ],
          ),
        ))
      ],
    );
  }
}
