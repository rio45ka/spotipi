import 'package:flutter/material.dart';

class ListRemoveGlow extends StatelessWidget {
  final Widget child;

  const ListRemoveGlow({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return false;
      },
      child: child,
    );
  }
}
