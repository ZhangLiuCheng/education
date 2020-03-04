import 'package:education/util/CommonUtil.dart';
import 'package:education/util/ScreenAdapter.dart';
import 'package:education/view/loading/LoadingPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
    Function jumpToIndex;

    HomePage({this.jumpToIndex, Key key}) : super(key: key);

    @override
    State<StatefulWidget> createState() {
        return HomePageState();
    }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
    LoadingStatus _loadingStatus = LoadingStatus.loading;

    bool showCategory = false;

    TabController _tabController;

    setHideCategory() {
        setState(() {
            showCategory = false;
        });
    }

    onCategoryListener(index) {
        //setHideCategory();
        if (index > -1) {
            _tabController.animateTo(index);
        }
    }

    _btnCategory() {
        setState(() {
            showCategory = !showCategory;
        });
    }

//  _initControler() {
//    if (null == _tabController) {
//      _tabController = TabController(length: _categoryData.length, vsync: this);
//      _tabController.addListener(() {
////        setHideCategory();
//      });
//    }
//  }

    void initData() {
//    List<Category> categoryList = AppStore().categoryStore.value;
//    if (null != categoryList) {
//      if (null == _categoryData) {
//        _categoryData = CommonUtil.filterCategory(categoryList);
//        _initControler();
//        setState(() {});
//        _getLastVersion();
//      }
//      _loadingStatus = LoadingStatus.hide;
//    } else if (AppStore().categoryStore.error != null) {
//      _loadingStatus = LoadingStatus.error;
//    } else {
//      _loadingStatus = LoadingStatus.loading;
//    }
    }

    Future _getLastVersion() async {
//    PackageInfo _packageInfo = await PackageInfo.fromPlatform();
//    Api.getLastVersion(Platform.isAndroid ? 1 : 2, 001).then((data) {
//      VersionInfo versionInfo = data;
//      if (versionInfo.version != _packageInfo.version) {
//        HintDialog.show(context, '发现新版本', versionInfo.info, _updateApk,
//            showOneBtn: false);
//      }
//    });
    }

    @override
    void initState() {
        super.initState();
//    AppStore().categoryStore.addListener(initData);
//        print("HomePage ===========>>  initState");
    }

    @override
    void dispose() {
        super.dispose();
        _tabController.dispose();
//    AppStore().categoryStore.removeListener(initData);
//        print("HomePage ===========>>  dispose");
    }

    @override
    bool get wantKeepAlive => true;

    @override
    Widget build(BuildContext context) {
        super.build(context);
//        print("HomePage ===========>>  build");
        return LoadingPage(
            status: _loadingStatus,
            onRetry: () {
//                AppStore().categoryStore.init();
//          AppStore().init();
            },
            child: _buildContent());
    }

    _buildContent() {
//    if (null == this._categoryData) {
        return Container(width: 0, height: 0);
//    }
//    _statusBarHeight = MediaQuery.of(context).padding.top + 10;
//    _searchAndTabsHeight = ScreenAdapter.searchHeight() +
//        _statusBarHeight +
//        ScreenAdapter.homeTabsHeight() +
//        3;
//    _offsetDivisor = ScreenAdapter.homeBannerHeight() - _searchAndTabsHeight;
//    return Stack(
//      children: <Widget>[
//        _buildTabBarView(_categoryData),
//        _buildTabAndSearch(),
//        //_buildCategoryView()
//      ],
//    );
    }

//  _buildTabAndSearch() {
//    return Stack(
//      children: <Widget>[
//        HomeSearchAndTabsBg(_searchAndTabsHeight, HTKey),
//        Column(
//          children: <Widget>[
//            Container(
//                height: ScreenAdapter.searchHeight() + _statusBarHeight,
//                //color: Color(0xFFF50033),
//                padding: EdgeInsets.only(top: _statusBarHeight),
//                child: _buildSearch()),
//            HomeTabsWidget(_tabController, _categoryData),
//          ],
//        )
//      ],
//    );
//  }

//  _buildTabBarView(List<Category> categoryData) {
//    List<Widget> tabViews = [];
//    for (int i = 0; i < categoryData.length; i++) {
//      if (i == 0) {
//        tabViews.add(ChoicenessWidget(widget.jumpToIndex,topOffset: onScroll));
//      } else {
//        tabViews.add(UsuallyWidget(categoryData[i], _searchAndTabsHeight));
//      }
//    }
//
//    return TabBarView(
//      children: tabViews,
//      controller: _tabController,
//    );
//  }

//  _buildCategoryView() {
//    return Visibility(
//      visible: showCategory,
//      child: HomeCategory(onCategoryListener, _categoryData),
//    );
//  }

    // 搜索布局
//  _buildSearch() {
//    return Row(
//      children: <Widget>[
//        Padding(
//          padding: EdgeInsets.only(left: 5, right: 3),
//          child: InkWell(
//            onTap: _btnMyCart,
//            child: Image.asset(
//              'images/icon_my_cart.png',
//              width: ScreenAdapter.setWidth(70),
//              height: ScreenAdapter.setWidth(70),
//              color: Color(0xffffffff),
//            ),
//          ),
//        ),
//        Expanded(
//            flex: 1,
//            child: GestureDetector(
//                onTap: _btnSearch, child: _buildSearchContent())),
//        HomeMessageIcon(false)
////                _buildPublish()
//      ],
//    );
//  }

    _buildSearchContent() {
        return Container(
            height: ScreenAdapter.setWidth(75),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(right: 5),
            //padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF8F8F7), width: 1.0),
                color: Color(0xFFF8F8F7),
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Image(
                        image: AssetImage("images/search.png"),
                        width: ScreenAdapter.setWidth(36),
                        height: ScreenAdapter.setHeight(36),
                        color: Color(0xffb8b8b8),
                    ),
                    Text("搜索商品或粘贴淘宝标题",
                        style: TextStyle(
                            fontSize: ScreenAdapter.setFont(22),
                            color: Color(0xffb8b8b8))),
                ],
            ),
        );
    }

//  onScroll(double offset) {
//    double alpha = offset.abs() / _offsetDivisor;
//    if (alpha < 0) {
//      alpha = 0;
//    } else if (alpha > 1) {
//      alpha = 1;
//    }
//    if (offset <= _offsetDivisor) {
//      HTKey.currentState.setAlpha(alpha);
//      //TabBarKey.currentState.setAlpha(alpha);
//    }
//  }
}
