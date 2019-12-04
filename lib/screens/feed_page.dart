import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/sizes.dart';
import 'package:instagram_clone/utils/profile_image_path.dart';
import 'package:instagram_clone/widgets/comment.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: ImageIcon(
            AssetImage('assets/actionbar_camera.png'),
            color: Colors.black,
          ),
          onPressed: null,
        ),
        title: Image.asset(
          'assets/insta_text_logo.png',
          height: 26,
        ),
        actions: <Widget>[
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/actionbar_camera.png'),
              color: Colors.black,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/direct_message.png'),
              color: Colors.black,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return _postItem(index, context);
        },
      ),
    );
  }

  Column _postItem(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader('userName $index'),
        _postImage(index),
        _postActions(),
        _postLikes(),
        _postCaption(context, index),
        _allComment(),
      ],
    );
  }

  FlatButton _allComment() => FlatButton(
        onPressed: null,
        child: Text(
          "show all 18 comments",
          style: TextStyle(color: Colors.grey[600]),
        ),
      );

  Padding _postCaption(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: common_gap,
        vertical: common_xs_gap,
      ),
      child: Comment(
        userName: 'userName $index',
        caption: 'I love summer soooooooooooooooooooooooooooo much ~~~~~~~~~~~~~~~~~~~~~~!!!',
      ),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        '80 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/bookmark.png'),
            color: Colors.black87,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/comment.png'),
            color: Colors.black87,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/direct_message.png'),
            color: Colors.black87,
          ),
          onPressed: null,
        ),
        Spacer(),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/heart_selected.png'),
            color: Colors.redAccent,
          ),
          onPressed: null,
        ),
      ],
    );
  }

  Row _postHeader(String userName) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(common_gap),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              getProfileImgPath(userName),
            ),
            radius: profile_radius,
          ),
        ),
        Expanded(
          child: Text(userName),
        ),
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
          onPressed: null,
        )
      ],
    );
  }

  CachedNetworkImage _postImage(int index) {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/200/200',
      placeholder: (context, url) {
        return Container(
          width: size.width,
          height: size.width,
          child: Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset('assets/loading_img.gif'),
            ),
          ),
        );
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) => AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
