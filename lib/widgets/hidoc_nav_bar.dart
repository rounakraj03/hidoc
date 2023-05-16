import 'package:flutter/material.dart';
import 'package:hidoc/res/assets.dart';

class HidocNavBar extends StatefulWidget {
  const HidocNavBar({Key? key}) : super(key: key);

  @override
  State<HidocNavBar> createState() => _HidocNavBarState();
}

class _HidocNavBarState extends State<HidocNavBar> {

  List hoverValue = [false,false,false,false,false,false,false,false,false,false,false];
  int selectedValue = 0;


  void resetAllValues(){
    setState(() {
      hoverValue = [false,false,false,false,false,false,false,false,false,false,false];
    });
  }

  @override
  Widget build(BuildContext context) {
    var blue = Colors.cyan;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.asset(Assets.hidoc_logo,color: Colors.cyan,fit: BoxFit.fitWidth, height: 50,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 100,),
              InkWell(
                onHover: (value) {
                  setState(() {
                    if(selectedValue != 0){
                      hoverValue[0] =  value? true: false;
                    }
                  });
                },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 0;
                    });
                  },
                  child: Text("Social",style: TextStyle(color: (hoverValue[0] || selectedValue == 0 ) ? blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3, ),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != 1){
                        hoverValue[1] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 1;
                    });
                  },child: Text("Cases",style: TextStyle(color: (hoverValue[1] || selectedValue == 1 ) ? blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != 2){
                        hoverValue[2] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 2;
                    });
                  },child: Text("Quizzes",style: TextStyle(color: (hoverValue[2] || selectedValue == 2 ) ? blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != 3){
                        hoverValue[3] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 3;
                    });
                  },child: Text("Articles",style: TextStyle(color: (hoverValue[3] || selectedValue == 3 ) ? blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != 4){
                        hoverValue[4] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 4;
                    });
                  },child: Text("Drugs",style: TextStyle(color: (hoverValue[4] || selectedValue == 4 ) ? blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != 5){
                        hoverValue[5] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 5;
                    });
                  },child: Text("Webinars",style: TextStyle(color: (hoverValue[5] || selectedValue == 5 ) ? blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != 6){
                        hoverValue[6] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 6;
                    });
                  },child: Text("Calculators",style: TextStyle(color: (hoverValue[6] || selectedValue == 6 ) ? blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != 7){
                        hoverValue[7] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 7;
                    });
                  },child: Text("Guidelines",style: TextStyle(color: (hoverValue[7] || selectedValue == 7 ) ? blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != 8){
                        hoverValue[8] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 8;
                    });
                  },child: Text("Surveys",style: TextStyle(color: (hoverValue[8] || selectedValue == 8 ) ? blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != 9){
                        hoverValue[9] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 9;
                    });
                  },child: Text("News",style: TextStyle(color: (hoverValue[9] || selectedValue == 9 ) ? blue: Colors.black))),
              Container(height: 30, margin: EdgeInsets.symmetric(horizontal: 5),color: Colors.black54,width: 3,),
              InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != 10){
                        hoverValue[10] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = 10;
                    });
                  },child: Text("Clinical Trials",style: TextStyle(color: (hoverValue[10] || selectedValue == 10 ) ? blue: Colors.black))),
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
