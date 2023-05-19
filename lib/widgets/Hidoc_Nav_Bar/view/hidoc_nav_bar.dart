import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/core/view/base_view.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';
import 'package:hidoc/widgets/Hidoc_Nav_Bar/bloc/hidoc_nav_bar_bloc.dart';
import 'package:hidoc/widgets/Hidoc_Nav_Bar/state/hidoc_nav_bar_state.dart';

final dashboardBloc = inject<DashboardBloc>();
final hidocNavBarBloc = inject<HidocNavBarBloc>();

class HidocNavBar extends StatefulWidget {
  const HidocNavBar({Key? key}) : super(key: key);

  @override
  State<HidocNavBar> createState() => _HidocNavBarState();
}

class _HidocNavBarState extends State<HidocNavBar> {

  List<String> hoverTextValue = ["Home","Services","About","Media","Team","Careers","Muskaan","Contact","For Doctors","KOL Factory"];
  int selectedValue = 0;

  List<String> servicesList = ["For Pharma", "For Doctors"];
  List<String> pharmaList = ["Pharma Services", "Courses"];

  bool forPharmaHovering = false;

  List<String> forDoctorsList = ["Hidoc Dr.(India)","Hidoc Dr.(Global)","Legal Helpdesk","College Doc","NAT"];

  TextStyle whiteColorTextStyle  = TextStyle(color: Colors.white);


  void changeSelectedState(int selectedValue){
    dashboardBloc.changeDefaultState(selectedValue);
  }


  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;//1000
    var blue = Colors.cyan;
    return BaseView<HidocNavBarBloc, HidocNavBarState>(
        setupViewModel: (bloc) {},
    builder: (context, state, bloc) {
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
                        backgroundColor: (hidocNavBarBloc.state.hoverValue[index] || selectedValue == index ) ?
                        MaterialStateProperty.all(blue) : MaterialStateProperty.all(AppColors.pinkColor)),
                    onPressed: (){
                      hidocNavBarBloc.resetAllValues();
                      setState((){
                        selectedValue = index;
                        changeSelectedState(selectedValue);
                      });
                    },
                    onHover: (value) {
                      setState(() {
                        if(selectedValue != index){
                          hidocNavBarBloc.changeHoverValues(index,value);
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
                          hidocNavBarBloc.changeHoverValues(index,value);
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
                          hidocNavBarBloc.changeDropDownValue(0, false);
                        });
                        },
                      tooltip: "",
                      position: PopupMenuPosition.under,
                      child: Center(child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Services",style: whiteColorTextStyle.copyWith(color: (hidocNavBarBloc.state.hoverValue[index] || hidocNavBarBloc.state.isDropDownSelected[0]) ? blue: Colors.white)),
                          Icon(Icons.arrow_drop_down, color: Colors.white,)
                        ],
                      )),
                      color: AppColors.navBarColor,
                    itemBuilder: (context) {
                      setState((){
                        hidocNavBarBloc.changeDropDownValue(0, true);
                      });
                      return [
                        PopupMenuItem(child: PopUpMenuButtonWidget(),),
                        PopupMenuItem(child: DoctorPopUpItem(text: "For Doctor", voidCallback: () => print("For Doctor"))),
                      ];
                    },)
                );
              }
              else if(index == 8){
                return InkWell(
                  onHover: (value) {
                    setState(() {
                      if(selectedValue != index){
                        hidocNavBarBloc.changeHoverValues(index,value);
                      }
                    });
                  },
                  onTap: () {
                    hidocNavBarBloc.resetAllValues();
                    setState((){
                      selectedValue = index;
                      changeSelectedState(selectedValue);
                    });
                  },
                  child: BlocBuilder<HidocNavBarBloc, HidocNavBarState>(
                      builder: (context, state) {
                  return PopupMenuButton(
                    tooltip: "",
                    position: PopupMenuPosition.under,
                    child: Center(child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(hoverTextValue[index],style: whiteColorTextStyle.copyWith(color: (hidocNavBarBloc.state.hoverValue[index] || hidocNavBarBloc.state.isDropDownSelected[1]) ? blue: Colors.white)),
                        Icon(Icons.arrow_drop_down, color: Colors.white,)
                      ],
                    )),
                    color: AppColors.navBarColor,
                    onCanceled: () {
                      hidocNavBarBloc.changeDropDownValue(1, false);
                    },
                    itemBuilder: (context) {
                      hidocNavBarBloc.changeDropDownValue(1, true);
                      return [
                        PopupMenuItem(child: DoctorPopUpItem(leadingWidget:  Image.asset(Assets.indialogo,height: 30,), text: forDoctorsList[0], voidCallback: () => print("Tapping"),)),
                        PopupMenuItem(child: DoctorPopUpItem(leadingWidget:  Image.asset(Assets.earthlogo,height: 30,), text: forDoctorsList[1], voidCallback: () => print("Tapping"))),
                        PopupMenuItem(child: DoctorPopUpItem(leadingWidget:  Icon(Icons.balance_outlined, color: Colors.white,), text: forDoctorsList[2], voidCallback: () => print("Tapping"))),
                        PopupMenuItem(child: DoctorPopUpItem(leadingWidget:  Icon(Icons.calendar_month_outlined, color: Colors.white,),text: forDoctorsList[3], voidCallback: () => print("Tapping"))),
                        PopupMenuItem(child: DoctorPopUpItem(leadingWidget:  Icon(Icons.note_alt_outlined, color: Colors.white,), text: forDoctorsList[4], voidCallback: () => print("Tapping"))),
                      ];
                    },);
                      })
                );
              }
                return InkWell(
                    onHover: (value) {
                      setState(() {
                        if(selectedValue != index){
                          hidocNavBarBloc.changeHoverValues(index,value);
                        }
                      });
                      },
                    onTap: () {
                      hidocNavBarBloc.resetAllValues();
                      setState((){
                        selectedValue = index;
                        changeSelectedState(selectedValue);
                      });
                      },
                    child: Center(
                      child: Text(
                          hoverTextValue[index],
                          style: TextStyle(
                              color: (hidocNavBarBloc.state.hoverValue[index] || selectedValue == index ) ? blue: Colors.white,fontSize: 14, fontFamily: 'Poppins',fontWeight: FontWeight.normal)),
                    ));
                },
              separatorBuilder: (context, index) => SizedBox(width: 20,),
              itemCount: hoverTextValue.length),
        ],
      )
    );});
  }
}


