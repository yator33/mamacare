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
  // final bool isSidebarOpened = true;
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

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSidebarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSidebarOpenedAsync.data! ? 0 : 0,
          right: isSidebarOpenedAsync.data! ? 0 : screenWidth - 45,

          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 133, 36, 135),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 100),
                      ListTile(
                        title: Text(
                          "Raphile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        subtitle: Text(
                          "raphael@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        // subtitle: Text(
                        // "MamaCare",
                      ),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: Container(
                    width: 35,
                    height: 110,
                    color: Color.fromARGB(255, 133, 36, 135),
                    alignment: Alignment.centerLeft,
                    child: AnimatedIcon(
                      progress: _animationController.view,
                      icon: AnimatedIcons.menu_close,
                      color: Color.fromARGB(255, 253, 254, 254),
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
