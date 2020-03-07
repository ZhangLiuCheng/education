import 'package:education/model/bean/Category.dart';
import 'DioUtil.dart';

class Api {


    /// 视频分类
    static Future categoryList() {
        return DioUtil.get("/api/serial/categoryList", null, (data) {
//            return Category.fromJson(data);
            return (data as List)?.map((l) => Category.fromJson(l))?.toList();
        });
    }


/// 更新用户信息
/// "file": new UploadFileInfo(File("./example/upload.txt"), "upload.txt")
///
//    static Future updateUserInfo(String token, {String nickname, File avator,String wechat_id}) async {
//        Map<String, dynamic> param = {"token": token};
//        if (nickname != null && nickname.isNotEmpty) {
//            param["nickname"] = nickname;
//        }
//        if (null != avator && await avator.exists()) {
//            param["avator"] = new UploadFileInfo(avator, "avator.png");
//        }
//        if (null!=wechat_id && wechat_id.isNotEmpty) {
//            param["wechat_id"] = wechat_id;
//        }
//        return DioUtil.upload("/api/user/change-nickname-and-avator", param, (data) {
//            return data;
//        });
//    }


/// 获取自己的订单数据 0 全部订单，1：create, 2:confirm,3cancel
//    static Future getSelfOrder(String token, {status = 0,page = 1}) {
//        return DioUtil.get("/api/order/get-self-order", {"token": token,"status":status, "page": page}, (data) {
//            return (data as List)?.map((l)=>OrderDetails.fromJson(l))?.toList();
//        });
//    }

}