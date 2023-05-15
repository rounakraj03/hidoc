import 'package:flutter/material.dart';
import 'package:hidoc/res/assets.dart';

class HidocNavBar extends StatefulWidget {
  const HidocNavBar({Key? key}) : super(key: key);

  @override
  State<HidocNavBar> createState() => _HidocNavBarState();
}

class _HidocNavBarState extends State<HidocNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.asset(Assets.hidoc_logo, height: 50,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 100,),
              Text("Social"),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              Text("Cases"),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              Text("Quizzes"),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              Text("Articles"),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              Text("Drugs"),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              Text("Webinars"),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              Text("Calculators"),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              Text("Guidelines"),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              Text("Surveys"),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              Text("News"),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              Text("Clinical Trials"),
              SizedBox(width: 100,),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              SizedBox(width: 10,),
              IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
              SizedBox(width: 10,),
              IconButton(onPressed: (){}, icon: Icon(Icons.person))
            ],
          ),

        ],
      ),);
  }
}
