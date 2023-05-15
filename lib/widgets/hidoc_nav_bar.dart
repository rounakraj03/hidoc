import 'package:flutter/material.dart';
import 'package:hidoc/res/assets.dart';

class HidocNavBar extends StatefulWidget {
  const HidocNavBar({Key? key}) : super(key: key);

  @override
  State<HidocNavBar> createState() => _HidocNavBarState();
}

class _HidocNavBarState extends State<HidocNavBar> {

  List hoverValue = [false,false,false,false,false,false,false,false,false,false,false];


  void resetAllValues(){
    setState(() {
      hoverValue = [false,false,false,false,false,false,false,false,false,false,false];
    });
  }

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
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[0] = true;
                  },
                  child: Text("Social",style: TextStyle(color: hoverValue[0] ? Colors.blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3, ),
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[1] = true;
                  },child: Text("Cases",style: TextStyle(color: hoverValue[1] ? Colors.blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[2] = true;
                  },child: Text("Quizzes",style: TextStyle(color: hoverValue[2] ? Colors.blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[3] = true;
                  },child: Text("Articles",style: TextStyle(color: hoverValue[3] ? Colors.blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[4] = true;
                  },child: Text("Drugs",style: TextStyle(color: hoverValue[4] ? Colors.blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[5] = true;
                  },child: Text("Webinars",style: TextStyle(color: hoverValue[5] ? Colors.blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[6] = true;
                  },child: Text("Calculators",style: TextStyle(color: hoverValue[6] ? Colors.blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[7] = true;
                  },child: Text("Guidelines",style: TextStyle(color: hoverValue[7] ? Colors.blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[8] = true;
                  },child: Text("Surveys",style: TextStyle(color: hoverValue[8] ? Colors.blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[9] = true;
                  },child: Text("News",style: TextStyle(color: hoverValue[9] ? Colors.blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onTap: () {
                    resetAllValues();
                    hoverValue[10] = true;
                  },child: Text("Clinical Trials",style: TextStyle(color: hoverValue[10] ? Colors.blue: Colors.black))),
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
