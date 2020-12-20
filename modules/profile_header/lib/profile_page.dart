library user_profile;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui_kit/theme/Theme.dart';
import 'package:flutter/services.dart' show rootBundle;
class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {

  dynamic data;
  Future <dynamic> loadData() async{
    String jsonString = await rootBundle.loadString("packages/asset_kit/data/profile.json");
    return json.decode(jsonString);
  }
  @override
  void initState() {

    print("$runtimeType initState ");
    super.initState();
    loadData().then((value){
      setState(() {
        data = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (data == null) {
      return CircularProgressIndicator();
    }

    print("$runtimeType Widget build ");
    double c_width = MediaQuery.of(context).size.width;
    double c_height = MediaQuery.of(context).size.height;
    final String profileDescription = data["description"];
    final String name = data["name"];
    final contentProfileDescription = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            flex: 2,
            child: FractionallySizedBox(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child:Text(
                    name,
                    style: Theme.of(context).textTheme.headline6,
                  )),
              heightFactor: 1,
              widthFactor: 1,
            )),
        Flexible(
          flex: 4,
          child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                profileDescription,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.start,
              )),
        ),
      ],
    );

    final contentProfile = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: contentProfileDescription,
            ),
            flex: 4,
          ),
          Flexible(
            child: FractionallySizedBox(
              child: profileImageContainer,
              heightFactor: 0.5,
            ),
            flex: 2,
          ),
        ]);

    final box = ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 500,
        maxHeight: (c_height * 0.6 < 500) ? 500 : c_height * 0.6,
        maxWidth: c_width,
      ),
      child: Container(child: contentProfile, color: Colors.white),
    );
    return box;
  }
}

extension ProfileImage on _ProfilePageState {
  Widget get profileImageContainer {
    final gradient = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: AppGradientColors.avatarBackground.stops,
        colors: AppGradientColors.avatarBackground.value);
    final asset = AssetImage("images/user.png", package: "asset_kit");
    final image = Image(
      image: asset,
      fit: BoxFit.cover,
    );
    final overflowBox = OverflowBox(
        minWidth: 0.0,
        minHeight: 0.0,
        maxWidth: double.infinity,
        alignment: Alignment.topCenter,
        child: image);
    final container = Container(
        child: overflowBox, decoration: BoxDecoration(gradient: gradient));
    final clippedContainer = ClipPath(
      clipper: _ProfileImageClipper(),
      child: container,
    );
    return clippedContainer;
  }
}

class _ProfileImageClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    final controlPoint = Offset(-(size.width * 0.4), size.height);
    final controlPoint2 = Offset(size.width * 0.5, size.height * 0.5);
    final endPoint = Offset(size.width, size.height);
    var path = Path()
      ..moveTo(size.width * 0.25, 0)
      ..cubicTo(controlPoint.dx, controlPoint.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
