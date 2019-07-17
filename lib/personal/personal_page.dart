import 'package:flutter/material.dart';
import 'package:qkdoc_flutter/constants/constants.dart' show AppColors;

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  var userAvatar = "";
  List menuTitles = [
    '会议管理',
    '推荐下载',
    '设置',
    '意见反馈',
  ];
  List menuIcons = [
    Icons.message,
    Icons.cloud_download,
    Icons.settings,
    Icons.feedback,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Color(AppColors.APP_THEME),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                      child: userAvatar != ""
                          ? Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xffffffff),
                                  width: 2.0,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(userAvatar),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Image.asset(
                              'assets/images/icon_pending.png',
                              width: 60,
                              height: 60,
                            ),
                      onTap: () {}),
                ),
              ),
              Container(
                  color: Color(AppColors.APP_THEME),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                        child: Text(
                      "管理员",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xfffffffff),
                      ),
                    )),
                  )),
              Container(
                width: double.infinity,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(menuIcons[index]),
                        title: Text(menuTitles[index]),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {

                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: menuTitles.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
