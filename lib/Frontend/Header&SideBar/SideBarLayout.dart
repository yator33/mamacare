import 'package:flutter/material.dart';

import '../projectmodules/DasboardUI/dashboard.dart';
import 'sidebar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: <Widget>[Dashboard(), SideBar()]));
  }
}
