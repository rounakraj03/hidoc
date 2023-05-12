import 'dart:ui';

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

Widget CriticalCareWidget(){
    return BlocProvider.value(
      value: dashboardBloc,
      child: BlocBuilder<DashboardBloc,DashboardState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: DropdownButton(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    isExpanded: true,
                    elevation: 10,
                    value: state.selectedArticle["id"],
                    items: state.exploreArticle.map((e) {
                      // print("e -> $e");
                      return DropdownMenuItem(
                        child: Center(child: Text(e["articleTitle"],overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16),)),
                        value: e["id"],
                      );
                    }).toList(),
                    onChanged:(value) {
                      dashboardBloc.changeSelectedArticle(value as int);
                      setState(() {

                        print("Value -> $value");

                        // _selectedItem = value!;
                      });
                    },
                  ),
                ),

                SizedBox(height: 30,),

                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),  // shadow color
                          spreadRadius: 5,  // spread radius
                          blurRadius: 5,   // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      // borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              // color: Colors.grey[200],
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                              child: Image.network(state.selectedArticle["articleImg"],width: double.maxFinite, fit: BoxFit.fill,errorBuilder: (context, error, stackTrace) {
                                return Image.asset(Assets.error,fit: BoxFit.cover);
                              }))),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(children: [
                          SizedBox(height: 20,),
                          Text(state.selectedArticle["articleTitle"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),maxLines: 2,overflow: TextOverflow.fade,),
                          SizedBox(height: 15,),
                          Text(state.selectedArticle["articleDescription"],overflow: TextOverflow.ellipsis, maxLines: 2,),
                          SizedBox(height: 30,),
                        ],),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(text: TextSpan(text: "Read full article to earn more points",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = ()
                                  {
                                    launchUrl(Uri.parse(state.selectedArticle["redirectLink"]),mode: LaunchMode.externalApplication);
                                  },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue)),),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))
                            ),
                            child: Column(
                              children: [
                                Text("Points", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white)),
                                SizedBox(height: 5,),
                                Text(state.selectedArticle["rewardPoints"].toString(), style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),)
                              ],
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
}

  Widget HidocBulletin(){
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(itemBuilder: (context, index) {
                      if(index == 0){
                        return Text("Hidoc Bulletin",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 28));
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.bulletin[index-1]["articleTitle"], style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          Text(state.bulletin[index-1]["articleDescription"], maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,),),
                          SizedBox(height: 10,),
                          RichText(text: TextSpan(text: "Read more",
                              recognizer: TapGestureRecognizer()
                            ..onTap = ()
                            {
                              launchUrl(Uri.parse(state.bulletin[index-1]["redirectLink"]),mode: LaunchMode.platformDefault);
                            },style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.blue)),)
                        ],
                      );
                    },
                      separatorBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15,),
                          Container(height: 8,width: 100,color: Colors.blue[400],),
                          SizedBox(height: 8,),
                        ],
                      );
                      },
                      itemCount:state.bulletin.length+1,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,)
                  ],
                ),
              );}
        ));
  }

  Widget TrendingHidocBulletin(){
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                color: Colors.blue[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Trending Hidoc Bulletin", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26),),
                  SizedBox(height: 20,),
                  ListView.separated(itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.trandingBulletin[index]["articleTitle"], style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          Text(state.trandingBulletin[index]["articleDescription"], maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,),),
                          SizedBox(height: 10,),
                          RichText(text: TextSpan(text: "Read more"
                              ,recognizer: TapGestureRecognizer()
                            ..onTap = ()
                            {
                              launchUrl(Uri.parse(state.trandingBulletin[index]["redirectLink"]),mode: LaunchMode.platformDefault);
                            },style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.blue)),),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 20,),
                    itemCount:state.trandingBulletin.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,),
                ],
              ),
        ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Container(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),child: Text("Read More Bulletins",style: TextStyle(fontSize: 20),),))
              // FTButton(title: "Read More Bulletins")
            ],

          );}
      ));
  }


  Widget LatestArticle(){
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Latest Articles", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 28)),
                    SizedBox(height: 10,),
                    Container(height: 1,padding: EdgeInsets.symmetric(horizontal: 100),color: Colors.black,),

                    SizedBox(height: 20,),
                    ListView.separated(itemBuilder: (context, index) {
                      if(index == 0){
                      }
                      return Text(state.exploreArticle[index]["articleTitle"], style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),);
                    },
                      separatorBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Container(height: 1,padding: EdgeInsets.symmetric(horizontal: 100),color: Colors.grey[600],),                            SizedBox(height: 8,),
                            SizedBox(height: 10,),
                          ],
                        );
                      },
                      itemCount:state.exploreArticle.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,)
                  ],
                ),
              );}
        ));
  }

  Widget TrendingArticle(){
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Trending Articles", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 28)),
                    SizedBox(height: 10,),
                    Container(height: 1,padding: EdgeInsets.symmetric(horizontal: 100),color: Colors.black,),

                    SizedBox(height: 20,),
                    ListView.separated(itemBuilder: (context, index) {
                      if(index == 0){
                      }
                      return Column(
                        children: [
                          Image.network(state.trandingArticle[index]["articleImg"],errorBuilder: (context, error, stackTrace) {
                            return Image.asset(Assets.error,fit: BoxFit.cover);
                          }),
                          SizedBox(height: 10,),
                          Text(state.trandingArticle[index]["articleTitle"], style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
                        ],
                      );
                    },
                      separatorBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Container(height: 1,padding: EdgeInsets.symmetric(horizontal: 100),color: Colors.grey[600],),SizedBox(height: 8,),
                            SizedBox(height: 10,),
                          ],
                        );
                      },
                      itemCount:state.trandingArticle.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,)
                  ],
                ),
              );}
        ));
  }


  Widget ExploreArticle(){
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Explore more in Articles", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 28)),
                        SizedBox(height: 10,),
                        Container(height: 1,padding: EdgeInsets.symmetric(horizontal: 100),color: Colors.black,),

                        SizedBox(height: 20,),
                        ListView.separated(itemBuilder: (context, index) {
                          if(index == 0){
                          }
                          return Text(state.exploreArticle[index]["articleTitle"], style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),);
                        },
                          separatorBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Container(height: 1,padding: EdgeInsets.symmetric(horizontal: 100),color: Colors.grey[600],),                            SizedBox(height: 8,),
                                SizedBox(height: 10,),
                              ],
                            );
                          },
                          itemCount:state.exploreArticle.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){}, child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Explore Hidoc Dr.",style: TextStyle(fontSize: 20),),
                      ],
                  ),))
                ],
              );}
        ));
  }

  Widget News(){
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Column(
                children: [
                  Text("What's more on Hidoc Dr.", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26),),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),  // shadow color
                          spreadRadius: 5,  // spread radius
                          blurRadius: 5,   // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    // color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("News", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26),),
                        SizedBox(height: 20,),
                        ListView.separated(itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.news[index]["title"], style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                              Image.network(state.news[index]["urlToImage"],width: double.maxFinite,errorBuilder: (context, error, stackTrace) {
                                return Image.asset(Assets.error,fit: BoxFit.cover);
                              },)
                            ],
                          );
                        },
                          separatorBuilder: (context, index) => SizedBox(height: 40,),
                          itemCount:state.news.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,),
                      ],
                    ),
                  ),
                ],

              );}
        ));
  }


  Widget Quiz(){
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      // Flexible(flex: 1,child: Image.asset(Assets.trophy,fit: BoxFit.fitHeight)),
                      Flexible(flex: 1,child: Icon(Icons.emoji_events_sharp, color: Colors.blue,size: 50,)),
                      Flexible(flex: 2,child: Text("Quizzes : ",style: textStyle2,)),
                      Flexible(flex:4,child: Text("Participate & Win Exciting Prizes"))
                    ],),
                    SizedBox(height: 10,),
                    Container(height: 2,color: Colors.black,),SizedBox(height: 8,),
                    SizedBox(height: 10,),
                    Row(children: [
                      Flexible(flex: 1,child: Icon(Icons.calculate, color: Colors.blue,size: 50,)),
                      Flexible(flex:2,child: Text("Medical Calculators : ",style: textStyle2,)),
                      Flexible(flex:4,child: Text("Get Access to 800+ Evidence Based Calculators"))
                    ],),
                  ],
                ),
              );}
        ));
  }


  Widget VisitWidget(){
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    color: AppColors.primary.withOpacity(0.2),
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(flex:5,child: Text(state.article["articleTitle"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),)),
                        Flexible(flex:2,child: ElevatedButton(child: Text("Visit"),onPressed: (){launchUrlString(state.article["redirectLink"],mode: LaunchMode.externalApplication);},))
                      ],
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              );
            }
            ));
  }

}
