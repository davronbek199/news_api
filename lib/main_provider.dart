import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';
import 'models/news_response.dart';

class MainProvider extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty');
  List<Articles>? articlesList = [];

  ApiResponse get response {
    return _apiResponse;
  }

  List<Articles>? get articles {
    return articlesList;
  }

  Future<ApiResponse> fetchNews() async {
    String ApiKey = "892dbafa34774ca195c11d0f143339c2";

    String url = "https://newsapi.org/v2/everything"
        "?q=tesla"
        "&from=2022-06-03"
        "&sortBy=publishedAt"
        "&apiKey=$ApiKey";

    Uri myUrl = Uri.parse(url);

    try {
      var response = await http.get(myUrl);
      Map<String, dynamic> data = jsonDecode(response.body);

      articlesList?.clear();

      articlesList = NewsResponse.fromJson(data).articles;

      _apiResponse = ApiResponse.success(articlesList);
    } catch (exception) {
      if (exception is SocketException) {
        _apiResponse = ApiResponse.error("No Internet Connection");
      } else {
        _apiResponse = ApiResponse.error(exception.toString());
      }
    }

    return _apiResponse;
  }
}

//892dbafa34774ca195c11d0f143339c2
