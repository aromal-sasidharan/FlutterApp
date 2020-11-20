import 'package:flutter/material.dart';
import 'package:myprofile/domain/Domain.dart' as Domain;
import 'package:rxdart/rxdart.dart';

class SideMenuView extends StatelessWidget {
  SideMenuView({Key key, this.litems}) : super(key: key);
  final List<Domain.SideMenuVM> litems;

  final PublishSubject onTapSubject = PublishSubject<Domain.SideMenuVM>();

  ListView loadDrawer(BuildContext context) {
    return ListView.builder(
        itemCount: litems.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final Domain.SideMenuVM item = litems[index];
          switch (item.type) {
            case Domain.SideMenuType.MAIN:
              return DrawerHeader(
                child: Text(item.name),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
              );
            default:
              return ListTile(
                title: Text(item.name),
                onTap: () {
                  onTapSubject.add(item);
                },
              );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: loadDrawer(context));
  }
}
