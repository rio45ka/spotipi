import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  final bool isShowLoading;

  const LoadingStateWidget({
    Key? key,
    required this.isShowLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isShowLoading
        ? Center(child: CircularProgressIndicator())
        : Container();
  }
}
