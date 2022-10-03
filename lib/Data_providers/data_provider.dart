import "../functions/functions.dart";
import '../Models/news_model.dart';
import 'package:flutter/material.dart';



class data_provider extends ChangeNotifier {



  Future<void> fetch_data({Map<String, String> params = const {}}) async{
    Map<String, dynamic> data_body = await fetch_from_API(URL: "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=120b372bce844c4e87dbe4be4511a85b&sortBy=publishedAt", params: params);
    if(news.isEmpty) add_news(data_body);
  }

  // Clears search results
  void reset({Map<String, String> params = const {}}){
    news = [];
    this.fetch_data(params: params);
  }

  List<news_model> news = [

  ];

  List<news_model> favorite_news = [

  ];

  void printNews(){
  }

  void add_news(dynamic data_body){
    for(int i = 0; i < data_body["articles"].length; i++){
      news_model item = news_model.from_json(data_body["articles"][i]);
      if(!news.contains(item)) news.add(item);
    }
    notifyListeners();
  }

  void add_favorite(news_model m, int index){
    bool included = false;
    favorite_news.forEach((element) {
      if(element.title == m.title) {
        included = true;
        print(element.title);
        print(m.title);
        print("Discluded.");
      }
    });
    if(included == false) {
      favorite_news.add(m);
      print(news[index].title);
      news[index].isStarred = true;
      notifyListeners();
    }
  }

  void remove_favorite(news_model m, index){
    news[news.indexOf(m)].isStarred = false;
    favorite_news.remove(m);
    notifyListeners();
  }
}