import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';
import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/widgets/app_button.dart';
import 'package:hidoc/widgets/critical_care.dart';
import 'package:hidoc/widgets/explore_article.dart';
import 'package:hidoc/widgets/hidoc_bulletin.dart';
import 'package:hidoc/widgets/hidoc_nav_bar.dart';
import 'package:hidoc/widgets/latest_article.dart';
import 'package:hidoc/widgets/news.dart';
import 'package:hidoc/widgets/quiz.dart';
import 'package:hidoc/widgets/trending_article.dart';
import 'package:hidoc/widgets/trending_hidoc_bulletin.dart';
import 'package:hidoc/widgets/visit_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final dashboardBloc = inject<DashboardBloc>();

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextStyle textStyle1 = TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26);
  TextStyle textStyle2 = TextStyle(color: Colors.black,fontWeight: FontWeight.bold);


  List<String> _dropdownItems = [
    'Critical Care',
  ];


  @override
  void initState() {
    super.initState();
    dashboardBloc.initialize();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                image: kIsWeb ? null : DecorationImage(image:  AssetImage(Assets.bg2Image),fit: BoxFit.cover)
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    kIsWeb ? HidocNavBar() :
                    Container(
                      height: 150,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTapDown: (details){dashboardBloc.initialize();},
                              child: SvgPicture.asset(Assets.house,width: 60,
                              ),
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
                    //todo add here refresh indicator
                    kIsWeb ? Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: ListView.separated(itemBuilder: (context, index) {
                          if(index == 0){
                            return Column(
                              children: [
                              SizedBox(height: 20,),
                              Text("ARTICLES", style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 24)),
                              CriticalCareWidget(),
                              ],
                            );
                            // return SizedBox();
                          }
                          else if(index == 1){
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(flex:1,child: HidocBulletin()),
                                Flexible(flex: 1,child: TrendingHidocBulletin())
                              ],
                            );
                          }
                          else if(index == 2){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 350),
                              child: ElevatedButton(
                                // style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)))),
                                  onPressed: (){},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    child: Text("Read More Bulletins",
                                      style: TextStyle(fontSize: 20)))),
                            );
                          }
                          else if(index ==3){
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 30,),
                                Flexible( flex: 1,child: LatestArticle()),
                                SizedBox(width: 10,),
                                Flexible( flex: 1,child: TrendingArticle()),
                                SizedBox(width: 10,),
                                Flexible(flex: 1,child: ExploreArticle()),
                                SizedBox(width: 30,),
                              ],
                            );
                          }
                          else if(index ==4){
                            return News();
                          }
                          else if(index ==5){
                            return Quiz();
                          }
                          else if(index ==6){
                            return VisitWidget();
                          }
                          return Text("Hello World");
                        },
                          itemCount: 7,
                          separatorBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15,),
                              ],
                            );
                          },),
                      ),
                    ) :Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.separated(itemBuilder: (context, index) {
                          if(index == 0){
                            return CriticalCareWidget();
                            // return SizedBox();
                          }
                          else if(index == 1){
                            return HidocBulletin();
                          }
                          else if(index==2){
                            return TrendingHidocBulletin();
                          }
                          else if(index ==3){
                            return LatestArticle();
                          }
                          else if(index ==4){
                            return TrendingArticle();
                          }
                          else if(index ==5){
                            return ExploreArticle();
                          }
                          else if(index ==6){
                            return News();
                          }
                          else if(index ==7){
                            return Quiz();
                          }
                          else if(index ==8){
                            return VisitWidget();
                          }
                          return Text("Hello World");
                          },
                          itemCount: 9,
                          separatorBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15,),
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




}
