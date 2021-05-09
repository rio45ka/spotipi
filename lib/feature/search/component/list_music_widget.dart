import '../../../widget/item_music_widget.dart';
import '../../../widget/list_remove_glow.dart';
import '../controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMusicWidget extends StatelessWidget {
  const ListMusicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchController _controller = Get.find();
    return ListRemoveGlow(
      child: ListView.separated(
        itemCount: _controller.listMusic.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (BuildContext context, int index) => Obx(
          () => ItemMusicWidget(
            model: _controller.listMusic[index],
            indexNumber: index,
            onTapAction: () => _controller.actionPlayAudio(index),
            isPlaying: index == _controller.indexPlaying.value ? true : false,
          ),
        ),
      ),
    );
  }
}
