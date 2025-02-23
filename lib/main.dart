import 'package:flutter/material.dart';

import 'SideBar/SideBarLayout.dart';
import 'Pages/DasboardUI/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home: Dashboard(),
    );
  }
}
