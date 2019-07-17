import 'package:flutter/material.dart';
import 'package:qkdoc_flutter/constants/constants.dart' show AppColors, AppUrls;
import 'package:qkdoc_flutter/utils/data_utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:qkdoc_flutter/utils/net_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _contollerUserName = TextEditingController();
  var _contollerPassword = TextEditingController();

  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("登录"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _contollerUserName,
                decoration: InputDecoration(
                    hintText: '请输入用户名',
                    hintStyle: TextStyle(
                      color: Color(0xaaaaaaaa),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    )),
                maxLength: 11,
                maxLines: 1,
              ),
              Container(
                height: 20,
              ),
              TextField(
                controller: _contollerPassword,
                decoration: InputDecoration(
                    hintText: '请输入密码',
                    hintStyle: TextStyle(
                      color: Color(0xaaaaaaaa),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    )),
                maxLength: 20,
                maxLines: 1,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      //发布动弹
                      DataUtils.isLogin().then((isLogin) {
                        //网络请求
                        if(!isLogin){
                          _login(context, _contollerUserName.text,_contollerPassword.text);
                        }
                      });
                    },
                    color: Color(AppColors.APP_THEME),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "登录",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _login(BuildContext context, String username, String password) async {
    if(username.isEmpty && password.isEmpty){
      _showSnackBar(context, '用户名或密码不能为空！');
      return ;
    }

    Map<String, String> params = new Map();
    params['username'] = username;
    params['password'] = password;

    NetUtils.post(AppUrls.LOGIN, params).then((data){
      if (data != null && data.isNotEmpty) {
        print('MY_INFORMATION: $data');
      }
    });

  }

  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(message),
      duration: Duration(milliseconds: 500),
    ));
  }
}
