import 'package:education/util/ScreenAdapter.dart';
import 'package:flutter/material.dart';

enum LoadingStatus {
    loading,
    empty,
    error,
    hide
}

class LoadingPage extends StatefulWidget {
    
    LoadingStatus status = LoadingStatus.loading;
    Widget child;
    Function onRetry;
    Color backgroundColor;
    String emptyTitle;
    String errorTitle;
    
    LoadingPage({ Key key, LoadingStatus status, this.child, this.onRetry,
        this.backgroundColor = Colors.white,
        this.emptyTitle = "当前数据为空呢～",
        this.errorTitle = "页面加载失败，请检查网络或重新登录"}) : super(key: key) {

        if(null != status) {
            this.status = status;
        }
    }
    
    @override
    State<StatefulWidget> createState() {
        return LoadingPageState();
    }
}

class LoadingPageState extends State<LoadingPage> {

    @override
    Widget build(BuildContext context) {
        return Stack(
                children: <Widget>[
//                    Visibility(
//                        visible: widget.status == LoadingStatus.hide,
//                        child: _buildInnerChild(),
//                    ),
                    AnimatedOpacity(
                        opacity: widget.status == LoadingStatus.hide ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 600),
                        child: _buildInnerChild()
                    ),
                    
                    Visibility(
                        visible: widget.status != LoadingStatus.hide,
                        child: _buildCurPage()
                    )
                ],
        );
    }
    
    _buildCurPage() {
        if(widget.status == LoadingStatus.loading) {
            return _buildLoading();
        } else if(widget.status == LoadingStatus.empty) {
            return _buildEmpty();
        } else {
            return _buildError();
        }
    }
    
    _buildInnerChild() {
        if(widget.child != null) {
            return widget.child;
        }
        return Container(width: 0, height: 0);
    }
    
    _buildLoading() {
        return Center(
            child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        valueColor: AlwaysStoppedAnimation(Color(0xffff2c56))
                    )
                )
            )
        );
    }
    
    _buildEmpty() {
        return Center(
            child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                        Image.asset("images/loading_empty.png",
                        width: 200,
                        height: 200),
                        Text(widget.emptyTitle, style: TextStyle(color: Color(0xff9D999C),
                            fontSize: ScreenAdapter.text(16)))
                    ],
                )
            ),
        );
    }
    
    _buildError() {
        return GestureDetector(
            onTap: () {
                if(null != widget.onRetry) {
                    widget.onRetry();
                }
            },
            child: Center(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                            Image.asset("images/loading_error.png",
                                width: ScreenAdapter.setWidth(300),
                                height: ScreenAdapter.setWidth(300)),
                            Text(widget.errorTitle, style: TextStyle(color: Color(0xff9D999C),
                                fontSize: ScreenAdapter.text(14))),
                            Container(
                                margin: EdgeInsets.only(top: 30),
                                padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff9D999C), width: 0.8),
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                                child: Text("重新加载", style: TextStyle(fontSize: ScreenAdapter.text
                                    (14), color: Color(0xff9D999C))),
                            )
                        ],
                    )
                )
            )
        );
    }
}