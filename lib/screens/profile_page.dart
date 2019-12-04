import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/sizes.dart';
import 'package:instagram_clone/utils/profile_image_path.dart';
import 'package:instagram_clone/widgets/profile_side_menu.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _menuOpened = false;
  double menuWidth;
  int duration = 400;
  AlignmentGeometry tabAlign = Alignment.centerLeft;
  bool _tabIconGridSelected = true;
  double _gridMargin = 0;
  double _myImageGridMargin = size.width;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: duration),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
        milliseconds: duration,
      ),
      transform: Matrix4.translationValues(_menuOpened ? size.width - menuWidth : size.width, 0, 0),
      child: SafeArea(
        child: ProfileSideMenu(),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.transparent,
      duration: Duration(
        milliseconds: duration,
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
                      _getTapIconButton,
                      _getAnimatedSelectedBar,
                    ]),
                  ),
                  _getImageGrid(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _getImageGrid(BuildContext context) => SliverToBoxAdapter(
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: duration),
              transform: Matrix4.translationValues(_gridMargin, 0, 0),
              child: _imageGrid,
            ),
            AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: duration),
              transform: Matrix4.translationValues(_myImageGridMargin, 0, 0),
              child: _imageGrid,
            ),
          ],
        ),
      );

  GridView get _imageGrid => GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1,
        children: List.generate(30, (index) => _gridImageItem(index)),
      );

  CachedNetworkImage _gridImageItem(int index) => CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: "https://picsum.photos/id/$index/100/100",
      );

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
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animationController,
            semanticLabel: 'Show menu',
          ),
          onPressed: () {
            _menuOpened ? _animationController.reverse() : _animationController.forward();
            setState(
              () {
                _menuOpened = !_menuOpened;
              },
            );
          },
        )
      ],
    );
  }

  Widget get _getTapIconButton => Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
              icon: ImageIcon(AssetImage('assets/grid.png')),
              color: _tabIconGridSelected ? Colors.black : Colors.black26,
              onPressed: () {
                _setTap(true);
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: ImageIcon(AssetImage('assets/saved.png')),
              color: _tabIconGridSelected ? Colors.black26 : Colors.black,
              onPressed: () {
                _setTap(false);
              },
            ),
          ),
        ],
      );

  void _setTap(bool tabLeft) {
    setState(() {
      if (tabLeft) {
        this.tabAlign = Alignment.centerLeft;
        this._gridMargin = 0;
        this._myImageGridMargin = size.width;
      } else {
        this.tabAlign = Alignment.centerRight;
        this._gridMargin = -size.width;
        this._myImageGridMargin = 0;
      }
      this._tabIconGridSelected = tabLeft;
    });
  }

  Widget get _getAnimatedSelectedBar => AnimatedContainer(
        alignment: tabAlign,
        duration: Duration(milliseconds: duration),
        curve: Curves.easeInOut,
        color: Colors.transparent,
        height: 1,
        width: size.width,
        child: Container(
          height: 1,
          width: size.width / 2,
          color: Colors.black87,
        ),
      );
}
