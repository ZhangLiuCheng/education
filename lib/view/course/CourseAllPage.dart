import 'package:education/util/ScreenAdapter.dart';
import 'package:education/util/WidgetUtil.dart';
import 'package:education/view/loading/LoadingPage.dart';
import 'package:education/view/loading/LoadmoreWidget.dart';
import 'package:flutter/material.dart';

import 'CourseDetailPage.dart';
import 'CouseItem.dart';

class CourseAllPage extends StatefulWidget {

    @override
    State<StatefulWidget> createState() {
        return _CourseAllPageState();
    }
}

class _CourseAllPageState extends State<CourseAllPage> {

    final ScrollController _scrollController = new ScrollController();
    LoadingStatus _loadingStatus = LoadingStatus.hide;

    List<String> _categoryData = ["全部", "校内强化", "童话故事", "作文园地", "电子书", "有声绘本"];

    _onRetry() {
        setState(() {
            _loadingStatus = LoadingStatus.loading;
        });
//        _getItemDetail();
    }

    _btnCaurse() {
//        Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return CourseAllPage();
//        }));
    }

    _itemListener(dynamic item) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CourseDetailPage();
        }));
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
            backgroundColor: Colors.white,
            appBar: WidgetUtil.buildAppBar("全部课程"),
            body: LoadingPage(
                status: _loadingStatus,
                onRetry: _onRetry,
                emptyTitle: "",
                child: RefreshIndicator(
                    onRefresh: _getItemDetail, child: _buildContent()
                )
            )
        );
    }

    _buildContent() {
        return CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
                _buildCategroy(),
                _buildList(),
                _buildLoadmore()
            ],
        );
    }

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
                _btnCaurse();
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