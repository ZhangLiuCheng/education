
import 'package:education/model/bean/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SPUtil {

    static Future<bool> isFirstOpen() async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        bool isF = preferences.getBool("isFirstOpen") ;
        return isF ??= true;
    }

    static setFirstOpen(bool flag) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool("isFirstOpen", flag);
    }

    static Future<String> getWithdrawAccount() async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        return preferences.getString("withdrawAccount") ;
    }

    static setWithdrawAccount(String account) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("withdrawAccount", account);
    }

    static fetchTaobaoOpenId() async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        return preferences.getString("taobaoOpenId");
    }

    static saveTaobaoOpenId(String taobaoOpenId) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("taobaoOpenId", taobaoOpenId);
    }


    static getToken() async {
        UserInfo userInfo = await fetchUserInfo();
        print("userInfo ---------->  $userInfo");
        if (userInfo != null) {
            return userInfo.token;
        }
        return null;
    }

    static Future fetchUserInfo() async {
        try {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            Map userString =  JsonDecoder().convert(preferences.getString("userInfo"));
            //print('sssssss-${userString['token']}');
            return UserInfo.fromJson(userString);
        } catch (ex) {
            return null;
        }
    }

    static saveUserInfo(UserInfo userInfo) async {
        try {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.setString("userInfo", JsonEncoder().convert(userInfo.toJson()));
        } catch (ex) {
            print("saveUser: $ex");
        }
    }

    static clearUserInfo() async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("userInfo", null);
    }
}
