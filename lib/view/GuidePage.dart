import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'MainPage.dart';

class GuidePage extends StatefulWidget {

    @override
    State<StatefulWidget> createState() {
        return _GuidePageState();
    }
}

class _GuidePageState extends State<GuidePage> {

    bool _useBtnVisible = false;

    int page = 0;

    List _data = [
        "images/guide_1.jpg",
        "images/guide_2.jpg",
        "images/guide_3.jpg"
    ];

    _btnToMainPage() {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
                return MainPage();
            })
        );
//        Navigator.of(context).pushNamed("/mainPage");
    }

    _onIndexChanged(index) {
        _useBtnVisible = _data.length == (index + 1);
        setState(() {});
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: <Widget>[
                    _buildSwiper(),
//                    _buildBtnUse()
                ],
            )
        );
    }

    _buildSwiper() {
        return Swiper(
            duration: 500,
            loop: false,
            itemCount: _data.length,
            physics: ClampingScrollPhysics(),
            onIndexChanged: _onIndexChanged,
            onTap: (index) {
                if (index == 2) {
                    _btnToMainPage();
                }
            },
//            pagination: new SwiperPagination(
//                margin: EdgeInsets.only(bottom: 50),
//                builder: DotSwiperPaginationBuilder(
//                    color: Colors.black54,
//                    activeColor: Color(0xFFFF6633),
//                    size: 6,
//                    activeSize: 8
//                )
//            ),
            itemBuilder: (BuildContext context, int index) {
                return Image(
                    image: AssetImage(_data[index]),
                    fit: BoxFit.cover,
                );
            }
        );
    }

    _buildBtnUse() {
        return Visibility(
            visible: _useBtnVisible,
            child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 40),
                child: FlatButton(
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("      立即体验      "),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                        _btnToMainPage();
                    },
                ),
            ),
        );
    }
}