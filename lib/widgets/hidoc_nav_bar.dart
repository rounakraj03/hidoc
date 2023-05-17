import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';

final dashboardBloc = inject<DashboardBloc>();

class HidocNavBar extends StatefulWidget {
  const HidocNavBar({Key? key}) : super(key: key);

  @override
  State<HidocNavBar> createState() => _HidocNavBarState();
}

class _HidocNavBarState extends State<HidocNavBar> {

  List hoverValue = [false,false,false,false,false,false,false,false,false,false];
  List<String> hoverTextValue = ["Home","Services","About","Media","Team","Careers","Muskaan","Contact","For Doctors","KOL Factory"];
  int selectedValue = 0;


  void resetAllValues(){
    setState(() {
      hoverValue = [false,false,false,false,false,false,false,false,false,false];
    });
  }

  void changeSelectedState(int selectedValue){
    print("selected value ->$selectedValue");
    dashboardBloc.changeDefaultState(selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    var blue = Colors.cyan;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.navBarColor,
        ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Assets.hidoclogo,fit: BoxFit.fitHeight, height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 10,),
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
                      changeSelectedState(selectedValue);
                    });
                  },
                  child: Text(hoverTextValue[0],style: TextStyle(color: (hoverValue[0] || selectedValue == 0 ) ? blue: Colors.black))),
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
                      changeSelectedState(selectedValue);
                    });
                  },child: Text(hoverTextValue[1],style: TextStyle(color: (hoverValue[1] || selectedValue == 1 ) ? blue: Colors.black))),
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
                      changeSelectedState(selectedValue);
                    });
                  },child: Text(hoverTextValue[2],style: TextStyle(color: (hoverValue[2] || selectedValue == 2 ) ? blue: Colors.black))),
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
                      changeSelectedState(selectedValue);
                    });
                  },child: Text(hoverTextValue[3],style: TextStyle(color: (hoverValue[3] || selectedValue == 3 ) ? blue: Colors.black))),
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
                      changeSelectedState(selectedValue);
                    });
                  },child: Text(hoverTextValue[4],style: TextStyle(color: (hoverValue[4] || selectedValue == 4 ) ? blue: Colors.black))),
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
                      changeSelectedState(selectedValue);
                    });
                  },child: Text(hoverTextValue[5],style: TextStyle(color: (hoverValue[5] || selectedValue == 5 ) ? blue: Colors.black))),
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
                      changeSelectedState(selectedValue);
                    });
                  },child: Text(hoverTextValue[6],style: TextStyle(color: (hoverValue[6] || selectedValue == 6 ) ? blue: Colors.black))),
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
                      changeSelectedState(selectedValue);
                    });
                  },child: Text(hoverTextValue[7],style: TextStyle(color: (hoverValue[7] || selectedValue == 7 ) ? blue: Colors.black))),
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
                      changeSelectedState(selectedValue);
                    });
                  },child: Text(hoverTextValue[8],style: TextStyle(color: (hoverValue[8] || selectedValue == 8 ) ? blue: Colors.black))),
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
                      changeSelectedState(selectedValue);
                    });
                  },child: Text(hoverTextValue[9],style: TextStyle(color: (hoverValue[9] || selectedValue == 9 ) ? blue: Colors.black))),
              SizedBox(width: 10,),
            ],
          ),
        ],
      ),);
  }
}
