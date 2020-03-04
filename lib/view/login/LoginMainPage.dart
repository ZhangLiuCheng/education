import 'package:education/util/WidgetUtil.dart';
import 'package:flutter/material.dart';

class LoginMainPage extends StatelessWidget {
    
    _btnPhoneLogin(context) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//            return LoginPage();
        }));
    }
    
    _btnRegister(context) {
//        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//            return Code();
//        }));
    }
    
    _btnTaobao(context) {
//        _taobaoLogin(context);
    }

    _requestLogin(context, code) {
//        Api.login(code).then((user) {
//            SPUtil.saveToken(user.token);
//            _back(context);
//        }).catchError((error) {
//            print("请求登录失败: $error");
//        });
    }
    
    _back(context) {
        Navigator.of(context).pop();
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                alignment: Alignment.center,
                child: Container(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                            ClipOval(
                                child: Image(
                                    image: AssetImage("images/guide_2.jpg"),
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 40),
                                child: Text("淘小钱   赚大钱",
                                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold,
                                        shadows: [Shadow(color: Colors.black, offset: Offset(2, 2))]
                                    ),
                                ),
                            ),
//                            WidgetUtil.buildButton(context, "手机号登录", Color(0xFFFF6633), _btnPhoneLogin),
                            
                            WidgetUtil.buildButton(context, "立即注册", Color(0xFFFFcF43), _btnRegister),
                            _buildLoginView(context)
                        ],
                    ),
                ),
            )
        );
    }
    
    _buildLoginView(context) {
        return Container(
            margin: EdgeInsets.all(40),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    RaisedButton(
                        child: new Text('手机登录'),
                        onPressed: () {
                            _btnPhoneLogin(context);
                        },
                    ),
                    RaisedButton(
                        child: new Text('淘宝登录'),
                        onPressed: () {
                            _btnTaobao(context);
                        },
                    )
                ],
            )
        );
    }
}
