library ui_kit;
import 'package:ui_kit/components/AppBar.dart' as AppBar;
import 'package:flutter/material.dart';

Scaffold scaffold({
  BuildContext context,
  String title = null,
  Widget body,
  Widget sideMenu = null,
  FloatingActionButton floatButton = null}
  ) {

  final scaffold = Scaffold(
      extendBodyBehindAppBar: true,
      drawer: sideMenu,
      backgroundColor: Colors.transparent,
      appBar: AppBar.appBar(title),
      body: body,
      floatingActionButton: floatButton
  );

  return scaffold;
}