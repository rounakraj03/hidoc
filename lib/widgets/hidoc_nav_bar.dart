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

  List<String> servicesList = ["For Pharma", "For Doctors"];
  List<String> pharmaList = ["Pharma Services", "Courses"];

  List<String> forDoctorsList = ["Hidoc Dr.(India)","Hidoc Dr.(Global)","Legal Helpdesk","College Doc","NAT"];
List forDoctorsListIcon = [];


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
                      resetAllValues();
                      setState((){
                        selectedValue = index;
                        changeSelectedState(selectedValue);
                      });
                    },
                    child: Center(
                      child: DropdownButton(
                        hint: Center(
                          child: Text(
                              hoverTextValue[index],
                              style: TextStyle(
                                  color: (hoverValue[index] || selectedValue == index ) ? blue: Colors.white,fontSize: 14, fontFamily: 'Poppins',fontWeight: FontWeight.normal)),
                        ),
                        dropdownColor: AppColors.navBarColor,
                        onChanged: (value) {
                          print("value -> $value");
                        },
                        items: servicesList.map((e) => DropdownMenuItem(
                          child: Text(e, style: TextStyle(color: Colors.white),),
                          value: e,
                          onTap: () {},
                        )).toList(),
                        style: TextStyle(color: Colors.red),
                      ),
                    ));
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
