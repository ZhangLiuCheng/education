import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {

    static ScreenAdapter _instance;
    static const int defaultWidth = 1080;
    static const int defaultHeight = 1920;
    static double _screenWidth;
    static double _screenHeight;

    static double _sizeRatio;

    num uiWidthPx;
    num uiHeightPx;

    ScreenAdapter._();

    factory ScreenAdapter() {
        return _instance;
    }

    static void init(BuildContext context,
        {num width = defaultWidth, num height = defaultHeight}) {
        if (_instance == null) {
            _instance = ScreenAdapter._();
        }
        _instance.uiWidthPx = width;
        _instance.uiHeightPx = height;
        MediaQueryData mediaQuery = MediaQuery.of(context);
        _screenWidth = mediaQuery.size.width;
        _screenHeight = mediaQuery.size.height;

//        ScreenUtil.init(context, width: 750, height: 1334);
        _sizeRatio = _screenWidth > _screenHeight ? _screenHeight : _screenWidth;
    }

    double setFont(font) {
//        return ScreenUtil().setSp(font, allowFontScalingSelf: false);
//        double size = ScreenUtil().screenWidthDp;
        print("_screenWidth    ===============> " + _screenWidth.toString());
        return font * _sizeRatio / uiWidthPx;
    }

    double setWidth(width) {
//        return ScreenUtil().setWidth(width);
        return width * _sizeRatio / uiWidthPx;
    }

    double setHeight(height) {
//        return ScreenUtil().setHeight(height);
        return height * _sizeRatio / uiWidthPx;
    }

    double searchHeight() {
        return setWidth(60);
    }

    double homeTabsHeight() {
        return setWidth(60);
    }

    double homeBannerHeight() {
        return setWidth(450);
    }
}
