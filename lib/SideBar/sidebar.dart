import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SidebarState();
}

class _SidebarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  final bool isSidebarOpened = true;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AnimatedPositioned(
      duration: _animationDuration,
      top: 0,
      bottom: 0,
      left: isSidebarOpened ? 0 : 0,
      right: isSidebarOpened ? 0 : screenWidth - 45,

      child: Row(
        children: <Widget>[
          Expanded(child: Container(color: Color(0xFF262AAA))),
          Align(
            alignment: Alignment(0, -0.9),
            child: GestureDetector(
              onTap: () {
                onIconPressed();
              },
              child: Container(
                width: 35,
                height: 110,
                color: Color(0xFF262AAA),
                alignment: Alignment.centerLeft,
                child: AnimatedIcon(
                  progress: _animationController.view,
                  icon: AnimatedIcons.menu_close,
                  color: Color(0xFF1BB5FD),
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
