import '../model/remote/search_model_response.dart';
import 'dart:convert';
import 'package:get/get.dart';

class SearchProvider extends GetConnect {
  Future<dynamic> getSearchResult(String keyword) async {
    final response =
        await get("https://itunes.apple.com/search?term=$keyword&media=music");
    if (response.status.hasError) {
      return Future.error(response.statusText ?? "");
    } else {
      return SearchModelResponse.fromJson(jsonDecode(response.body));
    }
  }
}
