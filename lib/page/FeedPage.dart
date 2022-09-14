import 'package:flutter/material.dart';
import 'package:app/type/Feed.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Feed> feed = List.empty(growable: true);
  TextEditingController? search_controller;

  @override
  void initState() {
    // TODO: implement initState

    search_controller = TextEditingController();
    feed.add(Feed(
        user: User(
            user_name: 'cheri',
            user_image_path:
                'https://w7.pngwing.com/pngs/379/331/png-transparent-bumper-sticker-cherry-decal-cherries-jubilee-cherry-food-leaf-label-thumbnail.png'),
        location: '하회마을',
        text: '피드에 글을 남겨보아요!',
        like_list: [Like(user_name: 'cheri')],
        image_path:
            'https://images.unsplash.com/photo-1662487845795-5a8a5b7a7f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
        comment_list: [
          Comment(
              user_name: 'cheri',
              comment: '댓글테스트',
              date: new DateTime(2022, 09, 07)),
          Comment(
              user_name: 'cheri',
              comment: '댓글테스트2',
              date: new DateTime(2022, 09, 07))
        ]));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: <Widget>[
          Icon(Icons.home),
          Padding(padding: EdgeInsets.only(left: 5)),
          Icon(Icons.chat_bubble_outline),
          Padding(padding: EdgeInsets.only(left: 5)),
          Icon(Icons.plus_one),
          Padding(padding: EdgeInsets.only(left: 5)),
          Icon(Icons.location_history),
          Padding(padding: EdgeInsets.only(left: 5)),
          Icon(Icons.heart_broken)
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: feed.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.pink,
                                          width: 3,
                                          style: BorderStyle.solid)),
                                  child: Image.network(
                                    feed[index].user!.user_image_path!,
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  )),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Text(feed[index].user!.user_name!)
                            ],
                          ),
                          Icon(Icons.linear_scale)
                        ],
                      )),
                  Image.network(feed[index].image_path!,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 1.3,
                      fit: BoxFit.cover),
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(Icons.heart_broken_outlined),
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Icon(Icons.chat_bubble_outline_outlined),
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Icon(Icons.message_outlined)
                            ],
                          ),
                          Icon(Icons.bookmark_outline)
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [Text('좋아요 ${feed[index].like_list!.length}개')],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          feed[index].user!.user_name!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(feed[index].text!)
                      ],
                    ),
                  ),

                  /**
                   * 리스트 뷰 중첩문제
                   */

                  // 'If this widget is always nested in a scrollable widget there '
                  // 'is no need to use a viewport because there will always be enough '
                  // 'vertical space for the children. In this case, consider using a '
                  // 'Column instead. Otherwise, consider using the "shrinkWrap" property '
                  // '(or a ShrinkWrappingViewport) to size the height of the viewport '
                  // 'to the sum of the heights of its children.'
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: feed[index].comment_list!.length,
                      itemBuilder: (context, c_index) {
                        return Container(
                            padding: EdgeInsets.all(5),
                            child: Row(children: [
                              Text(
                                feed[index].comment_list![c_index].user_name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Text(
                                feed[index].comment_list![c_index].comment!,
                                style: TextStyle(fontSize: 12),
                              )
                            ]));
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
