import 'package:flutter/material.dart';
class SideMenu extends StatelessWidget {
  List<String> litems = [];
  ListView loadDrawer(BuildContext context) {
   return ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Text('Drawer Header'),
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).primaryColor
          //   ),
          // ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
   );
  }

  @override
  Widget build(BuildContext context) {
   return Drawer(child: loadDrawer(context));
  }
}