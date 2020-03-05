import 'package:education/util/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 首页广告
class HomeBanner extends StatefulWidget {

    @override
    State<StatefulWidget> createState() {
        return _HomeBannerState();
    }
}

class _HomeBannerState extends State<HomeBanner> {

    @override
    Widget build(BuildContext context) {
        return _buildViewPager();
    }

    _clickItem(int index) async {
    }

    _buildViewPager() {
        double height = ScreenAdapter.homeBannerHeight();
        List<String> data = [
            "https://tbk-assets.oss-cn-shanghai.aliyuncs.com/banner/%E7%A7%8D%E8%8D%89%E7%94%9F%E6%B4%BB%E6%97%A5.png",
            "https://tbk-assets.oss-cn-shanghai.aliyuncs.com/banner/%E5%85%A8%E7%90%83%E7%B2%BE%E9%80%89.png"
        ];
        return Container(
            height: height,
            color: Colors.white,
            child: Swiper(
                onTap: _clickItem,
                autoplay: true,
                duration: 500,
                autoplayDelay: 3000,
                itemCount: data.length,
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white30,
                        activeColor: Colors.white,
                        space: 3,
                        activeSize: 6,
                        size: 6
                    )
                ),
                itemBuilder: (BuildContext context, int index) {
                    return _buildBannerImage(data[index]);
                }
            )
        );
    }

    _buildBannerImage(String url) {
        return Image(
            image: NetworkImage(url),
            fit: BoxFit.fill,
        );

//        return CachedNetworkImage(
//            fit: BoxFit.cover,
//            imageUrl: url,
//            placeholder: (context, url) {
//                return Container(
//                    color: Color(0xffe0e0e0),
//                    alignment: Alignment.center,
//                    child: Image.asset(
//                        "images/default_goods.png", fit: BoxFit.contain,
//                        width: 150,
//                        height: 150),
//                );
//            },
//            errorWidget: (context, url, error) => Icon(Icons.error),
//        );
    }
}