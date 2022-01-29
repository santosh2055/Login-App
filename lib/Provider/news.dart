import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/Model/news.dart';

class News with ChangeNotifier {
  List<Article> _news = [];

  List<Article> get news {
    return [..._news];
  }

  Future<void> getNews() async {
    List<Article> loadedData = [];
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2487b0d2eeb14f6baae57be6742abb44');

    try {
      var reponse = await http.get(url);
      if (reponse.statusCode == 200) {
        var decodeData = jsonDecode(reponse.body);
        decodeData["articles"].forEach((element) {
          loadedData.add(Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          ));
        });
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    _news = loadedData;
    notifyListeners();
  }
}
