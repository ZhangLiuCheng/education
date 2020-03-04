import 'package:flutter/material.dart';

typedef LoadmoreCallback = Future<int> Function();

class LoadmoreWidget extends StatefulWidget {
  final ScrollController _scrollController;

  LoadmoreCallback _loadmoreCallback;

  int _status = 0; // 0 加载中， 1 没有更多, 2 加载失败，点击刷新

  LoadmoreWidget(this._scrollController,
      {Key key, int status = 0, LoadmoreCallback loadmoreCallback})
      : super(key: key) {
    this._loadmoreCallback = loadmoreCallback;
    this._status = status;
//        print("LoadmoreWidget -------111----  构造方法");
  }

  @override
  State<StatefulWidget> createState() {
    return _LoadmoreWidgetState();
  }
}

class _LoadmoreWidgetState extends State<LoadmoreWidget> {
  _LoadmoreWidgetState() {
//        print("LoadmoreWidgetState ------222-----  构造方法");
  }

  _invokeCallback() async {
    if (!mounted) {
      return;
    }
    setState(() {
      widget._status = 0;
    });
    int status = await widget._loadmoreCallback();
    if (mounted) {
      setState(() {
        widget._status = status;
      });
    }
  }

  _scrollListener() {
    ScrollController _scrollController = widget._scrollController;

    double maxScroll = _scrollController.position.maxScrollExtent;
    double pixel = _scrollController.position.pixels;
    if (maxScroll == pixel && widget._status != 1) {
      if (mounted) {
        _invokeCallback();
      }
    } else {
//            print("滑动中  --------   $maxScroll    $pixel");
    }
  }

  @override
  void initState() {
    super.initState();
    widget._scrollController.addListener(_scrollListener);
//        print("LoadmoreWidgetState -----------  initState");
  }

  @override
  void dispose() {
    super.dispose();
    widget._scrollController.removeListener(_scrollListener);
//        print("LoadmoreWidgetState -----------  dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      color: Color(0xffffffff),
      child: _buildContent(),
    );
  }

  _buildContent() {
    if (widget._status == 0) {
      return _buildLoading();
    } else if (widget._status == 1) {
      return _buildNoMore();
    } else {
      return _buildError();
    }
  }

  _buildLoading() {
//        return Text("加载中");
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
          strokeWidth: 1.5,
          valueColor: AlwaysStoppedAnimation(Color(0xFFFF6633))),
    );
  }

  _buildNoMore() {
    return Text("没有更多了");
  }

  _buildError() {
    return InkWell(onTap: _invokeCallback, child: Text("加载失败,点击重试"));
  }
}
