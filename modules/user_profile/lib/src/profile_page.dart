import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final content = Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
          child: FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 1,
            child: Container(color: Colors.white)),
          ),
          Flexible(
              child:  FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 0.9,
                child: profileImageContainer,
              )

          ),
        ]
    );
    final container = Container(color: Colors.white, child: content,);
    return FractionallySizedBox(widthFactor: 1,
        heightFactor: 0.5,
        child: container
    );
  }

}
extension ProfileImage on ProfilePage {
  Widget get profileImageContainer {
    final gradient = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.1, 0.5,0.9],
        colors: [ Colors.blue,
          Colors.blue[600],
          Colors.deepPurpleAccent,
        ]);
    final asset = AssetImage("images/user.png",package: "asset_kit");
    final image = Image(image: asset,fit: BoxFit.cover,);
    final overflowBox =  OverflowBox(
            minWidth: 0.0,
            minHeight: 0.0,
            maxWidth: double.infinity,
            alignment: Alignment.topCenter,
            child: image);
    final container  =  Container(
        child: overflowBox,
        decoration: BoxDecoration(
        gradient:gradient));
    final clippedContainer = ClipPath(clipper: _ProfileImageClipper(),
      child: container,
    );
    return clippedContainer;

  }
}
class _ProfileImageClipper extends CustomClipper<Path> {

  Path getClip(Size size) {
    final controlPoint = Offset(-(size.width*0.4), size.height*0.96);
    final controlPoint2 = Offset(size.width*0.9, size.height*0.6);
    final endPoint = Offset(size.width, size.height*0.8);
    var path = Path()
    ..moveTo(size.width*0.25, 0)
    ..cubicTo(controlPoint.dx, controlPoint.dy,
        controlPoint2.dx, controlPoint2.dy,
        endPoint.dx, endPoint.dy)
    ..lineTo(size.width, 0)
    ..close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}