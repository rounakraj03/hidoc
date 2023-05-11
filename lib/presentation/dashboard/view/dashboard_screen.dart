import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';
import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final dashboardBloc = inject<DashboardBloc>();

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // dashboardBloc.initialize();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image:  AssetImage(Assets.bg2Image),fit: BoxFit.cover)
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    Container(
                      height: 150,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(Assets.house,width: 60,
                              // color: Colors.white
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Opacity(
                                    opacity: 0.4,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius: BorderRadiusDirectional.only(
                                              bottomStart: Radius.circular(15),
                                              bottomEnd: Radius.circular(15))
                                    ),
                                      child: Text("hidoc", style: TextStyle(fontSize: 18, color:Colors.white,fontWeight: FontWeight.bold,)),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("ARTICLES", style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 24),
                                  )
                                ],
                              ),
                            )
                          ]
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.separated(itemBuilder: (context, index) {
                          if(index == 0){
                            return Text("Hidoc Bulletin", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 22));
                          }
                          return HidocBulletin(
                              "Vaccine hesitancy: Where are we and where are we going?",
                              "A justified way to prevent infection explosion associated with lethal damage is timely vaccination. It provides immunization, builds self-immunity & provides overspread health protection. Infectious diseases & their variants are an uncontrollable threat to human exsistence.",
                              "https://bulletin.hidoc.co/details.php?id=2z59Vo");
                          },
                          itemCount: 16,
                          separatorBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15,),
                              Container(height: 8,width: 100,color: Colors.blue[400],),
                              SizedBox(height: 8,),
                            ],
                          );
                        },),
                      ),
                    )
                  ],
                )
              ),
            );
          }
        ));
  }

  Widget HidocBulletin(String heading, String data, String redirectLink){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          Text(data, maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,),),
          SizedBox(height: 10,),
          RichText(text: TextSpan(text: "Read more",style: TextStyle(color: Colors.blue)),)
        ],
      ),
    );
  }
}
