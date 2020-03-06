import 'package:education/util/ScreenAdapter.dart';
import 'package:education/util/WidgetUtil.dart';
import 'package:education/view/common/CollectWidget.dart';
import 'package:education/view/loading/LoadingPage.dart';
import 'package:education/view/loading/LoadmoreWidget.dart';
import 'package:flutter/material.dart';

import 'CouseItem.dart';

class CourseDetailPage extends StatefulWidget {

    @override
    State<StatefulWidget> createState() {
        return _CourseDetailPageState();
    }
}

class _CourseDetailPageState extends State<CourseDetailPage> {

    LoadingStatus _loadingStatus = LoadingStatus.hide;

    List<String> _categoryData = ["全部", "校内强化", "童话故事", "作文园地", "电子书", "有声绘本"];

    _onRetry() {
        setState(() {
            _loadingStatus = LoadingStatus.loading;
        });
//        _getItemDetail();
    }

    _itemListener(dynamic item) {
//        Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return GoodsDetailPage(item.item_id.toString());
//        }));
    }

    Future<int> _loadmore() async {
//        page++;
//        try {
//            List<Goods> result = await Api.favorites("19594037", page: page);
//            if (result == null || result.length == 0) {
//                page--;
//                return 1;
//            } else {
//                _goodsData.addAll(result);
//                setState(() {});
//            }
//        } catch (error) {
//            page--;
//            return 2;
//        }
        return 0;
    }

    Future _getItemDetail() async {
//        token = await SPUtil.getToken();
//        try {
//            _goodsData = await Api.search(token, widget.itemID.toString());
//            goods = _goodsData[0];
//            //print('ssssss${goods.bannerImages}');
//            if (goods != null) {
//                _loadingStatus = LoadingStatus.hide;
//                collectIsAdd = goods.is_like;
//                _requestTpwdCreate();
//            }
//        } catch (error) {
//            _loadingStatus = LoadingStatus.error;
//        }
        setState(() {});
        return null;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: WidgetUtil.buildAppBar("中国近代史"),
            body: LoadingPage(
                status: _loadingStatus,
                onRetry: _onRetry,
                emptyTitle: "",
                child: _buildContent()
            )
        );
    }

    _buildContent() {
        return CustomScrollView(
            slivers: <Widget>[
                _buildImage(),
                _buildInfo(),
                _buildVip(),
                _buildList()
            ],
        );
    }

    _buildImage() {
        return SliverToBoxAdapter(
            child: WidgetUtil.buildNetworkImage(
                "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1651554874,1038135045&fm=26&gp=0.jpg",
                MediaQuery
                    .of(context)
                    .size
                    .width,
                ScreenAdapter.setWidth(400)
            ),
        );
    }

    _buildInfo() {
        return SliverToBoxAdapter(
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                    children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                    Text("中国近代史解说07034",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: ScreenAdapter.setFont(34),
                                            fontWeight: FontWeight.bold)
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            top: ScreenAdapter.setWidth(10),
                                            bottom: ScreenAdapter.setWidth(10)),
                                        child: Text("1.2万次播放",
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Color(0xFF333333),
                                                fontSize: ScreenAdapter.setFont(
                                                    30),
                                            )
                                        )
                                    )
                                ],
                            ),
                        ),
                        CollectWidget(true)
                    ],
                ),
            ),
        );
    }

    _buildVip() {
        double size20 = ScreenAdapter.setWidth(20);
        return SliverToBoxAdapter(
            child: GestureDetector(
                onTap: () {
//                _btnCaurse();
                },
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: size20, bottom: size20),
                    padding: EdgeInsets.only(
                        top: size20,
                        bottom: size20,
                        left: ScreenAdapter.setWidth(50),
                        right: ScreenAdapter.setWidth(50)),
                    height: ScreenAdapter.setWidth(130),
                    decoration: BoxDecoration(
                        color: Colors.white,
                    ),
                    child:
                    Container(
                        constraints: BoxConstraints.expand(),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ScreenAdapter.setWidth(15)),
                            border: Border.all(
                                color: Color(0xFF666666), width: 1
                            )
                        ),
                        child: Text("专享VIP 0.62/天，解锁全部课程内容",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: ScreenAdapter.setFont(30)
                            ),
                        )
                    ),
                )
            )
        );
    }

    _buildList() {
        return SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context,
                int index) {
                return Container(
                    padding: EdgeInsets.all(ScreenAdapter.setWidth(20)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(color: Color(0xfff5f5f5))),
                    ),
                    child: Row(
                        children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Text("课程标题 " + index.toString(),
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: ScreenAdapter.setFont(36)
                                    )
                                ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    right: ScreenAdapter.setWidth(20)),
                                child: Text("时长 20:55",
                                    style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: ScreenAdapter.setFont(30)
                                    )
                                )
                            ),
                            Image(
                                image: AssetImage(
                                    "images/video_play.png"),
                                width: 30,
                                fit: BoxFit.fitWidth
                            ),
                        ],
                    ),
                );
            }, childCount: 8),
        );
    }
}