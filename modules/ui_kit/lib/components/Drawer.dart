library ui_kit;

import 'package:flutter/material.dart';
import 'package:domain/domain.dart' as Domain;
import 'package:rxdart/rxdart.dart';
class SideMenuView extends StatelessWidget {
  SideMenuView({Key key, this.litems}) : super(key: key);
  final List<Domain.SideMenuVM> litems;

  final PublishSubject onTapSubject = PublishSubject<Domain.SideMenuVM>();
  Widget itemFor(BuildContext ctxt, int index) {
    final Domain.SideMenuVM item = litems[index];
    switch (item.type) {
      case Domain.SideMenuType.MAIN:
        return DrawerHeader(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
            ),
            radius: 10.0,
          ),
          decoration:
          BoxDecoration(color: Theme.of(ctxt).primaryColor),
        );
      default:
        return ListTile(
          title: Text(item.name),
          onTap: () {
            onTapSubject.add(item);
          },
        );
    }
  }
  ListView loadDrawer(BuildContext context) {
    return ListView.builder(
        itemCount: litems.length,
        itemBuilder:itemFor
    );
  }

  @override
  Widget build(BuildContext context) {
    final drawer = Drawer(child: loadDrawer(context));
    final clippedDrawer  = ClipPath(clipper: _DrawClipper(),
      child: drawer,
    );
    return clippedDrawer;
  }
}

class _DrawClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(size.width-50, 0);
    path.quadraticBezierTo(size.width, size.height/2,
        size.width-50, size.height);
    // path.lineTo(size.width, size.height/2);
    // path.lineTo(size.width-50, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