class DoctorPopUpItem extends StatefulWidget {
  final Widget? leadingWidget;
  final String text;
  final VoidCallback? voidCallback;
  const DoctorPopUpItem({this.leadingWidget, required this.text, this.voidCallback, Key? key}) : super(key: key);

  @override
  State<DoctorPopUpItem> createState() => _DoctorPopUpItemState();
}

class _DoctorPopUpItemState extends State<DoctorPopUpItem>{
  bool isHovering = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(widget.voidCallback != null) {
          widget.voidCallback!();
        }
        // print("Tapped");
      },
          onHover: (value) {
            setState(() {
              isHovering = value;
            });
          },
            child: Center(
              child: Row(
              children: [
                widget.leadingWidget ?? SizedBox(),
                SizedBox(width: 10,),
                Text(widget.text,style: TextStyle(color: isHovering? Colors.cyan: Colors.white)),
            ],
            )),
          );
  }
}



class PopUpMenuButtonWidget extends StatefulWidget {
  const PopUpMenuButtonWidget({Key? key}) : super(key: key);

  @override
  State<PopUpMenuButtonWidget> createState() => _PopUpMenuButtonWidgetState();
}

class _PopUpMenuButtonWidgetState extends State<PopUpMenuButtonWidget> {

  bool forPharmaHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
        onHover: (value) {
          setState(() {
        forPharmaHovering = value;
      });
    },
      child: PopupMenuButton(
        tooltip: "",
        position: PopupMenuPosition.under,
        color: AppColors.navBarColor,
        child: Center(child: Row(
          children: [
          Text("For Pharma",style: TextStyle(color: forPharmaHovering ? Colors.cyan : Colors.white)),
          Icon(Icons.arrow_drop_down, color: Colors.white,)
          ],
      )),
      itemBuilder: (context) {
        return [
          PopupMenuItem(child: DoctorPopUpItem(text: "Pharma Services", voidCallback: () => print("Pharma Services"))),
          PopupMenuItem(child: DoctorPopUpItem(text: "Courses", voidCallback: () => print("Courses"))),
        ];
      }));
  }
}
