import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/news_model.dart';
import '../Custom_widgets/news_widgets.dart';
import '../Data_providers/data_provider.dart';
import 'news_page.dart';

class headlines_page extends StatefulWidget {
  @override
  State<headlines_page> createState() => _headlines_pageState();
}

class _headlines_pageState extends State<headlines_page> {
  TextEditingController search_input = TextEditingController();
  bool searching = false;
  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext ctx) {
    final _prov = Provider.of<data_provider>(ctx);
    if(_prov.news.length == 0) _prov.fetch_data();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            child: Form(
              key: _key,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: TextFormField(
                        controller: search_input,
                        validator: (input){
                          if(input!.isEmpty) return;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0),),
                            fillColor: Colors.white,
                            filled: true
                        ),
                      ),
                    )
                  ),
                  SizedBox(width: 5,),
                  ElevatedButton(onPressed: (){
                    if(_key.currentState!.validate()){
                      _prov.reset(params: {"q": search_input.text});
                      searching = true;
                    }
                  }, child: Text("Search"), style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white
                  )),
                  SizedBox(width: 7,),
                  ElevatedButton(onPressed: (){
                    if(_key.currentState!.validate()){
                      if(searching == true) {
                        _prov.reset();
                        searching = false;
                      }
                    }
                  }, child: Text("Clear"), style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white
                  ))
                ]
              ),
            )
          ),
          Expanded(child: _prov.news.length==0? Center(child: CircularProgressIndicator()) :
          ListView.separated(
              separatorBuilder: (ctx, index){return SizedBox(height: 17,);},
              itemCount: _prov.news.length,
              itemBuilder: (ctx, index){
                return GestureDetector(onTap: (){Navigator.push(ctx, MaterialPageRoute(builder: (context) => news_page(_prov.news[index], index)),);},
                    child: news_widget(_prov.news[index] as news_model, index)
                );
              })),
        ],
      ),
    );
  }
}