import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/util/ScreenAdapter.dart';
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
                        _buildListItemImg(""),
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
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: goodsImg,
                width: _sizeWidth,
                height: _sizeHeight,
                placeholder: (context, url) {
                    return Container(
                        width: _sizeWidth,
                        height: _sizeHeight,
                        alignment: Alignment.center,
                        color: Color(0xffe0e0e0),
                        child: Image.asset("images/default_goods.png",
                            fit: BoxFit.contain,
                            width: _sizeWidth,
                            height: _sizeHeight),
                    );
                },
                errorWidget: (context, url, error) => Icon(Icons.error),
            ),
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
