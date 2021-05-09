import '../component/control_player_widget.dart';
import '../../../widget/empty_data_widget.dart';
import '../component/header_search_widget.dart';
import '../component/list_music_widget.dart';
import '../../../widget/loading_state_widget.dart';
import '../../../utils/utils.dart';
import '../controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchController _controller = Get.put(SearchController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderSearchWidget(),
            Expanded(
              child: Obx(
                () => _controller.loading.value == true
                    ? LoadingStateWidget(
                        isShowLoading: _controller.loading.value,
                      )
                    : isNullOrEmpty(_controller.listMusic)
                        ? EmptyDataWidget()
                        : ListMusicWidget(),
              ),
            ),
            Obx(
              () =>
                  _controller.statusPlayer.value == StatusPlayerAudio.PLAYING ||
                          _controller.statusPlayer.value ==
                              StatusPlayerAudio.PAUSE ||
                          _controller.statusPlayer.value ==
                              StatusPlayerAudio.COMPLETED
                      ? ControlPlayerWidget()
                      : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
