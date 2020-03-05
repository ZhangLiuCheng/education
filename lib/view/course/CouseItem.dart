import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/util/ScreenAdapter.dart';
import 'package:education/util/WidgetUtil.dart';
import 'package:flutter/material.dart';

class CouseItem extends StatelessWidget {
    dynamic item;

    Function itemListener;

    CouseItem(item, itemListener) {
        this.item = item;
        this.itemListener = itemListener;
    }

    @override
    Widget build(BuildContext context) {
        return this._buildListItem(this.item);
    }

    _buildListItem(item) {
        double size20 = ScreenAdapter.setWidth(20);
        double size30 = ScreenAdapter.setWidth(30);

        return InkWell(
            onTap: () {
                this.itemListener(this.item);
            },
            child: Container(
                padding: EdgeInsets.only(
                    left: size20, right: size20, top: size30, bottom: size30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(color: Color(0xfff5f5f5))),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        _buildListItemImg("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583407877438&di=bafb8c48712e565ea6730345ae21b31b&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F0dd7912397dda144dac4acc9b2b7d0a20df486f8.jpg"),
                        Expanded(flex: 1, child: _buildListItemDesc(item))
                    ],
                ),
            ));
    }

    _buildListItemImg(goodsImg) {
        double _sizeWidth = ScreenAdapter.setWidth(260);
        double _sizeHeight = ScreenAdapter.setWidth(200);
        return ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: WidgetUtil.buildNetworkImage(goodsImg, _sizeWidth, _sizeHeight),
        );
    }

    _buildListItemDesc(dynamic item) {
        return Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Text("古诗三百首",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Color(0xFF333333),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            top: ScreenAdapter.setWidth(10),
                            bottom: ScreenAdapter.setWidth(10)),
                        child: Text("我是介绍我是介绍我是介绍我是介绍我是介绍我是介绍我是介绍我是介绍我是介绍",
                            style: TextStyle(
                                color: Color(0xFF464646),
                                fontSize: ScreenAdapter.setFont(26)),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2)
                    ),
                    Text("1.2万次播放",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Color(0xFF333333),
                            fontSize: 14,
                        )
                    ),
                ],
            ),
        );
    }
}
