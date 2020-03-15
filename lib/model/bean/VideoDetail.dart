import 'package:education/model/bean/MediaItem.dart';

class VideoDetail {
    num id;
    String name;
    String icon;
    String desc;
    num payCount;
    List<MediaItem> mediaList;

    @override
    String toString() {
        return "id=$id, icon= $icon,desc = $desc";
    }

    VideoDetail({
        this.id,
        this.name,
        this.icon,
        this.desc,
        this.payCount
    });


    VideoDetail.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        icon = json['icon'];
        desc = json['desc'];
        payCount = json['payCount'];
        mediaList = (json['mediaList'] as List)
            ?.map((l) => MediaItem.fromJson(l))
            ?.toList();
    }

    Map<String, dynamic> toJson() =>
        {
            'id': id,
            'name': name,
            'icon': icon,
            'nickname': desc,
            'payCount': payCount,
            'mediaList': mediaList?.map((it) => it.toJson())?.toList()
        };
}
