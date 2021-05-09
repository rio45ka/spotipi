import 'song_model.dart';

class PlaylistModel {
  String? id;
  String? image;
  String? title;
  String? desc;
  String? duration;
  List<SongModel>? songs;

  PlaylistModel({
    this.id,
    this.image,
    this.title,
    this.desc,
    this.duration,
    this.songs,
  });
}
