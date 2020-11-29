library ui_kit;

import 'package:flutter/material.dart';

AppBar appBar([String title = null]) {
  Widget titleWidget() {
    if (title != null) {
      return Text(
        title,
        style: TextStyle(color: Colors.yellow),
      );
    }
    return null;
  }

  return AppBar(
    title: titleWidget(),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
