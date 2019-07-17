import 'package:flutter/material.dart';
import 'package:qkdoc_flutter/login/login_page.dart';
import 'package:qkdoc_flutter/project/searchbar_page.dart';
import 'package:qkdoc_flutter/constants/constants.dart';

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
      appBar: AppBar(
        title: SearchBarPage(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                        _navPush(context, LoginPage());
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

  _navPush(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
