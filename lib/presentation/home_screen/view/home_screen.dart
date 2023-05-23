
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:hidoc/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/presentation/home_screen/bloc/home_screen_bloc.dart';
import 'package:hidoc/presentation/home_screen/state/home_screen_state.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';
import 'package:hidoc/widgets/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';


final homeScreenBloc = inject<HomeScreenBloc>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  EdgeInsets padding1 = EdgeInsets.symmetric(horizontal: 100);
  final constraintSize = 1000;

  @override
  void initState() {
    super.initState();
    homeScreenBloc.initialize();

  }

  String formatDate(String dateString) {
    // Create a DateTime object from the input string
    DateTime dateTime = DateTime.parse(dateString);

    // Format the date using DateFormat
    final formattedDate = DateFormat('dd MMMM, yyyy').format(dateTime);

    return formattedDate;
  }


  @override
  Widget build(BuildContext context) {
    padding1 = EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/15.0);
    return BlocProvider.value(
        value: homeScreenBloc,
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              return Expanded(
                child: Container(
                  // color: AppColors.white,
                  child: LoadingWidget(
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Article(),
                          SizedBox(height: 30,),
                          Padding(
                            padding: padding1,
                            child: Divider(height: 2,color: Colors.black54,),
                          ),
                          SizedBox(height: 30,),
                          LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                            if(constraints.maxWidth > constraintSize){
                              return Container(
                                  padding: padding1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(flex: 1,child: HidocBulletin()),
                                      Flexible(flex: 1,child: TrendingHidocBulletin())
                                    ],
                                  ));
                            }else{
                              return Container(
                                  padding: padding1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      HidocBulletin(),
                                      SizedBox(height: 20,),
                                      TrendingHidocBulletin()
                                    ],
                                  ));
                            }
                          }),
                          SizedBox(height: 30,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width/4),
                            child: ElevatedButton(
                                onPressed: (){},
                                child: Text("Read More Bulletins", style: AppTextStyles.white18,),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.cyan,
                                    elevation: 5,
                                    fixedSize: Size.fromHeight(50),
                                    shape: BeveledRectangleBorder())
                            ),
                          ),
                          SizedBox(height: 30,),
                          LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                            if(constraints.maxWidth > constraintSize){
                              return Container(
                                padding: padding1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(child: LatestArticle()),
                                    SizedBox(width: 10,),
                                    Flexible(child: TrendingArticles()),
                                    SizedBox(width: 10,),
                                    Flexible(child: ExploreMoreInArticles())
                                  ],
                                ),
                              );
                            } else{
                              return Container(
                                padding: padding1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LatestArticle(),
                                    SizedBox(height: 10,),
                                    TrendingArticles(),
                                    SizedBox(height: 10,),
                                    ExploreMoreInArticles()
                                  ],
                                ),
                              );
                            }
                          }),
                          WhatMoreOnHidoc(),
                          AdsWidget(),
                          PageEndWidget(),
                        ],
                      )
                      , isLoading: state.isLoading),
                ),
              );
            }
        ));
  }


  Widget Article(){
    return BlocProvider.value(
        value: homeScreenBloc,
        child: BlocBuilder<HomeScreenBloc,HomeScreenState>(
            builder: (context, state) {
        return Padding(
            padding: padding1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text("Articles",style: AppTextStyles.webHeading),
                  SizedBox(height: 20,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.navBarColor, // Set the desired border color here
                        width: 3, // Set the desired border width here
                      ),
                    ),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, wordSpacing: 5),
                      icon: Icon(Icons.arrow_drop_down, size: 30),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide.none
                          )),
                      value: state.selectedArticle["id"],
                      items: state.exploreArticle.map((e){
                        return DropdownMenuItem(child: Center(child: Text(e["articleTitle"].toString(), style: AppTextStyles.black16w500,  overflow: TextOverflow.ellipsis)),value: e["id"]);
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          homeScreenBloc.changeSelectedArticle(value as int);
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 30,),
                  LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                    if(constraints.maxWidth > constraintSize){
                      return Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Stack(
                              children: [
                                Image.network(state.selectedArticle["articleImg"],errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(Assets.error);
                                }),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.cyan,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30))
                                    ),
                                    height: 50,
                                    width: 60,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Points",style: AppTextStyles.white12,),
                                        Text(state.selectedArticle["rewardPoints"].toString(),style: AppTextStyles.white18,)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.selectedArticle["articleTitle"],style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.visible,maxLines: 1),
                                  SizedBox(height: 30,),
                                  Text(state.selectedArticle["articleDescription"],overflow: TextOverflow.ellipsis, maxLines: 2),
                                  SizedBox(height: 50,),
                                  RichText(text: TextSpan(text: "Read full article to earn points",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = ()
                                        {
                                          launchUrl(Uri.parse(state.selectedArticle["redirectLink"]),mode: LaunchMode.platformDefault);
                                        },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue, fontSize: 14,fontStyle: FontStyle.italic))),
                                  SizedBox(height: 20,),
                                  Text("Published Date: ${formatDate(state.selectedArticle["createdAt"])}", style: TextStyle(color: Colors.grey),)
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }
                    else {
                      return BlocProvider.value(
                      value: homeScreenBloc,
                      child: BlocBuilder<HomeScreenBloc,HomeScreenState>(
                      builder: (context, state) {
                        return Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(state.selectedArticle["articleImg"],errorBuilder: (context, error, stackTrace) {
                                return Image.asset(Assets.error);
                              }),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30))
                                  ),
                                  height: 50,
                                  width: 60,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Points",style: AppTextStyles.white12,),
                                      Text(state.selectedArticle["rewardPoints"].toString(),style: AppTextStyles.white18,)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin:const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.selectedArticle["articleTitle"],style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.visible,maxLines: 1),
                                SizedBox(height: 30,),
                                Text(state.selectedArticle["articleDescription"],overflow: TextOverflow.ellipsis, maxLines: 2),
                                SizedBox(height: 30,),
                                RichText(text: TextSpan(text: "Read full article to earn points",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = ()
                                      {
                                        launchUrl(Uri.parse(state.selectedArticle["redirectLink"]),mode: LaunchMode.platformDefault);
                                      },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue, fontSize: 14,fontStyle: FontStyle.italic))),
                                SizedBox(height: 20,),
                                Text("Published Date: ${formatDate(state.selectedArticle["createdAt"])}", style: TextStyle(color: Colors.grey),)
                              ],
                            ),
                          )
                        ],
                      );
                      }));
                    }
                  },)
                ],
              ),
            )
        );}));
  }


  Widget HidocBulletin(){
    return BlocProvider.value(
        value: homeScreenBloc,
        child: BlocBuilder<HomeScreenBloc,HomeScreenState>(
            builder: (context, state)
          {
         return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hidoc Bulletin", style: AppTextStyles.webHeading,),
            ListView.separated(itemBuilder: (context, index) {
              if(index == 0){
                return Container(
                  color: AppColors.grey2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlueSizedBox(),
                      Text(state.trandingBulletin[index]["articleTitle"],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 20,),
                      Text(state.trandingBulletin[index]["articleDescription"]),
                      SizedBox(height: 20,),
                      RichText(text: TextSpan(text: "Read More",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrl(Uri.parse(state.trandingBulletin[index]["redirectLink"]),
                                  mode: LaunchMode.platformDefault);
                            },
                          style: TextStyle(color: Colors.cyan,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              fontSize: 14))),
                    ],
                  ),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.trandingBulletin[index]["articleTitle"],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20,),
                  Text(state.trandingBulletin[index]["articleDescription"]),
                  SizedBox(height: 20,),
                  RichText(text: TextSpan(text: "Read More",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(state.trandingBulletin[index]["redirectLink"]),
                              mode: LaunchMode.platformDefault);
                        },
                      style: TextStyle(color: Colors.cyan,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          fontSize: 14))),
                ],
              );
            }, separatorBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlueSizedBox(),
              ],
            ),
                itemCount: state.trandingBulletin.length > 3 ? 3 : state.trandingBulletin.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true),
          ],
        );
      }));
    }

  Widget TrendingHidocBulletin(){
    return BlocProvider.value(
        value: homeScreenBloc,
        child: BlocBuilder<HomeScreenBloc,HomeScreenState>(
            builder: (context, state)
        {
         return Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: AppColors.lightblue,
              borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Trending Hidoc Bulletin", style: AppTextStyles.webHeading,),
              SizedBox(height: 40,),
              ListView.separated(itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.trandingBulletin[index]["articleTitle"],
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text(state.trandingBulletin[index]["articleDescription"]),
                    SizedBox(height: 20,),
                    RichText(text: TextSpan(text: "Read More",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(state.trandingBulletin[index]["redirectLink"]),
                                mode: LaunchMode.platformDefault);
                          },
                        style: TextStyle(color: Colors.cyan,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            fontSize: 14))),

                  ],
                );
              }, separatorBuilder: (context, index) => SizedBox(height: 20,),
                  itemCount: state.trandingBulletin.length > 3 ? 3 : state.trandingBulletin.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true),
            ],
          ));
    }));
  }

  Widget BlueSizedBox(){
    return Column(
      children: [
        SizedBox(height: 30,),
        Container(height: 6, width: 200, color: Colors.cyan,),
        SizedBox(height: 20,),
      ],
    );
  }


  Widget LatestArticle(){
    return BlocProvider.value(
        value: homeScreenBloc,
        child: BlocBuilder<HomeScreenBloc,HomeScreenState>(
            builder: (context, state)
            {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text("Latest Article", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Divider(color: Colors.black,height: 2,),
                SizedBox(height: 20,),
                ListView.separated(
                    itemBuilder: (context, index) => Column(
                      children: [
                        Text(state.exploreArticle[index]["articleTitle"], maxLines: 2,overflow: TextOverflow.visible),
                        SizedBox(height: 20,),
                      ],
                    ),
                    separatorBuilder: (context, index) => Column(
                      children: [
                      Divider(color: Colors.grey,height: 2,),
                        SizedBox(height: 20,),
                      ],),
                    itemCount:state.exploreArticle.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true
                )
              ],
            ),
          );}));
  }


  Widget ExploreMoreInArticles(){
    return BlocProvider.value(
        value: homeScreenBloc,
        child: BlocBuilder<HomeScreenBloc,HomeScreenState>(
            builder: (context, state)
    {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text("Explore More In Articles",
                  style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Divider(color: Colors.black, height: 2,),
                SizedBox(height: 20,),
                ListView.separated(
                    itemBuilder: (context, index) =>
                        Column(
                          children: [
                            Text(state.exploreArticle[index]["articleTitle"],
                                maxLines: 2, overflow: TextOverflow.visible),
                            SizedBox(height: 20,),
                          ],
                        ),
                    separatorBuilder: (context, index) =>
                        Column(
                          children: [
                            Divider(color: Colors.grey, height: 2,),
                            SizedBox(height: 20,),
                          ],),
                    itemCount: state.exploreArticle.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {},
              child: Text("Explore Hidoc Dr.", style: AppTextStyles.white18,),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  elevation: 5,
                  fixedSize: Size.fromHeight(50),
                  shape: BeveledRectangleBorder())
          ),
        ],
      );
    }));
  }

  Widget TrendingArticles(){
    return BlocProvider.value(
        value: homeScreenBloc,
        child: BlocBuilder<HomeScreenBloc,HomeScreenState>(
            builder: (context, state)
            {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
              child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text("Trending Articles", style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Divider(color: Colors.black,height: 2,),
                    ListView.separated(itemBuilder: (context, index) {
                      if(index == 0){
                        return Column(
                            children: [
                              Image.network(state.trandingArticle[index]["articleImg"],errorBuilder: (context, error, stackTrace) {
                                return Image.asset(Assets.error);
                              }),
                              SizedBox(height: 10,),
                              Text(state.trandingArticle[index]["articleTitle"],maxLines: 2,overflow: TextOverflow.ellipsis,),
                            ]);
                      }
                      else if(index == 1){
                        return Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Flexible(flex:1,child: Image.network(state.trandingArticle[index]["articleImg"],errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(Assets.error);
                                }),),
                                Flexible(flex:3,child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(state.trandingArticle[index]["articleTitle"],maxLines: 2,overflow: TextOverflow.ellipsis,),
                                )),
                              ],
                            ),
                            SizedBox(height: 10,),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          Text(state.trandingArticle[index]["articleTitle"],maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 10,),
                        ],
                      );
                    }, separatorBuilder: (context, index) => Column(
                      children: [
                        SizedBox(height: 10,),
                        Divider(color: Colors.grey,height: 2,),
                      ],
                    ),
                      itemCount: state.trandingArticle.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,),
                  ])
                );
            }));
  }


  Widget WhatMoreOnHidoc(){
    return BlocProvider.value(
        value: homeScreenBloc,
        child: BlocBuilder<HomeScreenBloc,HomeScreenState>(
            builder: (context, state)
    {
      return Container(
        color: AppColors.lightGrey,
        padding: padding1 + EdgeInsets.symmetric(vertical: 30),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text("What's more on Hidoc Dr.", style: AppTextStyles.webHeading,),
            SizedBox(height: 20,),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth > constraintSize) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(
                                color: Colors.black, width: 1)),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child:ListView.builder(itemCount: state.news.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,itemBuilder: (context, index) {
                              if(index == 0){
                                print("state.news[index]['urlToImage'] -> ${state.news[index]['urlToImage']}");
                                return Row(
                                  children: [
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("News",
                                                style: AppTextStyles.webHeading,),
                                              SizedBox(height: 30,),
                                              Text(state.news[index]["title"])
                                            ]
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        flex: 1, child: Image.network(state.trandingArticle[index]["articleImg"],errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(Assets.error);
                                    },))
                                  ],
                                );
                              }
                               return SizedBox();
                            },),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(
                                  color: Colors.black, width: 1)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(children: [
                                    // Flexible(flex: 1,child: Image.asset(Assets.trophy,fit: BoxFit.fitHeight)),
                                    Flexible(flex: 1,
                                        child: Icon(Icons.emoji_events_sharp,
                                          color: Colors.blue, size: 50,)),
                                    Flexible(flex: 2,
                                        child: Text("Quizzes : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),)),
                                    Flexible(flex: 4,
                                        child: Text(
                                            "Participate & Win Exciting Prizes"))
                                  ],),
                                  SizedBox(height: 10,),
                                  Container(height: 2, color: Colors.black,),
                                  SizedBox(height: 8,),
                                  SizedBox(height: 10,),
                                  Row(children: [
                                    Flexible(flex: 1,
                                        child: Icon(
                                          Icons.calculate, color: Colors.blue,
                                          size: 50,)),
                                    Flexible(flex: 2,
                                        child: Text("Medical Calculators : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                    Flexible(flex: 4,
                                        child: Text(
                                            "Get Access to 800+ Evidence Based Calculators"))
                                  ],),
                                ],
                              ),
                            )
                        )
                      ],
                    );
                  }
                  else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,
                                  width: 1)),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("News",
                                        style: AppTextStyles.webHeading,),
                                      SizedBox(height: 30,),
                                      Text(
                                          "Experts addressing burnout discuss the important not only of self-care, but also of improving workplace conditions.")
                                    ]
                                ),
                              ),
                              SizedBox(height: 30,),
                              Image.asset(Assets.main1)
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,
                                  width: 1)),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                // Flexible(flex: 1,child: Image.asset(Assets.trophy,fit: BoxFit.fitHeight)),
                                Flexible(flex: 1,
                                    child: Icon(Icons.emoji_events_sharp,
                                      color: Colors.blue, size: 50,)),
                                Flexible(flex: 2,
                                    child: Text("Quizzes : ", style: TextStyle(
                                        fontWeight: FontWeight.bold),)),
                                Flexible(flex: 4,
                                    child: Text(
                                        "Participate & Win Exciting Prizes"))
                              ],),
                              SizedBox(height: 10,),
                              Container(height: 2, color: Colors.black,),
                              SizedBox(height: 8,),
                              SizedBox(height: 10,),
                              Row(children: [
                                Flexible(flex: 1,
                                    child: Icon(
                                      Icons.calculate, color: Colors.blue,
                                      size: 50,)),
                                Flexible(flex: 2,
                                    child: Text("Medical  Calculators : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                Flexible(flex: 4,
                                    child: Text(
                                        "Get Access to 800+ Evidence Based Calculators"))
                              ],),
                            ],
                          ),
                        )
                      ],
                    );
                  }
                }),

            SizedBox(height: 10,),
            Container(
                color: AppColors.lightblue,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: LayoutBuilder(builder: (BuildContext context,
                    BoxConstraints constraints) {
                  if (constraints.maxWidth > constraintSize) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Social Network for doctors - A Special feature on Hidoc Dr.",
                            style: AppTextStyles.webHeading),
                        ElevatedButton(
                            onPressed: () {
                              launchUrl(
                                  Uri.parse("https://www.facebook.com/hidocdr"),
                                  mode: LaunchMode.platformDefault);
                            },
                            child: Text("Visit", style: AppTextStyles.white18,),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                elevation: 5,
                                shape: StadiumBorder(), padding: EdgeInsets
                                .symmetric(horizontal: 20, vertical: 20)
                            )
                        ),
                      ],
                    );
                  } else {
                    return Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        Text(
                            "Social Network for doctors - A Special feature on Hidoc Dr.",
                            style: AppTextStyles.webHeading),
                        // SizedBox(width: MediaQuery.of(context).size.width/6,),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    "https://www.facebook.com/hidocdr"),
                                    mode: LaunchMode.platformDefault);
                              },
                              child: Text(
                                "Visit", style: AppTextStyles.white18,),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.cyan,
                                  elevation: 5,
                                  shape: StadiumBorder(),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20)
                              )
                          ),
                        ),
                      ],
                    );
                  }
                })
            )
          ],
        ),
      );
    }));
  }



  Widget AdsWidget(){
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10) + padding1,
      padding: EdgeInsets.symmetric(vertical: 10) + padding1,
      child: Row(
        children: [
          Flexible(flex:1,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset(Assets.main1,))),
          SizedBox(width: 30,),
          Flexible(flex:1,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset(Assets.main1,))),
        ],
      ),
    );
  }

  Widget PageEndWidget(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            margin: EdgeInsets.symmetric(vertical: 20),
            color: AppColors.navBarColor,
            child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              if(constraints.maxWidth > constraintSize){
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(Assets.hidoclogo),
                          SizedBox(height: 10,),
                          Text("#1 Medical App for Doctors in India with 800K Monthly Users", style: AppTextStyles.white14,),
                          Wrap(
                            children: [
                              IconButton(onPressed: (){launchUrl(Uri.parse("https://www.facebook.com/hidocdr"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.facebook, color: Colors.white),iconSize: 40),
                              IconButton(onPressed: (){launchUrl(Uri.parse("https://www.linkedin.com/company/infedis-infotech"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.linkedin, color: Colors.white),iconSize: 40),
                              IconButton(onPressed: (){launchUrl(Uri.parse("https://www.instagram.com/hidocdr/"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.instagram, color: Colors.white),iconSize: 40),
                              IconButton(onPressed: (){launchUrl(Uri.parse("https://www.youtube.com/channel/UCjMVeETQ4fJzMfv3reoeIFw"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.youtube, color: Colors.white),iconSize: 40),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("REACH US", style: AppTextStyles.white18,),
                          SizedBox(height: 5,),
                          Text("Please contact below details for any other information.", style: AppTextStyles.white16,),
                          SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email: ",style: AppTextStyles.cyan16,),
                              Text("info@hidoc.co",style: AppTextStyles.white16,)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Address: ",style: AppTextStyles.cyan16,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Infedis Infotech LLP. \nOffice 108, Suyog Center, Gultekdi, Pune- 411 037",style: AppTextStyles.white16,),
                                  RichText(text: TextSpan(text:"Toll Free : 1800-202-5091",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = ()
                                        {
                                          launchUrl(Uri.parse("tel:<1800-202-5091>"),mode: LaunchMode.platformDefault);
                                        },style: TextStyle(color: Colors.cyan, decorationColor: Colors.white, fontSize: 16))),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 40,),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("HIDOC SERVICES", style: AppTextStyles.white18,),
                          SizedBox(height: 25,),
                          Container(
                            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/9),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(flex:1,child: Image.asset(Assets.hidocServices1)),
                                    SizedBox(width: 5,),
                                    Flexible(flex:1,child: Image.asset(Assets.hidocServices2)),
                                    SizedBox(width: 5,),
                                    Flexible(flex:1,child: Image.asset(Assets.hidocServices3)),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Flexible(flex:1,child: Image.asset(Assets.hidocServices4)),
                                    SizedBox(width: 5,),
                                    Flexible(flex:1,child: Image.asset(Assets.hidocServices5)),
                                    SizedBox(width: 5,),
                                    Flexible(flex:1,child: Image.asset(Assets.hidocServices6)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );}
              else{return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(Assets.hidoclogo),
                      SizedBox(height: 10,),
                      Text("#1 Medical App for Doctors in India with 800K Monthly Users", style: AppTextStyles.white14,),
                      Wrap(
                        children: [
                          IconButton(onPressed: (){launchUrl(Uri.parse("https://www.facebook.com/hidocdr"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.facebook, color: Colors.white),iconSize: 40),
                          IconButton(onPressed: (){launchUrl(Uri.parse("https://www.linkedin.com/company/infedis-infotech"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.linkedin, color: Colors.white),iconSize: 40),
                          IconButton(onPressed: (){launchUrl(Uri.parse("https://www.instagram.com/hidocdr/"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.instagram, color: Colors.white),iconSize: 40),
                          IconButton(onPressed: (){launchUrl(Uri.parse("https://www.youtube.com/channel/UCjMVeETQ4fJzMfv3reoeIFw"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.youtube, color: Colors.white),iconSize: 40),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 50,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("REACH US", style: AppTextStyles.white18,),
                      SizedBox(height: 5,),
                      Text("Please contact below details for any other information.", style: AppTextStyles.white16,),
                      SizedBox(height: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email: ",style: AppTextStyles.cyan16,),
                          Text("info@hidoc.co",style: AppTextStyles.white16,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address: ",style: AppTextStyles.cyan16,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Infedis Infotech LLP. \nOffice 108, Suyog Center, Gultekdi, Pune- 411 037",style: AppTextStyles.white16,),
                              RichText(text: TextSpan(text:"Toll Free : 1800-202-5091",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = ()
                                    {
                                      launchUrl(Uri.parse("tel:<1800-202-5091>"),mode: LaunchMode.platformDefault);
                                    },style: TextStyle(color: Colors.cyan, decorationColor: Colors.white, fontSize: 16))),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("HIDOC SERVICES", style: AppTextStyles.white18,),
                      SizedBox(height: 25,),
                      Container(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/9),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(flex:1,child: Image.asset(Assets.hidocServices1)),
                                SizedBox(width: 5,),
                                Flexible(flex:1,child: Image.asset(Assets.hidocServices2)),
                                SizedBox(width: 5,),
                                Flexible(flex:1,child: Image.asset(Assets.hidocServices3)),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Flexible(flex:1,child: Image.asset(Assets.hidocServices4)),
                                SizedBox(width: 5,),
                                Flexible(flex:1,child: Image.asset(Assets.hidocServices5)),
                                SizedBox(width: 5,),
                                Flexible(flex:1,child: Image.asset(Assets.hidocServices6)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );}}),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("© Copyright 2022 "),
                  Text("Infedis Infotech LLP.", style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(text: TextSpan(text:"Terms and Conditions",
                      recognizer: TapGestureRecognizer()
                        ..onTap = ()
                        {
                          launchUrl(Uri.parse("https://hidoc.co/terms-n-conditions.html"),mode: LaunchMode.platformDefault);
                        },style: TextStyle(color: Colors.cyan, decorationColor: Colors.white, fontSize: 16))),
                  Text(" | "),
                  RichText(text: TextSpan(text:"Privacy Policy",
                      recognizer: TapGestureRecognizer()
                        ..onTap = ()
                        {
                          launchUrl(Uri.parse("https://hidoc.co/privacy-policy.html"),mode: LaunchMode.platformDefault);
                        },style: TextStyle(color: Colors.cyan, decorationColor: Colors.white, fontSize: 16))),
                ],
              )
            ],
          )

        ],
      ),
    );
  }


}
