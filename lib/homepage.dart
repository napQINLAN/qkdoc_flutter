import 'package:flutter/material.dart';
import 'package:qkdoc_flutter/message/message_page.dart';
import 'package:qkdoc_flutter/personal/personal_page.dart';
import 'package:qkdoc_flutter/project/project_page.dart';
import 'package:qkdoc_flutter/widget/navigation_icon_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appBarTitle = ['重点项目管理', '消息中心', '个人中心'];
  List<NavigationIconView> _navigationIconViews;
  var _currentIndex = 0;
  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _navigationIconViews = [
      NavigationIconView(
          title: '项目中心',
          iconPath: 'assets/images/menu_project_unselect.png',
          activeIconPath: 'assets/images/menu_project_select.png'),
      NavigationIconView(
          title: '消息中心',
          iconPath: 'assets/images/menu_message_unselect.png',
          activeIconPath: 'assets/images/menu_message_select.png'),
      NavigationIconView(
          title: '个人中心',
          iconPath: 'assets/images/menu_personal_unselect.png',
          activeIconPath: 'assets/images/menu_personal_select.png'),
    ];
    _pages = [
      ProjectPage(),
      MessagePage(),
      PersonalPage(),
    ];
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, //防止键盘弹出 导致超出屏幕
      appBar: AppBar(
        elevation: 0.0,
        title: Text(_appBarTitle[_currentIndex]),
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        //禁止滑动
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationIconViews.map((view) => view.item).toList(),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 1), curve: Curves.ease);
        },
      ),
    );
  }
}
