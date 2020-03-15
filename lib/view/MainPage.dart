import 'package:education/util/CommonUtil.dart';
import 'package:education/util/ScreenAdapter.dart';
import 'package:education/view/course/CoursePage.dart';
import 'package:education/view/home/HomePage.dart';
import 'package:education/view/personal/PersonalPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

import 'member/MemberPage.dart';

class MainPage extends StatefulWidget {
    MainPage({Key key}) : super(key: key);

    @override
    _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

    PageController _pageController;

    DateTime _lastPressedAdt;

    int _selectedIndex = 0;

    Future<bool> _onBackPress() async {
        if (_lastPressedAdt == null ||
            DateTime.now().difference(_lastPressedAdt) > Duration(seconds: 1)) {
            _lastPressedAdt = DateTime.now();
            Toast.show("再按一次退出程序", context, gravity: Toast.CENTER);
            return false;
        }
        return true;
    }

    void _onItemTapped(int index) {
        if (index == 3) {
            CommonUtil.loginIntercept(context, (login) {
                if (login) {
                    _jumpToPage(index);
                }
            });
        } else {
            _jumpToPage(index);
        }
    }

    void _jumpToPage(int index) {
        setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
        });
    }

    @override
    void initState() {
        super.initState();
        _pageController = new PageController(initialPage: 0, keepPage: true);
    }

    @override
    void dispose() {
        super.dispose();
        _pageController.dispose();
    }

    @override
    Widget build(BuildContext context) {
        ScreenAdapter.init(context, width: 750, height: 1334);

        print("MainPage ---------->  build");
        return WillPopScope(
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                bottomNavigationBar: _buildBottomNavigationBar(),
                body: _buildBody(),
            ), onWillPop: _onBackPress
        );
    }

    _buildBottomNavigationBar() {
        double _size = ScreenAdapter().setWidth(52);
        return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    title: Text('首页'),
                    icon: Image.asset(
                        "images/tab_home_off.png", width: _size, height: _size),
                    activeIcon: Image.asset(
                        "images/tab_home_on.png", width: _size, height: _size)
                ),
                BottomNavigationBarItem(
                    title: Text('课程'),
                    icon: Image.asset(
                        "images/tab_category_off.png", width: _size,
                        height: _size),
                    activeIcon: Image.asset(
                        "images/tab_category_on.png", width: _size,
                        height: _size)
                ),
//                BottomNavigationBarItem(
//                    title: Text('会员'),
//                    icon: Image.asset(
//                        "images/tab_money_off.png", width: _size,
//                        height: _size),
//                    activeIcon: Image.asset(
//                        "images/tab_money_on.png", width: _size, height: _size)
//                ),
                BottomNavigationBarItem(
                    title: Text('个人中心'),
                    icon: Image.asset(
                        "images/tab_my_off.png", width: _size, height: _size),
                    activeIcon: Image.asset(
                        "images/tab_my_on.png", width: _size, height: _size)
                ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedFontSize: ScreenAdapter().setFont(22),
            unselectedFontSize: ScreenAdapter().setFont(20),
            fixedColor: Color(0xffff2c56),
            iconSize: _size,
            onTap: _onItemTapped
        );
    }

    _buildBody() {
        return new PageView(
            controller: _pageController,
            physics: new NeverScrollableScrollPhysics(),
            children: <Widget>[
                HomePage(),
                CoursePage(),
//                MemberPage(),
                PersonalPage()
            ]
        );
    }
}
