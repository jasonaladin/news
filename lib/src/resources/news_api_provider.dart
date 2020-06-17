import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';
import 'dart:async';
import 'repository.dart';

class NewsApiProvider implements Source{
  Client client = Client();

  Future<List<int>> fetchTopIds() async{
    String url = 'https://hacker-news.firebaseio.com/v0/topstories.json';
    final response = await client.get(url);
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }
  Future<ItemModel> fetchItem(int id) async{
    String url = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final response = await client.get(url);
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }

}