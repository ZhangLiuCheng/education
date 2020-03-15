import 'package:dio/dio.dart';

class DioUtil {

    static Dio getDio() {
        BaseOptions options = new BaseOptions(
            baseUrl: "http://106.14.141.179:8080",
//            baseUrl: "http://api.chyxapp.com",
            connectTimeout: 5000,
            receiveTimeout: 20000,
        );
        Dio dio = Dio(options);
//        bool isProxyChecked = false;
//        String proxy = '192.168.2.2:8888';
//        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
//            client.badCertificateCallback =
//                (X509Certificate cert, String host, int port) {
//                return isProxyChecked && Platform.isAndroid;
//            };
//            client.findProxy = (uri) {
//                return isProxyChecked ? 'PROXY $proxy' : 'DIRECT';
//            };
//        };

        dio.interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
//            print("onRequest: ${options.uri}");
            return options;
        }, onResponse: (Response response) {
//            print("onResponse: $response");
            return response;
        }, onError: (DioError e) {
            print("onError: $e");
            return e;
        }));
        return dio;
    }

    static Future http(url, params, convert, method) async {
        try {
            Response response;
            if (method == "post") {
                response = await getDio().post(url, queryParameters: params);
            } else {
                response = await getDio().get(url, queryParameters: params);
            }
            if (response.statusCode == 200) {
                Map<String, dynamic> result = response.data;
                if (result["code"] == 0) {
                    if (result.containsKey("data")) {
                        return convert(result["data"]);
                    }
                    return convert(result);
                }
                throw Exception(result["message"]);
            }
        } catch (e) {
            if (e is DioError) {
                throw Exception("请检查网络连接");
            } else {
                throw Exception(e.message ?? "请求异常");
            }
        }
    }

    static Future get(url, params, convert) {
        return http(url, params, convert, "get");
    }

    static Future post(url, params, convert) {
        return http(url, params, convert, "post");
    }

    static Future upload(url, params, convert) async {
        try {
            FormData formData = new FormData.from(params);
            Response response = await getDio().post(url, data: formData);
            if (response.statusCode == 200) {
                Map<String, dynamic> result = response.data;
                if (result["code"] == 0) {
                    return convert(result["data"]);
                }
                throw Exception(result["message"]);
            }
        } catch (e) {
            throw Exception(e.message ?? "请求异常");
        }
    }
}
