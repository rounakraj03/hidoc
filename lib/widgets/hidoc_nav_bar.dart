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
  List isDropDownSelected = [false, false];

  List<String> servicesList = ["For Pharma", "For Doctors"];
  List<String> pharmaList = ["Pharma Services", "Courses"];

  List<String> forDoctorsList = ["Hidoc Dr.(India)","Hidoc Dr.(Global)","Legal Helpdesk","College Doc","NAT"];
List forDoctorsListIcon = [];

TextStyle whiteColorTextStyle  = TextStyle(color: Colors.white);


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
    final sw = MediaQuery.of(context).size.width;//1000
    var blue = Colors.cyan;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.navBarColor,
        ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Assets.hidoclogo, height: 50,),
          ListView.separated(
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
              if(index == 9){
                return Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: (hoverValue[index] || selectedValue == index ) ?
                        MaterialStateProperty.all(blue) : MaterialStateProperty.all(AppColors.pinkColor)),
                    onPressed: (){
                      resetAllValues();
                      setState((){
                        selectedValue = index;
                        changeSelectedState(selectedValue);
                      });
                    },
                    onHover: (value) {
                      setState(() {
                        if(selectedValue != index){
                          hoverValue[index] =  value? true: false;
                        }
                      });
                      },
                    child: Text(
                        hoverTextValue[index],
                        style: TextStyle(
                            color: Colors.white,fontSize: 14, fontFamily: 'Poppins',fontWeight: FontWeight.normal)),
                  ),
                );
              }else if(index==1){
                return InkWell(
                    onHover: (value) {
                      setState(() {
                        if(selectedValue != index){
                          hoverValue[index] =  value? true: false;
                        }
                      });
                    },
                    onTap: () {
                      setState((){
                        selectedValue = index;
                        changeSelectedState(selectedValue);
                      });
                    },
                    child: PopupMenuButton(
                      onCanceled: () {
                        setState(() {
                          isDropDownSelected[0] =false;
                        });
                        },
                      tooltip: "",
                      position: PopupMenuPosition.under,
                      child: Center(child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Services",style: whiteColorTextStyle.copyWith(color: (hoverValue[index] || isDropDownSelected[0]) ? blue: Colors.white)),
                          Icon(Icons.arrow_drop_down, color: Colors.white,)
                        ],
                      )),
                      color: AppColors.navBarColor,
                    // icon: Icon(Icons.arrow_drop_down),
                    itemBuilder: (context) {
                      setState((){
                        isDropDownSelected[0] = true;
                      });
                      return [
                        PopupMenuItem(
                          child: PopupMenuButton(
                            tooltip: "",
                            position: PopupMenuPosition.under,
                            color: AppColors.navBarColor,
                              child: Center(child: Row(
                                children: [
                                  Text("For Pharma",style: whiteColorTextStyle),
                                  Icon(Icons.arrow_drop_down, color: Colors.white,)
                                ],
                              )),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(child: Text("Pharma Services",style: whiteColorTextStyle), value: "Pharma Services"),
                                PopupMenuItem(child: Text("Courses",style: whiteColorTextStyle), value: "Courses"),
                              ];
                      }),
                        ),
                        PopupMenuItem(child: Text("For Doctor",style: whiteColorTextStyle),)
                      ];
                    },)
                );
              }
              else if(index == 8){
                return InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != index){
                        hoverValue[index] =  value? true: false;
                      }
                    });
                  },
                  onTap: () {
                    resetAllValues();
                    setState((){
                      selectedValue = index;
                      changeSelectedState(selectedValue);
                    });
                  },
                  child: PopupMenuButton(
                    tooltip: "",
                    position: PopupMenuPosition.under,
                    child: Center(child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(hoverTextValue[index],style: whiteColorTextStyle.copyWith(color: (hoverValue[index] || isDropDownSelected[1]) ? blue: Colors.white)),
                        Icon(Icons.arrow_drop_down, color: Colors.white,)
                      ],
                    )),
                    color: AppColors.navBarColor,
                    onCanceled: () {
                      setState(() {
                        isDropDownSelected[1] =false;
                      });
                    },
                    itemBuilder: (context) {
                      setState((){
                        isDropDownSelected[1] = true;
                      });
                      return [
                        PopupMenuItem(
                          child: Center(child: Row(
                            children: [
                              // Icon(Icons.flag, color: Colors.white,),
                              Image.asset(Assets.indialogo,height: 30,),
                              SizedBox(width: 10,),
                              Text(forDoctorsList[0],style: whiteColorTextStyle),
                            ],
                          )),
                        ),
                        PopupMenuItem(
                          child: Center(child: Row(
                            children: [
                              // Icon(Icons.flag, color: Colors.white,),
                              Image.asset(Assets.earthlogo,height: 30,),
                              SizedBox(width: 10,),
                              Text(forDoctorsList[1],style:whiteColorTextStyle),
                            ],
                          )),
                        ),
                        PopupMenuItem(
                          child: Center(child: Row(
                            children: [
                              Icon(Icons.balance_outlined, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text(forDoctorsList[2],style: whiteColorTextStyle),
                            ],
                          )),
                        ),
                        PopupMenuItem(
                          child: Center(child: Row(
                            children: [
                              Icon(Icons.calendar_month_outlined, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text(forDoctorsList[3],style: whiteColorTextStyle),
                            ],
                          )),
                        ),
                        PopupMenuItem(
                          child: Center(child: Row(
                            children: [
                              Icon(Icons.note_alt_outlined, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text(forDoctorsList[4],style: whiteColorTextStyle),
                            ],
                          )),
                        ),

                      ];
                    },),
                );
              }
                return InkWell(
                    onHover: (value) {
                      setState(() {
                        if(selectedValue != index){
                          hoverValue[index] =  value? true: false;
                        }
                      });
                      },
                    onTap: () {
                      resetAllValues();
                      setState((){
                        selectedValue = index;
                        changeSelectedState(selectedValue);
                      });
                      },
                    child: Center(
                      child: Text(
                          hoverTextValue[index],
                          style: TextStyle(
                              color: (hoverValue[index] || selectedValue == index ) ? blue: Colors.white,fontSize: 14, fontFamily: 'Poppins',fontWeight: FontWeight.normal)),
                    ));
                },
              separatorBuilder: (context, index) => SizedBox(width: 20,),
              itemCount: hoverTextValue.length),
        ],
      )
    );
  }
}
