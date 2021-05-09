import '../controller/search_controller.dart';
import '../../../utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderSearchWidget extends StatelessWidget {
  const HeaderSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchController _controller = Get.find();
    return Container(
      color: Colors.black,
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: 'Artist, song, or podcast',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          ),
          onSubmitted: (keyword) {
            if (isNullOrEmpty(keyword)) return;

            _controller.actionSearchMusic(keyword);
          },
        ),
      ),
    );
  }
}
