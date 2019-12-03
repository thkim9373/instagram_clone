import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/sizes.dart';
import 'package:instagram_clone/utils/profile_image_path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpened = false;
  double menuWidth;

  @override
  Widget build(BuildContext context) {
    menuWidth = size.width * 0.7;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _sideMenu(),
          _profile(),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      width: menuWidth,
      curve: Curves.easeInOut,
      color: Colors.grey[200],
      duration: Duration(
        milliseconds: 300,
      ),
      transform: Matrix4.translationValues(_menuOpened ? size.width - menuWidth : size.width, 0, 0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton(
              child: Text("Hoony"),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.transparent,
      duration: Duration(
        milliseconds: 300,
      ),
      transform: Matrix4.translationValues(_menuOpened ? -menuWidth : 0, 0, 0),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _userNameIconButton(),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      _getProfileHeader(),
                      _userName(),
                      _userBio(),
                      _editProfileButton(),
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _editProfileButton() {
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
          onPressed: () {},
          borderSide: BorderSide(
            color: Colors.black45,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Text(
            "Edit Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Padding _userBio() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        "Bio from user. So say something.",
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  Padding _userName() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        "User Real Name",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _getProfileHeader() => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(common_gap),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(getProfileImgPath("Hoony")),
            ),
          ),
          Expanded(
            child: Table(children: [
              TableRow(children: [
                _getStatusValueWidget('123'),
                _getStatusValueWidget('321'),
                _getStatusValueWidget('1523'),
              ]),
              TableRow(children: [
                _getStatusLabelWidget("Post"),
                _getStatusLabelWidget("Followers"),
                _getStatusLabelWidget("Following"),
              ]),
            ]),
          )
        ],
      );

  Widget _getStatusValueWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_s_gap),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
      );

  Widget _getStatusLabelWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_s_gap),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w300),
              )),
        ),
      );

  Row _userNameIconButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: common_gap),
            child: Text(
              "Hoony",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(
              () {
                _menuOpened = !_menuOpened;
              },
            );
          },
          icon: Icon(Icons.menu),
        )
      ],
    );
  }
}
