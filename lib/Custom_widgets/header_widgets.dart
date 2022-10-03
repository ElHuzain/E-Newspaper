import 'package:flutter/material.dart';
import '../Models/news_model.dart';
import '../Pages/about_page.dart';

class myAppbar extends StatelessWidget with PreferredSizeWidget {
  String title = "";
  bool navigation_bar = true;

  myAppbar(this.title, this.navigation_bar);

  @override
  Widget build(BuildContext ctx) {
    if (navigation_bar == false)
      return AppBar(
          title: Text(title), centerTitle: true, backgroundColor: Colors.red);
    else
      return AppBar(
        title: Text(title),
        actions: [
          IconButton(onPressed: () => Navigator.push(ctx, MaterialPageRoute(builder: (context) => about_page())),
          icon: Icon(Icons.info))
        ],
        centerTitle: true,
        backgroundColor: Colors.red,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red, Colors.black],
                  stops: [0.5, 0.5])),
        ),
        bottom: TabBar(
          indicatorColor: Colors.red,
          indicatorWeight: 5,
          tabs: [
            Tab(icon: Icon(Icons.newspaper), text: "News"),
            Tab(icon: Icon(Icons.star), text: "Starred"),
          ],
        ),
      );
  }

  @override
  Size get preferredSize => navigation_bar == false
      ? Size.fromHeight(kToolbarHeight)
      : Size.fromHeight(kToolbarHeight * 2 + 10);
}
