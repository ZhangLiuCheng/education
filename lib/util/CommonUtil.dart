import 'package:education/model/db/SPUtil.dart';
import 'package:education/view/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class CommonUtil {
  static Future isLogin() async {
    String token = await SPUtil.getToken();
    return token != null && token.isNotEmpty;
  }

  /// 没有登录，跳到登录页面
  static loginIntercept(BuildContext context, cb) async {
    cb(true);

//    if (await isLogin()) {
//      cb(true);
//    } else {
//      toLogin(context);
//    }
  }

  static toLogin(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//      return LoginHomePage();
    }));
  }

  static toLogout(BuildContext context) {
    SPUtil.clearUserInfo();
    SPUtil.saveTaobaoOpenId("");
    Toast.show('登出成功', context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return MainPage();
    }), (route) => route == null);
  }

  /// 13+任意数 * 15+除4的任意数 * 18+除1和4的任意数 * 17+除9的任意数 * 147
  static bool isChinaPhoneLegal(String str) {
    return new RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(str);
  }

  static Future clipBoard(String content) {
    return Clipboard.setData(new ClipboardData(text: content));
  }
}
