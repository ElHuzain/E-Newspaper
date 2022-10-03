import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/news_model.dart';
import '../Data_providers/data_provider.dart';

class news_widget extends StatefulWidget {
  news_model n;
  int ind;

  news_widget(this.n, this.ind);

  @override
  State<news_widget> createState() => _news_widgetState();
}

class _news_widgetState extends State<news_widget> {

  @override
  Widget build(BuildContext ctx){
    final _prov = Provider.of<data_provider>(ctx);

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0)
        ),
        height: 120,
        width: double.infinity,
        child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
                  child: Image.network(fit: BoxFit.fill, height: 120, width: 140, widget.n.urlToImage)
              ),
              SizedBox(width: 10,),
              Expanded(child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Text(overflow: TextOverflow.fade, widget.n.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                        Row(children: [
                          Text(widget.n.publishedAt, style: TextStyle(color: Colors.grey)),
                          Text(" | "),
                          Expanded(
                            child: Container(
                              child: Text(overflow: TextOverflow.ellipsis,widget.n.author, style: TextStyle(color: Colors.red)),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              if(widget.n.isStarred == true) _prov.remove_favorite(widget.n,widget.ind);
                              else _prov.add_favorite(widget.n, widget.ind);
                              setState(() {});
                            },
                              child: Icon(Icons.star, color: widget.n.isStarred==true? Colors.red:Colors.black)
                          )
                        ])
                      ]
                  )
              )),
            ]
        )
    );
  }
}