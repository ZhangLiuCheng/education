import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'ScreenAdapter.dart';

class WidgetUtil {

    static buildButton(context, text, color, cb) {
        return GestureDetector(
            onTap: () {
                cb(context);
            },
            child: Container(
                width: double.infinity,
                height: 45,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(6.0)
                ),
                child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenAdapter.setFont(18)
                    ),
                ),
            )
        );
    }

    static showNetworkErrorInfo(BuildContext context, cb,
        {barrierDismissible: true, delay: 160}) {
        Timer(Duration(milliseconds: delay), () {
            showDialog<Null>(
                context: context,
                barrierDismissible: barrierDismissible,
                builder: (BuildContext context) {
                    return new AlertDialog(
                        title: new Text('提示'),
                        content: new Text('网络异常，加载失败'),
                        actions: <Widget>[
                            new FlatButton(
                                child: new Text('重试'),
                                onPressed: () {
                                    cb();
                                    Navigator.of(context).pop();
                                },
                            ),
                        ],
                    );
                },
            );
        });
    }

    static buildAppBar(String title, {List<Widget> actions}) {
        return PreferredSize(
            child: AppBar(
                title: Text(title,
                    style: TextStyle(
                        fontSize: ScreenAdapter.setFont(40),
                        fontWeight: FontWeight.normal
                    )
                ),
                actions: actions,
            ),
            preferredSize: Size.fromHeight(48)
        );
    }

    static buildNetworkImage(String url, width, height) {
        return CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: url,
            width: width,
            height: height,
            placeholder: (context, url) {
                return Container(
                    width: width,
                    height: height,
                    alignment: Alignment.center,
                    color: Color(0xffe0e0e0),
                    child: Image.asset("images/default_goods.png",
                        fit: BoxFit.contain,
                        width: width,
                        height: height),
                );
            },
            errorWidget: (context, url, error) => Icon(Icons.error),
        );
    }

    //待右箭头的竖状栏
    static buildColumn(String title, String content, _onTap,
        bool arrowIconVisible) {
        return GestureDetector(
            onTap: _onTap,
            child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 8, left: 20, right: 20),
                decoration: BoxDecoration(
                    border: new Border(
                        bottom: BorderSide(
                            color: Color(0xFFe0e0e0),
                            width: 1,
                            style: BorderStyle.solid
                        )
                    )
                ),
                alignment: Alignment.centerLeft,
                height: 45,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Text(title, style: TextStyle(
                            fontSize: 16, color: Colors.black)),
                        Row(
                            children: <Widget>[
                                Text(content,
                                    style: TextStyle(fontSize: 16,
                                        color: Color(0xff999999))),
                                Visibility(
                                    visible: arrowIconVisible,
                                    child: Icon(Icons.keyboard_arrow_right))
                            ],
                        ),
//              Expanded(
//                flex: 1,
//                child: new Text(content, style: TextStyle(fontSize: 14)),
//              ),
//              Icon(Icons.keyboard_arrow_right)
                    ],
                ),
            ));
    }

    //通用tabBar
    static buildTabBar(List<Widget> tabs, TabController tabController,
        {double marginTop: 0, double marginBottom: 0, double marginLeft: 0, double marginRight: 0}) {
        return Container(
            height: ScreenAdapter.setWidth(80),
            margin: EdgeInsets.only(top: marginTop,
                bottom: marginBottom,
                left: marginLeft,
                right: marginRight),
            padding: EdgeInsets.only(top: 5),
            color: Colors.white,
            child: TabBar(
                unselectedLabelStyle: TextStyle(
                    fontSize: ScreenAdapter.setFont(28),
                    fontWeight: FontWeight.normal,
                    color: Color(0xff333333),
                ),
                labelColor: Color(0xffff2c56),
                unselectedLabelColor: Color(0xff333333),
                labelStyle: TextStyle(
                    fontSize: ScreenAdapter.setFont(28),
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFFFFFFF)),
                indicatorColor: Color(0xffff2c56),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.only(left: 5, right: 5),
                labelPadding: EdgeInsets.only(left: 10, right: 10),
                isScrollable: false,
                tabs: tabs,
                controller: tabController,
            ),
        );
    }

}
