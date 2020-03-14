class VideoItem {
    num id;
    String name;
    String icon;
    String desc;
    num payCount;

    @override
    String toString() {
        return "id=$id, icon= $icon,desc = $desc";
    }

    VideoItem({
        this.id,
        this.name,
        this.icon,
        this.desc,
        this.payCount
    });


    VideoItem.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        icon = json['icon'];
        desc = json['desc'];
        payCount = json['payCount'];
    }

    Map<String, dynamic> toJson() =>
        {
            'id': id,
            'name': name,
            'icon': icon,
            'nickname': desc,
            'payCount': payCount,
        };
}
