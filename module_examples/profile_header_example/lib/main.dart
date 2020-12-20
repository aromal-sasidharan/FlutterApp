import 'package:flutter/material.dart';
import 'package:profile_header/profile_page.dart';
import 'package:ui_kit/theme/Theme.dart' as AppTheme;
import 'package:ui_kit/components/AppBar.dart' as AppBar;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appThemeData(),
        home:  Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar:AppBar.appBar(),
          body: ListView(
            children: [ProfilePage(),ProfilePage()],
            padding: EdgeInsets.zero,
          )
          ,
        )
    );
  }
}
