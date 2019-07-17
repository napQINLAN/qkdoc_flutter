import 'package:flutter/material.dart';
import 'dart:ui';

class SearchBarPage extends StatefulWidget {
  @override
  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              child: Container(
                child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 0.0),
                                  hintText: "项目名称/街道名称/单位名称",
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.cancel),
                          color: Colors.grey,
                          iconSize: 18.0,
                          onPressed: () {
                            controller.clear();
                          },
                        )
                  ],
                ),
              ),

            ),
          ),
        ),
    );
  }
}
