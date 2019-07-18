import 'package:flutter/material.dart';
import 'package:qkdoc_flutter/login/login_page.dart';
import 'package:qkdoc_flutter/project/searchbar_page.dart';
import 'package:qkdoc_flutter/constants/constants.dart';
import 'package:qkdoc_flutter/widget/login_notice.dart';
import 'package:qkdoc_flutter/widget/update_version.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  var _dropdownList = ['东海街道', '丰泽街道', '鲤城街道'];
  var dropdownValue = "";

  var _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 52.0,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SearchBarPage(),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "重点项目设置",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: _checkboxSelected,
                      activeColor: Color(AppColors.APP_THEME),
                      onChanged: (value) {
                        setState(() {
                          _checkboxSelected = value;
                        });
                      }),
                  Text(
                    "街道名称",
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: DropdownButton<String>(
                            value: dropdownValue == ""
                                ? _dropdownList[0]
                                : dropdownValue,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            underline: Text(''),
                            isExpanded: true,
                            items: _dropdownList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: _checkboxSelected,
                      activeColor: Color(AppColors.APP_THEME),
                      onChanged: (value) {
                        setState(() {
                          _checkboxSelected = value;
                        });
                      }),
                  Text(
                    "项目名称",
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: DropdownButton<String>(
                            value: dropdownValue == ""
                                ? _dropdownList[0]
                                : dropdownValue,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            underline: Text(''),
                            isExpanded: true,
                            items: _dropdownList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      color: Color(AppColors.APP_THEME),
                      onPressed: () {
//                        _navPush(context, LoginPage());
//                        _updateVersionHandle();
                        _showLoginDialog();
                      },

                      padding: EdgeInsets.all(10),
                      child: Text(
                        "搜索",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> _showLoginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        final data = LoginNoticeInfo(title: "", content: '');
        return LoginDialog(data: data);
      },
    );
  }

// 更新 app 弹窗
  Future<void> _updateVersionHandle() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        final data = UpdateVersion(
            appStoreUrl: 'https://itunes.apple.com/cn/app/id1380512641',
            versionName: 'v1.1.1',
            apkUrl:
            "https://wbd-app.oss-cn-shenzhen.aliyuncs.com/xls/xls-1.5.5_23_20190709_20.20.apk",
            content:
            '1.优化订单显示\n2.解决数据加载异常问题\n3.优化无网络显示效果\n4.解决iPhoneX 兼容性问题\n5.修复定位错误问题');
        return UpdateVersionDialog(data: data);
      },
    );
  }

  _navPush(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}

