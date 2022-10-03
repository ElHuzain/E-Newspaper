import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/news_model.dart';
import '../Custom_widgets/news_widgets.dart';
import '../Data_providers/data_provider.dart';
import 'news_page.dart';

class favorites_page extends StatefulWidget {
  @override
  State<favorites_page> createState() => _favorites_pageState();
}

class _favorites_pageState extends State<favorites_page> {
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext ctx) {
    final _prov = Provider.of<data_provider>(ctx);
    if(_prov.news.length == 0) _prov.fetch_data();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: _prov.news.length==0? Center(child: Text("No data yet.")) :
      ListView.separated(
          separatorBuilder: (ctx, index){return SizedBox(height: 17,);},
          itemCount: _prov.favorite_news.length,
          itemBuilder: (ctx, index){
            return GestureDetector(
                onTap: (){
              Navigator.push(
                ctx,
                MaterialPageRoute(builder: (context) => news_page(_prov.favorite_news[index], index)),
              );
            },
            child: news_widget(_prov.favorite_news[index] as news_model, index)
            );
          }),
    );
  }
}