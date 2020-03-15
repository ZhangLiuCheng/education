class MediaItem {
    num id;
    String name;
    String duration;
    String url;
    String cover;
    bool free;
    bool pay;

    @override
    String toString() {
        return "id=$id, icon= $name,desc = $duration";
    }

    MediaItem({
        this.id,
        this.name,
        this.duration,
        this.url,
        this.cover,
        this.free,
        this.pay
    });


    MediaItem.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        duration = json['duration'];
        url = json['url'];
        cover = json['cover'];
        free = json['free'];
        pay = json['pay'];
    }

    Map<String, dynamic> toJson() =>
        {
            'id': id,
            'name': name,
            'duration': duration,
            'url': url,
            'cover': cover,
            'free': free,
            'pay': pay,
        };
}
