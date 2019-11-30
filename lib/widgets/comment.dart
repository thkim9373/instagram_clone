import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/sizes.dart';
import 'package:instagram_clone/utils/profile_image_path.dart';

class Comment extends StatelessWidget {
  final String userName;
  final bool showProfile;
  final DateTime dateTime;
  final String caption;

  const Comment({Key key, @required this.userName, this.showProfile = false, this.dateTime, @required this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: showProfile,
          child: CircleAvatar(
            backgroundImage: NetworkImage(getProfileImgPath('userName random')),
            radius: profile_radius,
          ),
        ),
        Visibility(
          visible: showProfile,
          child: SizedBox(
            width: common_xs_gap,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                        text: caption,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: common_xxxs_gap,
              ),
              Visibility(
                visible: dateTime != null,
                child: dateTime != null
                    ? Text(
                        dateTime.toIso8601String(),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 10,
                        ),
                      )
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
