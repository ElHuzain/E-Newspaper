import 'package:flutter/material.dart';
import '../Custom_widgets/header_widgets.dart';

class About {
  String title;
  String content;

  About(this.title, this.content);
}

class about_page extends StatelessWidget {
  List<About> AList= [
    About(
      "Idea:",
      "As simple as it can be. An application that shares everyday news.\nAs well as providing simple features such as:\n- Search feature to look for certain news\n- Starring news to re-visit them later."
    ),
    About(
      "Members:",
      "- Ahmed Mohammed Huzain\n- Mariam Moustafa Abdelmoniem"
    ),
    About(
      "Roles:",
      "For the most part, the project was done collaboratively. But there were parts where either of us had offered more.\n\nMariam participated more on the design of the interface. Whereas Ahmed was focusing on the interactivity of the application."
    ),
    About(
      "Special Thanks",
      "Thanks to Dr. Nadeen Amasha for guiding us through this course."
    )
  ];
  TextStyle header = new TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext ctx){
    return Scaffold(
      appBar: myAppbar("About", false),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView.separated(
              itemBuilder: (ctx, index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AList[index].title, style: header),
                    Divider(thickness: 2, color: Colors.grey, height: 10,),
                    Text(AList[index].content)
                  ]
                );
              },
              separatorBuilder: (ctx, index) => SizedBox(height: 10,),
              itemCount: AList.length)
        ),
      )
    );
  }
}