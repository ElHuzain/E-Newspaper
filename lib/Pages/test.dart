import 'package:flutter/material.dart';


class test_page extends StatelessWidget {

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: false,
          ),
          SliverToBoxAdapter(
            child: ListView.builder(scrollDirection: Axis.vertical,shrinkWrap: true, itemCount: 99, itemBuilder: (ctx, index){
              return Container(child: Text("R"));
            })
          )
        ],
      )
    );
  }
}