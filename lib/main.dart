import 'package:education/view/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/AppStore.dart';
import 'model/db/SPUtil.dart';
import 'dart:io';

bool isFirst = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  print("1111");

  AppStore().init();

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  SPUtil.isFirstOpen().then((flag) {
    isFirst = flag;
    SPUtil.setFirstOpen(false);
    if(flag) {
      runApp(MyApp());
    } else {
      Future.delayed(Duration(milliseconds: 800), () {
        runApp(MyApp());
      });
    }
  });
}

class MyApp extends StatelessWidget {
  _precacheImages(BuildContext context) {
    if (isFirst) {
//            precacheImage(AssetImage("images/guide_1.jpg"), context);
//            precacheImage(AssetImage("images/guide_2.jpg"), context);
//            precacheImage(AssetImage("images/guide_3.jpg"), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    _precacheImages(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '教育',
      theme: ThemeData(
          platform: TargetPlatform.iOS,
          accentColor: Color(0xFFF50033),
          primaryColor: Color(0xffffffff),
          scaffoldBackgroundColor: Color(0xfff5f5f5)
      ),
      home: _getInitPage(context),
    );
  }

  _getInitPage(context) {
//        ScreenUtil.init(context, width: 750, height: 1334);

//        if (isFirst) {
//            return GuidePage();
//        }
    return MainPage();
  }
}

