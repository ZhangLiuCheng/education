import 'package:education/util/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CollectWidget extends StatefulWidget {

    bool isCollected;

    CollectWidget(this.isCollected);

    @override
    State<StatefulWidget> createState() {
        return CollectWidgetState();
    }
}

class CollectWidgetState extends State<CollectWidget> {

    _btnCollect() async {
        widget.isCollected = widget.isCollected ? false : true;
        setState(() {});

//        Api.collect(widget.token, widget.itemID).then((data) {
//            _collect = data;
//            if (_collect.action == 'add') {
//                widget.collectIsAdd = true;
//                _showToast('已添加到收藏');
//            } else {
//                widget.collectIsAdd = false;
//                _showToast('已取消收藏');
//            }
//            setState(() {});
//        }).catchError((err) {
//            Toast.show(err.message, context,
//                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
//        });
    }

    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return _buildContent();
    }

    _buildContent() {
        return GestureDetector(
            onTap: _btnCollect,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    Image(
                        image: AssetImage(widget.isCollected
                            ? "images/icon_collect_on.png"
                            : "images/icon_collect_off.png"),
                        width: 22,
                        fit: BoxFit.fitWidth),
                    Text("收藏",
                        style: TextStyle(
                            fontSize: ScreenAdapter.setFont(26),
                            color: widget.isCollected
                                ? Color(0xffff2c56)
                                : Color(0xff333333)))
                ],
            ),
        );
    }

    _showToast(String msg) {
        Toast.show(msg, context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
    }
}
