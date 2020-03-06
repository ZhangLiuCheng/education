import 'package:education/util/CommonUtil.dart';
import 'package:education/util/ScreenAdapter.dart';
import 'package:education/util/WidgetUtil.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {

    String title;

    LoginPage({this.title: '手机登录'});

    @override
    State<StatefulWidget> createState() {
        return _LoginPageState();
    }
}

class _LoginPageState extends State {
    FocusNode _contentFocusNode = FocusNode();
    String _phone;

    _requestCode(phone) {
//    Api.phoneCode(phone).then((data) {
//      Code code = data;
//      code.phone = _phone;
//      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//        return PhoneCodePage(code);
//      }));
//    }).catchError((err) {
//      Toast.show(err.message, context,
//          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
//    });
    }

    _onTextChange(str) {
        if (str.length == 11) {
            _phone = str;
        } else {
            _phone = null;
        }
        setState(() {});
    }

    _btnNext() {
        if (_phone == null) {
            return;
        }
        _contentFocusNode.unfocus();
        if (!CommonUtil.isChinaPhoneLegal(_phone)) {
            Toast.show("请输正确手机号", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            return;
        }
        this._requestCode(_phone);
    }

    @override
    void initState() {
        super.initState();
        Future.delayed(Duration(milliseconds: 300), () {
            _contentFocusNode.requestFocus();
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: WidgetUtil.buildAppBar('手机登录'),
            body: new Theme(data: ThemeData(primaryColor: Color(0xffff2c56),
                accentColor: Color(0xffff2c56)), child: _buildContent()));
    }

    _buildContent() {
        double height = MediaQuery
            .of(context)
            .size
            .height;
        return SingleChildScrollView(
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: height,
                child: Column(
                    children: <Widget>[
                        Image.asset(
                            'images/logo.png',
                            width: ScreenAdapter.setWidth(132),
                            height: ScreenAdapter.setWidth(132),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Text(
                                '彩虹优选',
                                style: TextStyle(
                                    fontSize: ScreenAdapter.setFont(40)),
                            ),
                        ),
                        _buildInputText(),
                        _buildNextButton()
                    ],
                ),
            ),
        );
    }

    _buildInputText() {
        return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30, left: 18, right: 18),
            child: TextField(
                focusNode: _contentFocusNode,
                maxLength: 11,
                style: TextStyle(fontSize: ScreenAdapter.setFont(16)),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
//                    labelText: '请输入手机号',
//                    labelStyle: TextStyle(fontSize: 20),
                    hintText: "请输入手机号",
                    hintStyle: TextStyle(fontSize: ScreenAdapter.setFont(28),
                        color: Color(0xff999999)),
                ),
                onChanged: _onTextChange,
            ),
        );
    }

    _buildNextButton() {
        return GestureDetector(
            onTap: _btnNext,
            child: Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 50, left: 30, right: 30),
                decoration: BoxDecoration(
                    color: _phone == null ? Color(0xFFadadad) : Color(
                        0xffff2c56),
                    borderRadius: BorderRadius.circular(50.0)),
                child: Text(
                    "下一步",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                ),
            ));
    }
}
