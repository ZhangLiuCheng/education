import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {

    static double setFont(font) {
        return ScreenUtil().setSp(font);
    }

    static double setWidth(width) {
        return ScreenUtil().setWidth(width);
    }

    static double setHeight(height) {
        return ScreenUtil().setHeight(height);
    }

    static double searchHeight() {
        return setWidth(60);
    }

    static double homeTabsHeight() {
        return setWidth(60);
    }

    static double homeBannerHeight() {
        return setWidth(450);
    }
}
