import '../../../utils/custom_track_shape_slider.dart';
import '../../../utils/utils.dart';
import '../controller/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlPlayerWidget extends StatelessWidget {
  const ControlPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchController _controller = Get.find();
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF222222),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 2,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                      trackShape: CustomTrackShapeSlider(),
                    ),
                    child: Slider(
                      activeColor: Colors.green,
                      inactiveColor: Colors.green.withOpacity(0.3),
                      value: isNullOrEmpty(_controller.positionPlayer)
                          ? 0
                          : _controller.positionPlayer.value.inMilliseconds
                              .toDouble(),
                      min: 0,
                      onChanged: (position) {},
                      max: isNullOrEmpty(_controller.durationTotal)
                          ? 10
                          : _controller.durationTotal.value.inMilliseconds
                              .toDouble(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    CupertinoIcons.shuffle,
                    color: Colors.grey,
                    size: 15,
                  ),
                ),
                GestureDetector(
                  onTap: () => _controller.actionPrevAudio(),
                  child: Icon(
                    CupertinoIcons.backward_end_fill,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                _controller.statusPlayer.value == StatusPlayerAudio.PLAYING
                    ? GestureDetector(
                        onTap: () => _controller.actionPauseAudio(),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.pause_rounded,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => _controller.actionResumeAudio(),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                GestureDetector(
                  onTap: () => _controller.actionNextAudio(),
                  child: Icon(
                    CupertinoIcons.forward_end_fill,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    CupertinoIcons.repeat,
                    color: Colors.grey,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
