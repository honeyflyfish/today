import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:intl/intl.dart';
import 'package:today/ui/ui_base.dart';
import 'package:today/data/repository/message_model.dart';
import 'package:today/ui/message.dart';
import 'package:today/data/repository/comment_model.dart';

final DateFormat _dateFormat = DateFormat('MM/dd HH:mm');

/// 消息详情
class MessageDetailPage extends StatefulWidget {
  final String id;
  final String ref;
  final String pageName;

  MessageDetailPage({@required this.id, this.ref, this.pageName});

  @override
  State<StatefulWidget> createState() {
    return _MessageDetailState();
  }
}

class _MessageDetailState extends State<MessageDetailPage>
    with AfterLayoutMixin<MessageDetailPage> {
  final MessageModel _messageModel = MessageModel();
  final GlobalKey<PhoenixHeaderState> _refreshHeaderKey = GlobalKey();
  final GlobalKey<BallPulseFooterState> _loadMoreFooterKey = GlobalKey();
  final GlobalKey<__CommentListWidgetState> _commentListKey = GlobalKey();

  @override
  void afterFirstLayout(BuildContext context) {
    _messageModel.requestMessageDetail(widget.id,
        ref: widget.ref, pageName: widget.pageName);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MessageModel>(
      model: _messageModel,
      child: ScopedModelDescendant<MessageModel>(
        builder: (BuildContext context, Widget child, MessageModel model) {
          if (model.message == null) {
            return NormalPage(
              body: PageLoadingWidget(),
              title: NormalTitle('动态详情'),
            );
          }

          Message message = model.message;
          UserInfo user = message.user;

          return NormalPage(
            title: NormalTitle('动态详情'),
            body: EasyRefresh(
                refreshHeader: PhoenixHeader(
                  key: _refreshHeaderKey,
                ),
                refreshFooter: BallPulseFooter(
                  key: _loadMoreFooterKey,
                  backgroundColor: Colors.transparent,
                  color: AppColors.accentColor,
                ),
                onRefresh: () {
                  afterFirstLayout(context);
                  _commentListKey.currentState.refreshData();
                },
                loadMore: () {
                  _commentListKey.currentState.refreshData(loadMore: true);
                },
                firstRefresh: false,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.primaryPadding),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.primaryPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: AppDimensions.primaryPadding,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                AppNetWorkImage(
                                  src: user.avatarImage.thumbnailUrl,
                                  width: 40,
                                  height: 40,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                SizedBox(
                                  width: AppDimensions.primaryPadding,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ScreenNameWidget(user: user),
                                    SizedBox(
                                      height: AppDimensions.smallPadding,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          _dateFormat.format(
                                              DateTime.parse(message.createdAt)
                                                  .toLocal()),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.tipsTextColor),
                                        ),
                                        Builder(builder: (_) {
                                          if (message.poi == null)
                                            return SizedBox();

                                          return Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width:
                                                    AppDimensions.smallPadding,
                                              ),
                                              Image.asset(
                                                  'images/ic_personaltab_activity_add_location.png'),
                                              SizedBox(
                                                width:
                                                    AppDimensions.smallPadding,
                                              ),
                                              Text(
                                                message.poi.name,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: AppColors
                                                        .tipsTextColor),
                                              )
                                            ],
                                          );
                                        }),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.blue,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: GestureDetector(
                                    onTap: () {},
                                    behavior: HitTestBehavior.opaque,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      child: Text(
                                        '关注',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.primaryPadding / 2 * 3,
                                ),
                                Image.asset(
                                    'images/ic_messages_collect_unselected.png'),
                              ],
                            ),
                            SizedBox(
                              height: AppDimensions.smallPadding,
                            ),
                            RichTextWidget(
                              message,
                              showFullContent: true,
                            ),
                            MessageBodyWidget(message),
                            LinkInfoWidget(message),
                            SizedBox(
                              height: AppDimensions.primaryPadding,
                            ),
                            _createTopic(message),
                            SizedBox(
                              height: AppDimensions.primaryPadding,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.primaryPadding),
                              child: Divider(
                                height: 1,
                                color: AppColors.dividerGrey,
                              ),
                            ),
                            CommentWidget(bodyItem: message),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: _RelatedWidget(
                        listRelated: model.listRelated,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: _CommentListWidget(message, _commentListKey),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }

  Widget _createTopic(Message message) {
    Topic topic = message.topic;

    return Container(
      color: AppColors.topicBackground,
      padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.primaryPadding,
          vertical: AppDimensions.smallPadding),
      child: Row(
        children: <Widget>[
          AppNetWorkImage(
            src: topic.squarePicture.thumbnailUrl,
            width: 35,
            height: 35,
            borderRadius: BorderRadius.circular(5),
          ),
          SizedBox(
            width: AppDimensions.primaryPadding,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  topic.content,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).primaryTextTheme.subtitle,
                ),
                SizedBox(
                  height: AppDimensions.smallPadding,
                ),
                LayoutBuilder(
                  builder: (context, layout) {
                    return Text(topic.subscribersDescription,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColors.tipsTextColor, fontSize: 11));
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.blue, width: 1),
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle),
            child: Center(
              child: Text(
                '加入',
                style: TextStyle(fontSize: 12, color: AppColors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _RelatedWidget extends StatelessWidget {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  final List<Message> listRelated;

  _RelatedWidget({this.listRelated = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: AppDimensions.primaryPadding),
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.primaryPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: AppDimensions.primaryPadding,
          ),
          Text(
            '相关推荐',
            style: TextStyle(color: AppColors.primaryTextColor),
          ),
          SizedBox(
            height: AppDimensions.primaryPadding,
          ),
          Divider(
            height: 1,
            color: AppColors.dividerGrey,
          ),
          SizedBox(
            height: 100,
            child: LayoutBuilder(
              builder: (_, layout) {
                return PageView.builder(
                  itemBuilder: (_, index) {
                    Message item = listRelated[index];
                    return Transform.translate(
                      offset: Offset(-(layout.maxWidth * 0.1 / 2), 0),
                      child: Row(
                        children: <Widget>[
                          Builder(
                            builder: (_) {
                              String imgUrl =
                                  item.user.avatarImage.thumbnailUrl;

                              if (item.video != null) {
                                imgUrl = item.video.image.thumbnailUrl;
                              } else if (item.pictures.isNotEmpty) {
                                imgUrl = item.pictures.first.thumbnailUrl;
                              } else if (item.linkInfo != null) {
                                imgUrl = item.linkInfo.pictureUrl;
                              }

                              if (imgUrl.isEmpty) {
                                return SizedBox();
                              }

                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  AppNetWorkImage(
                                    src: imgUrl,
                                    height: 70,
                                    width: 70,
                                  ),
                                  _createImageType(listRelated[index]),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            width: AppDimensions.primaryPadding,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: AppDimensions.smallPadding / 2),
                                    child: Text(
                                      item.content,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: AppDimensions.smallPadding / 2),
                                    child: Row(
                                      children: <Widget>[
                                        Opacity(
                                          child: Image.asset(
                                            'images/ic_personal_tab_my_topic.png',
                                            color: Colors.white,
                                            colorBlendMode: BlendMode.color,
                                            width: 18,
                                            height: 18,
                                          ),
                                          opacity: 0.8,
                                        ),
                                        SizedBox(
                                          width: AppDimensions.smallPadding / 2,
                                        ),
                                        Text(
                                          item.topic.content,
                                          style: TextStyle(
                                              color: AppColors.tipsTextColor,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.primaryPadding,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: listRelated.length,
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _createImageType(Message message) {
    if (message.video != null) {
      /// video
      return Image.asset('images/ic_personaltab_activity_video_play.png');
    } else if (message.pictures.isNotEmpty &&
        message.pictures.first.format == 'gif') {
      return Image.asset('images/ic_personaltab_activity_gif.png');
    }

    return SizedBox();
  }
}

/// 评论列表
class _CommentListWidget extends StatefulWidget {
  final Message message;

  _CommentListWidget(this.message, Key key) : super(key: key);

  @override
  __CommentListWidgetState createState() => __CommentListWidgetState();
}

class __CommentListWidgetState extends State<_CommentListWidget>
    with AfterLayoutMixin<_CommentListWidget> {
  final CommentModel _model = CommentModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CommentModel>(
        model: _model,
        child: ScopedModelDescendant<CommentModel>(builder: (_, child, model) {
          if (model.commentList == null) {
            return PageLoadingWidget();
          }

          return Column(
            children: <Widget>[
              Builder(builder: (_) {
                if (model.commentList.hotComments.isEmpty) {
                  return SizedBox();
                }

                /// 热门评论
                return Padding(
                  padding:
                      EdgeInsets.only(bottom: AppDimensions.primaryPadding),
                  child:
                      CommentListWidget('热门评论', model.commentList.hotComments),
                );
              }),
              CommentListWidget('最新评论', model.commentData),
            ],
          );
        }));
  }

  refreshData({bool loadMore = false}) {
    _model.requestCommentList(widget.message.id, widget.message.type,
        loadMore: loadMore);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    refreshData();
  }
}