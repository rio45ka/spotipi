import '../domain/music_model.dart';

class SearchModelResponse {
  int? resultCount;
  List<MusicModel>? result;

  SearchModelResponse({this.resultCount, this.result});

  factory SearchModelResponse.fromJson(Map<String, dynamic> json) {
    return SearchModelResponse(
      resultCount: json['resultCount'] as int,
      result: (json["results"] as List)
          .map((item) => MusicModel.fromJson(item))
          .toList(),
    );
  }
}
