import 'package:flutter/material.dart';

import '../Pages/dashboard.dart';
import 'sidebar.dart';

class SideBarLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          DashBoard(),
          SideBar(),
        ],
      ),
    );
  }
}
