import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/news_model.dart';
import '../Data_providers/data_provider.dart';
import '../Custom_widgets/header_widgets.dart';

class news_page extends StatefulWidget {
  news_model n;
  int index = 0;
  news_page(this.n, this.index);

  @override
  State<news_page> createState() => _news_pageState();
}

class _news_pageState extends State<news_page> {
  @override
  Widget build(BuildContext ctx){
    final _prov = Provider.of<data_provider>(ctx);

    return Scaffold(
        appBar: myAppbar("e-Newspaper", false),
        body: SafeArea(child: Container(
            child: Column(
                children: [
                  Container(child: Image.network(widget.n.urlToImage)),
                  Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TITLE
                            Text(widget.n.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(height: 15,),
                            Row(children: [
                              Text("- ${widget.n.author}", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(" | ${widget.n.publishedAt} ago"),
                              Spacer(),
                              SizedBox(
                                height: 35,
                                width: 30,
                                child: IconButton(onPressed: (){
                                  if(widget.n.isStarred == true) _prov.remove_favorite(widget.n, widget.index);
                                  else _prov.add_favorite(widget.n, widget.index);
                                  setState(() {});
                                }, icon: Icon(Icons.star, color: widget.n.isStarred==true? Colors.red : Colors.black,)),
                              )
                            ]),
                            Divider(thickness: 1, color: Colors.grey, height: 20,),
                            Text(widget.n.content)
                          ]
                      )
                  )
                ]
            )
        ))
    );
  }
}