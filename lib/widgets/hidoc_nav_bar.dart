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
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Assets.hidoclogo,fit: BoxFit.fitHeight, height: 50,),
          ListView.separated(
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
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
                              color: (hoverValue[index] || selectedValue == index ) ? blue: Colors.white,fontSize: 14)),
                    ));
                },
              separatorBuilder: (context, index) => SizedBox(width: 20,),
              itemCount: hoverTextValue.length),
        ],
      )
    );
  }
}
