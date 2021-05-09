class MusicModel {
  int? artistId;
  String? artistName;
  String? trackName;
  String? collectionName;
  String? previewUrl;
  String? atworkUrl100;
  String? primaryGenreName;

  MusicModel({
    this.artistId,
    this.artistName,
    this.trackName,
    this.collectionName,
    this.previewUrl,
    this.atworkUrl100,
    this.primaryGenreName,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      artistId: json['artistId'] as int,
      artistName: json['artistName'] as String,
      trackName: json['trackName'] as String,
      collectionName: json['collectionName'] as String,
      previewUrl: json['previewUrl'] as String,
      atworkUrl100: json['artworkUrl100'] as String,
      primaryGenreName: json['primaryGenreName'] as String,
    );
  }
}
