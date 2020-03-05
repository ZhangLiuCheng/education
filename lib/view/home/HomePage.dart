import 'package:education/util/ScreenAdapter.dart';
import 'package:education/util/SliverHeaderDelegate.dart';
import 'package:education/view/course/CouseItem.dart';
import 'package:education/view/loading/LoadingPage.dart';
import 'package:education/view/loading/LoadmoreWidget.dart';
import 'package:flutter/material.dart';

import 'HomeBanner.dart';

class HomePage extends StatefulWidget {

    @override
    State<StatefulWidget> createState() {
        return HomePageState();
    }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {

    final ScrollController _scrollController = new ScrollController();
    LoadingStatus _loadingStatus = LoadingStatus.hide;

    List<String> _categoryData = ["全部", "校内强化", "童话故事", "作文园地", "电子书", "有声绘本"];

    _itemListener(dynamic item) {
//        Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return GoodsDetailPage(item.item_id.toString());
//        }));
    }

    Future _refresh() async {
//        return await AppStore().configStore.init();
        return null;
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


    @override
    void initState() {
        super.initState();
        print("HomePage ===========>>  initState");
    }

    @override
    void dispose() {
        super.dispose();
        _scrollController.dispose();
        print("HomePage ===========>>  dispose");
    }

    @override
    bool get wantKeepAlive => true;

    @override
    Widget build(BuildContext context) {
        super.build(context);
        print("HomePage ===========>>  build");
        return RefreshIndicator(
            child: LoadingPage(
                status: _loadingStatus,
                onRetry: () {

                },
                child: _buildContent()
            ),
            onRefresh: _refresh
        );
    }

    _buildContent() {
//    if (null == this._categoryData) {
//        return Container(width: 0, height: 0);
//    }
        return CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
                SliverToBoxAdapter(
                    child: HomeBanner(),
                ),
                SliverToBoxAdapter(
                    child: _buildCommon(),
                ),
//                SliverToBoxAdapter(child: _buildHead('分类')),
                _buildCategroy(),
                SliverToBoxAdapter(child: _buildHead('推荐')),
                _buildList(),
                _buildLoadmore()
            ],
        );
    }

    _buildCommon() {
        return Container(
            decoration: new BoxDecoration(
                color: Color(0xFFFFFFFF),
            ),
            margin: EdgeInsets.only(top: ScreenAdapter.setHeight(20)),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: ScreenAdapter.setHeight(100),
            child: Row(
                children: <Widget>[
                    Text("头条",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF009900),
                            fontSize: ScreenAdapter.setFont(36))
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("常见问题解答",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: ScreenAdapter.setFont(30))
                        )
                    )
                ],
            ),
        );
    }

    _buildHead(title) {
        double size20 = ScreenAdapter.setWidth(20);
        return Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: size20, top: size20, bottom: size20),
            margin: EdgeInsets.only(top: size20),
            child: Text(
                title,
                style: TextStyle(
                    fontSize: ScreenAdapter.setFont(36),
                    color: Color(0xff333333),
                    fontWeight: FontWeight.normal),
            ),
        );
    }

    // 分类
    _buildCategroy() {
        return SliverToBoxAdapter(
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: ScreenAdapter.setHeight(20)),
                child: GridView.builder(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _categoryData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 2.6,
                    ),
                    itemBuilder: (context, index) {
                        return _buildCategoryItem(index);
                    }
                )
            ),
        );
    }

    _buildCategoryItem(index) {
        return GestureDetector(
            onTap: () {
//                _btnSubCategory(sc);
            },
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(0xFFE6E6E6), width: 1)
                ),
                child: Text(_categoryData[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: ScreenAdapter.setFont(30)),
                ),
            )
        );
    }

    _buildList() {
        return SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context,
                int index) {
                return CouseItem("", _itemListener);
            }, childCount: 5),
        );
    }

    _buildLoadmore() {
//        int defaultStatus = (page == 1 && _goodsData.length < 10) ? 1 : 0;
        return SliverToBoxAdapter(
            child: LoadmoreWidget(_scrollController,
                status: 1, loadmoreCallback: _loadmore));
    }
}
