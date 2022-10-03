import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Data_providers/data_provider.dart';
import 'Pages/news_page.dart';
import 'Pages/headlines_page.dart';
import 'Pages/favorites_page.dart';
import 'Custom_widgets/header_widgets.dart';
import 'Pages/test.dart';
import 'Pages/about_page.dart';

void main() {

  // parsing();
  runApp(ChangeNotifierProvider(create: (ctx)=>data_provider(),
      child: MaterialApp(
    // theme: ThemeData(fontFamily: "yourFont"),
        home: main_page()
  )));
}

class main_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: myAppbar("e-Newspaper", true),
        body: TabBarView(
          children: [
            headlines_page(),
            favorites_page()
          ]
        )
      )
    );
  }
}
