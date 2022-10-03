import '../functions/functions.dart';

class news_model {
  
  String title = "";
  String publishedAt = "";
  String author = "";
  String urlToImage = "";
  String source = "";
  String content = "";
  String description = "";
  bool isStarred = false;


  news_model({required this.title, required this.publishedAt, required this.author, required this.urlToImage, required this.source, required this.content, required this.description});
  news_model.from_json(Map<String, dynamic> json_data){
    this.title = json_data["title"];
    this.author = validate_author(json_data["author"]);
    this.publishedAt = handle_date(json_data["publishedAt"]);
    this.urlToImage = json_data["urlToImage"];
    this.content = json_data["content"];
    this.description = json_data["description"];
  }
}