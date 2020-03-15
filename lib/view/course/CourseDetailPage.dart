import 'package:chewie/chewie.dart';
import 'package:education/model/bean/MediaItem.dart';
import 'package:education/model/bean/VideoDetail.dart';
import 'package:education/model/http/Api.dart';
import 'package:education/util/ScreenAdapter.dart';
import 'package:education/util/WidgetUtil.dart';
import 'package:education/view/common/CollectWidget.dart';
import 'package:education/view/loading/LoadingPage.dart';
import 'package:education/view/loading/LoadmoreWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orientation/orientation.dart';
import 'package:video_player/video_player.dart';

import 'CouseItem.dart';

class CourseDetailPage extends StatefulWidget {

    num _id;

    CourseDetailPage(this._id);

    @override
    State<StatefulWidget> createState() {
        return _CourseDetailPageState();
    }
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with AutomaticKeepAliveClientMixin {

    LoadingStatus _loadingStatus = LoadingStatus.hide;
    VideoDetail _videoDetail;

    VideoPlayerController videoPlayerController;
    ChewieController chewieController;

    _onRetry() {
        setState(() {
            _loadingStatus = LoadingStatus.loading;
        });
    }

    _mediaItemTap(MediaItem mediaItem) async {
        setState(() {
            _initChewieController(mediaItem.url);
        });
    }

    void _requestVideoDetail() async {
        this._videoDetail = await Api.videoDetail(widget._id);
        setState(() {
            _initChewieController(_videoDetail.mediaList[0].url);
        });
    }

    _initChewieController(String url) {
        chewieController?.dispose();
        videoPlayerController?.pause();
        videoPlayerController?.seekTo(Duration(seconds: 0));

        videoPlayerController = VideoPlayerController.network(url);
        chewieController = ChewieController(
            videoPlayerController: videoPlayerController,
//            aspectRatio: 3 / 2,
            autoPlay: true,
            looping: false,
            showControls: true,
            deviceOrientationsAfterFullScreen: [
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown
            ],
            placeholder: new Container(
                color: Colors.black,
            ),
            autoInitialize: true,
        );

        chewieController.addListener(() {
            if (null != chewieController) {
                OrientationPlugin.forceOrientation(
                    chewieController.isFullScreen ?
                    DeviceOrientation.landscapeRight : DeviceOrientation.portraitUp);
            }
        });
    }

    @override
    bool get wantKeepAlive => false;

    @override
    void initState() {
        super.initState();
        this._requestVideoDetail();
        print("CourseDetailPage ===========>>  initState");
    }

    @override
    void dispose() {
        chewieController?.dispose();
        videoPlayerController?.dispose();
        super.dispose();
        print("CourseDetailPage ===========>>  dispose");
    }

    @override
    Widget build(BuildContext context) {
        print("CourseDetailPage ===========>>  build");
        if (null == this._videoDetail) {
            return Container(width: 0, height: 0);
        }
        return Scaffold(
            appBar: WidgetUtil.buildAppBar(_videoDetail.name),
            body: LoadingPage(
                status: _loadingStatus,
                onRetry: _onRetry,
                emptyTitle: "",
                child: _buildContent()
            )
        );
    }

    _buildContent() {
        return CustomScrollView(
            slivers: <Widget>[
//                _buildImage(),
                _buildVideo(),
                _buildInfo(),
                _buildVip(),
                _buildList()
            ],
        );
    }

    _buildImage() {
        return SliverToBoxAdapter(
            child: WidgetUtil.buildNetworkImage(
                this._videoDetail.icon,
                MediaQuery
                    .of(context)
                    .size
                    .width,
                ScreenAdapter().setWidth(400)
            ),
        );
    }

    _buildVideo() {
        return SliverToBoxAdapter(
            child: Chewie(
                controller: chewieController,
            )
        );
    }

    _buildInfo() {
        return SliverToBoxAdapter(
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                    children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                    Text(_videoDetail.name,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: ScreenAdapter().setFont(34),
                                            fontWeight: FontWeight.bold)
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            top: ScreenAdapter().setWidth(10),
                                            bottom: ScreenAdapter().setWidth(10)),
                                        child: Text(
                                            _videoDetail?.payCount.toString() + "万次播放",
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Color(0xFF333333),
                                                fontSize: ScreenAdapter().setFont(30),
                                            )
                                        )
                                    )
                                ],
                            ),
                        ),
                        CollectWidget(true)
                    ],
                ),
            ),
        );
    }

    _buildVip() {
        double size20 = ScreenAdapter().setWidth(20);
        return SliverToBoxAdapter(
            child: GestureDetector(
                onTap: () {
//                _btnCaurse();
                },
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: size20, bottom: size20),
                    padding: EdgeInsets.only(
                        top: size20,
                        bottom: size20,
                        left: ScreenAdapter().setWidth(50),
                        right: ScreenAdapter().setWidth(50)),
                    height: ScreenAdapter().setWidth(130),
                    decoration: BoxDecoration(
                        color: Colors.white,
                    ),
                    child: Container(
                        constraints: BoxConstraints.expand(),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ScreenAdapter().setWidth(15)),
                            border: Border.all(
                                color: Color(0xFF666666), width: 1
                            )
                        ),
                        child: Text("专享VIP 0.62/天，解锁全部课程内容",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: ScreenAdapter().setFont(30)
                            ),
                        )
                    ),
                )
            )
        );
    }

    _buildList() {
        List<MediaItem> mediaList = _videoDetail.mediaList;
        if (null == mediaList) return Container(width: 0, height: 0);
        return SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context,
                int index) {
                return InkWell(
                    onTap: () {
                        _mediaItemTap(mediaList[index]);
                    },
                    child: Container(
                        padding: EdgeInsets.all(ScreenAdapter().setWidth(20)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(color: Color(0xfff5f5f5))),
                        ),
                        child: Row(
                            children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Text(mediaList[index].name,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: ScreenAdapter().setFont(36)
                                        )
                                    ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        right: ScreenAdapter().setWidth(20)),
                                    child: Text(
                                        "时长 " + mediaList[index].duration,
                                        style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: ScreenAdapter().setFont(30)
                                        )
                                    )
                                ),
                                Image(
                                    image: AssetImage(
                                        "images/video_play.png"),
                                    width: 30,
                                    fit: BoxFit.fitWidth
                                ),
                            ],
                        ),
                    )
                );
            }, childCount: mediaList.length),
        );
    }
}