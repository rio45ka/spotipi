import '../../../model/domain/music_model.dart';
import '../../../model/remote/search_model_response.dart';
import '../../../services/search_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var listMusic = <MusicModel>[].obs;
  var loading = false.obs;
  var indexPlaying = 99.obs;

  final AudioPlayer audioPlayer = AudioPlayer();
  var durationTotal = Duration().obs;
  var positionPlayer = Duration().obs;
  var statusPlayer = StatusPlayerAudio.STOP.obs;

  @override
  void onInit() {
    audioPlayer.onDurationChanged.listen((updateDuration) {
      durationTotal.value = updateDuration;
    });

    audioPlayer.onAudioPositionChanged.listen((position) {
      positionPlayer.value = position;
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      switch (playerState) {
        case AudioPlayerState.PLAYING:
          statusPlayer.value = StatusPlayerAudio.PLAYING;
          break;
        case AudioPlayerState.STOPPED:
          statusPlayer.value = StatusPlayerAudio.STOP;
          break;
        case AudioPlayerState.PAUSED:
          statusPlayer.value = StatusPlayerAudio.PAUSE;
          break;
        case AudioPlayerState.COMPLETED:
          statusPlayer.value = StatusPlayerAudio.COMPLETED;
          break;
      }
    });

    super.onInit();
  }

  void updateDataMusic(SearchModelResponse response) {
    listMusic.clear();
    listMusic.addAll(response.result!);
  }

  Future actionSearchMusic(String keyword) async {
    loading.value = true;
    indexPlaying.value = 99;
    actionStopAudio();

    await SearchProvider().getSearchResult(keyword).then(
      (response) {
        loading.value = false;
        updateDataMusic(response);
      },
      onError: (error) {
        loading.value = false;
        Get.snackbar(
          "Error",
          "$error",
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  void actionPlayAudio(int index) async {
    indexPlaying.value = index;
    int result = await audioPlayer.play(listMusic[index].previewUrl ?? "");
    if (result != 1) {
      Get.snackbar(
        'Error',
        'Cant playing',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void actionPauseAudio() async {
    int result = await audioPlayer.pause();
    if (result != 1) {
      Get.snackbar(
        'Error',
        'Cant pause',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void actionStopAudio() async {
    int result = await audioPlayer.stop();
    if (result != 1) {
      Get.snackbar(
        'Error',
        'Cant Stop',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      positionPlayer.value = Duration();
      statusPlayer.value = StatusPlayerAudio.STOP;
    }
  }

  void actionResumeAudio() async {
    int result = await audioPlayer.resume();
    if (result != 1) {
      Get.snackbar(
        'Error',
        'Cant Resume',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void actionPrevAudio() {
    if (indexPlaying.value == 0) return;
    actionPlayAudio(indexPlaying.value - 1);
  }

  void actionNextAudio() {
    if (indexPlaying.value == listMusic.length - 1) return;
    actionPlayAudio(indexPlaying.value + 1);
  }

  @override
  void onClose() {
    audioPlayer.stop();
    super.onClose();
  }
}

enum StatusPlayerAudio {
  PLAYING,
  PAUSE,
  STOP,
  COMPLETED,
}
