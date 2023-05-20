
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/home_page_screen/bloc/home_page_screen_bloc.dart';
import 'package:hidoc/presentation/home_page_screen/state/home_page_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';
import 'package:hidoc/widgets/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

final homePageScreenBloc = inject<HomePageScreenBloc>();

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  final padding1 = const EdgeInsets.symmetric(horizontal: 100);

  @override
  void initState() {
    super.initState();
    homePageScreenBloc.initialize();

  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: homePageScreenBloc,
        child: BlocBuilder<HomePageScreenBloc, HomePageScreenState>(
          builder: (context, state) {
            return Expanded(
              child: Container(
                color: AppColors.white,
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
                        Container(
                          padding: padding1,
                            child: Row(
                              children: [
                                Flexible(flex: 1,child: HidocBulletin()),
                                Flexible(flex: 1,child: TrendingHidocBulletin())
                            ],
                        )),
                        SizedBox(height: 30,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width/3),
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
                        Container(
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
                        ),
                        WhatMoreOnHidoc(),
                        AdsWidget(),
                        PageEndWidget(),
                        Article(),

                      ],
                    )
                    , isLoading: state.isLoading),
              ),
            );
          }
        ));
  }

  Widget Article(){
    return Padding(
        padding: padding1,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Articles",style: AppTextStyles.webHeading),
              SizedBox(height: 20,),
              PopupMenuButton(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.pinkColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Center(child: Text("Critical Care",style: AppTextStyles.white16))),
                      Icon(Icons.arrow_drop_down,color: Colors.white,)
                    ],
                  ),
                ),
                position: PopupMenuPosition.under,
                itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.pinkColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: 500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text("Text 1",style: AppTextStyles.white16)),
                      ],
                    ),
                  )),
                  PopupMenuItem(child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.pinkColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: 500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text("Text 2",style: AppTextStyles.white16)),
                      ],
                    ),
                  )),


                ];
              },),

              SizedBox(height: 30,),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Stack(
                      children: [
                        Image.asset(Assets.main1),
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
                                Text("2",style: AppTextStyles.white18,)
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
                          Text("Decoding the Nexus Criteria for Critical Care: A Comprehensive Guide",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 30,),
                          Text("The Nexus Criteria has been used by healthcare professionals to determine whether a patient needs critical care or not."),
                          SizedBox(height: 50,),
                          RichText(text: TextSpan(text: "Read full article to earn points",
                              recognizer: TapGestureRecognizer()
                                ..onTap = ()
                                {
                              launchUrl(Uri.parse("https://hidoc.co/"),mode: LaunchMode.platformDefault);
                              },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue, fontSize: 14,fontStyle: FontStyle.italic))),
                          SizedBox(height: 20,),
                          Text("Published Date: 15 Apr 2023", style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }


  Widget HidocBulletin(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hidoc Bulletin",style: AppTextStyles.webHeading,),
        Container(
          color: AppColors.grey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlueSizedBox(),
              Text("Vaccine hesistancy: Where are we and where are we going?", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Text("A Justified way to prevent infection explosion associated with lethal damage is timely vaccination. It provides immunization, builds self-immunity & provides overspread health protection. Infectious diseases & their variants are an uncontrollable threat to human existence and"),
              SizedBox(height: 20,),
              RichText(text: TextSpan(text: "Read More",
                  recognizer: TapGestureRecognizer()
                    ..onTap = ()
                    {
                      launchUrl(Uri.parse("https://hidoc.co/"),mode: LaunchMode.platformDefault);
                    },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue, fontSize: 14))),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlueSizedBox(),
            Text("Vaccine hesistancy: Where are we and where are we going?", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            Text("A Justified way to prevent infection explosion associated with lethal damage is timely vaccination. It provides immunization, builds self-immunity & provides overspread health protection. Infectious diseases & their variants are an uncontrollable threat to human existence and"),
            SizedBox(height: 20,),
            RichText(text: TextSpan(text: "Read More",
                recognizer: TapGestureRecognizer()
                  ..onTap = ()
                  {
                    launchUrl(Uri.parse("https://hidoc.co/"),mode: LaunchMode.platformDefault);
                  },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue, fontSize: 14))),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlueSizedBox(),
            Text("Vaccine hesistancy: Where are we and where are we going?", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            Text("A Justified way to prevent infection explosion associated with lethal damage is timely vaccination. It provides immunization, builds self-immunity & provides overspread health protection. Infectious diseases & their variants are an uncontrollable threat to human existence and"),
            SizedBox(height: 20,),
            RichText(text: TextSpan(text: "Read More",
                recognizer: TapGestureRecognizer()
                  ..onTap = ()
                  {
                    launchUrl(Uri.parse("https://hidoc.co/"),mode: LaunchMode.platformDefault);
                  },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue, fontSize: 14))),
          ],
        ),
      ],
    );
  }

  Widget TrendingHidocBulletin(){
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
            Text("Trending Hidoc Bulletin",style: AppTextStyles.webHeading,),
            SizedBox(height: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Combination of Radiation therapy and Horomone therapy for Prostate Cancer (PCa)", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text("Prostate cancer (PCa), one of the current world's major health concerns has the highest incidence of any type of cancer. It is the 2nd most common type of cancer and the 5th most frequent cause of cancer-related death in men worldwide."),
                SizedBox(height: 20,),
                RichText(text: TextSpan(text: "Read More",
                    recognizer: TapGestureRecognizer()
                      ..onTap = ()
                      {
                        launchUrl(Uri.parse("https://hidoc.co/"),mode: LaunchMode.platformDefault);
                      },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue, fontSize: 14))),
                SizedBox(height: 20,)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Combination of Radiation therapy and Horomone therapy for Prostate Cancer (PCa)", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text("Prostate cancer (PCa), one of the current world's major health concerns has the highest incidence of any type of cancer. It is the 2nd most common type of cancer and the 5th most frequent cause of cancer-related death in men worldwide."),
                SizedBox(height: 20,),
                RichText(text: TextSpan(text: "Read More",
                    recognizer: TapGestureRecognizer()
                      ..onTap = ()
                      {
                        launchUrl(Uri.parse("https://hidoc.co/"),mode: LaunchMode.platformDefault);
                      },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue, fontSize: 14))),
                SizedBox(height: 20,)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Combination of Radiation therapy and Horomone therapy for Prostate Cancer (PCa)", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text("Prostate cancer (PCa), one of the current world's major health concerns has the highest incidence of any type of cancer. It is the 2nd most common type of cancer and the 5th most frequent cause of cancer-related death in men worldwide."),
                SizedBox(height: 20,),
                RichText(text: TextSpan(text: "Read More",
                    recognizer: TapGestureRecognizer()
                      ..onTap = ()
                      {
                        launchUrl(Uri.parse("https://hidoc.co/"),mode: LaunchMode.platformDefault);
                      },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue, fontSize: 14))),
                SizedBox(height: 20,)
              ],
            ),


          ],
        ));
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
          Column(
            children: [
              SizedBox(height: 10,),
              Text("Understanding the importance of Sirs Criteria in Modern Healthcare"),
              SizedBox(height: 10,),
              Divider(color: Colors.grey,height: 2,)
            ],
          ),
          Column(
            children: [
              SizedBox(height: 10,),
              Text("Understanding the importance of Sirs Criteria in Modern Healthcare"),
              SizedBox(height: 10,),
              Divider(color: Colors.grey,height: 2,)
            ],
          ),
          Column(
            children: [
              SizedBox(height: 10,),
              Text("Understanding the importance of Sirs Criteria in Modern Healthcare"),
              SizedBox(height: 10,),
              Divider(color: Colors.grey,height: 2,)
            ],
          ),
        ],
      ),
    );
}


Widget ExploreMoreInArticles(){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text("Explore More In Articles", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Divider(color: Colors.black,height: 2,),
              Column(
                children: [
                  SizedBox(height: 10,),
                  Text("The future of intensive care: delerium should no longer be an issue"),
                  SizedBox(height: 10,),
                  Divider(color: Colors.grey,height: 2,)
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 10,),
                  Text("Understanding the importance of Sirs Criteria in Modern Healthcare"),
                  SizedBox(height: 10,),
                  Divider(color: Colors.grey,height: 2,)
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        ElevatedButton(
            onPressed: (){},
            child: Text("Explore Hidoc Dr.", style: AppTextStyles.white18,),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                elevation: 5,
                fixedSize: Size.fromHeight(50),
                shape: BeveledRectangleBorder())
        ),
      ],
    );
}

Widget TrendingArticles(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        children: [
        SizedBox(height: 20,),
        Text("Trending Articles", style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Divider(color: Colors.black,height: 2,),
        Column(
          children: [
            Image.asset(Assets.main1),
            SizedBox(height: 10,),
            Text("Understanding the importance of Sirs Criteria in Modern Healthcare"),
            SizedBox(height: 10,),
            Divider(color: Colors.grey,height: 2,)
          ]),
          Column(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  Flexible(flex:1,child: Image.asset(Assets.main1)),
                  Flexible(flex:3,child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Understanding the importance of Sirs Criteria in Modern Healthcare"),
                  )),
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey,height: 2,)
            ],
          ),
          Column(
            children: [
              SizedBox(height: 10,),
              Text("Understanding the importance of Sirs Criteria in Modern Healthcare"),
              SizedBox(height: 10,),
              Divider(color: Colors.grey,height: 2,)
            ],
          ),
        ])
     );
}


Widget WhatMoreOnHidoc(){
    return Container(
      color: AppColors.lightGrey,
      padding: padding1+EdgeInsets.symmetric(vertical: 30),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text("What's more on Hidoc Dr.",style: AppTextStyles.webHeading,),
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("News", style: AppTextStyles.webHeading,),
                              SizedBox(height: 30,),
                              Text("Experts addressing burnout discuss the important not only of self-care, but also of improving workplace conditions.")
                            ]
                          ),
                        ),
                      ),
                      Flexible(flex:1,child: Image.asset(Assets.main1))
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(children: [
                        // Flexible(flex: 1,child: Image.asset(Assets.trophy,fit: BoxFit.fitHeight)),
                        Flexible(flex: 1,child: Icon(Icons.emoji_events_sharp, color: Colors.blue,size: 50,)),
                        Flexible(flex: 2,child: Text("Quizzes : ",style: TextStyle(fontWeight: FontWeight.bold),)),
                        Flexible(flex:4,child: Text("Participate & Win Exciting Prizes"))
                      ],),
                      SizedBox(height: 10,),
                      Container(height: 2,color: Colors.black,),SizedBox(height: 8,),
                      SizedBox(height: 10,),
                      Row(children: [
                        Flexible(flex: 1,child: Icon(Icons.calculate, color: Colors.blue,size: 50,)),
                        Flexible(flex:2,child: Text("Medical Calculators : ",style: TextStyle(fontWeight: FontWeight.bold))),
                        Flexible(flex:4,child: Text("Get Access to 800+ Evidence Based Calculators"))
                      ],),
                    ],
                  ),
                )
              )
            ],
          ),
          SizedBox(height: 10,),
          Container(
            color: AppColors.lightblue,
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Social Network for doctors - A Special feature on Hidoc Dr.", style: AppTextStyles.webHeading),
                Container(
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Text("Visit", style: AppTextStyles.white18,),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          elevation: 5,
                          shape: StadiumBorder(),padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20)
                      )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
}

Widget AdsWidget(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30,horizontal: MediaQuery.of(context).size.width/8),
      child: Row(
        children: [
          Flexible(flex:1,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset(Assets.main1,))),
          SizedBox(width: 30,),
          Flexible(flex:1,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset(Assets.main1,))),
          // Image.asset(Assets.main1),
        ],
      ),
    );
}

Widget PageEndWidget(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            margin: EdgeInsets.symmetric(vertical: 20),
            color: AppColors.navBarColor,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(Assets.hidoclogo),
                    Text("#1 Medical App for Doctors in India with 800K Monthly Users", style: AppTextStyles.white12,),
                    Row(
                      children: [
                        IconButton(onPressed: (){launchUrl(Uri.parse("https://www.facebook.com/hidocdr"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.facebook, color: Colors.white),iconSize: 40),
                        IconButton(onPressed: (){launchUrl(Uri.parse("https://www.linkedin.com/company/infedis-infotech"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.linkedin, color: Colors.white),iconSize: 40),
                        IconButton(onPressed: (){launchUrl(Uri.parse("https://www.instagram.com/hidocdr/"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.instagram, color: Colors.white),iconSize: 40),
                        IconButton(onPressed: (){launchUrl(Uri.parse("https://www.youtube.com/channel/UCjMVeETQ4fJzMfv3reoeIFw"),mode: LaunchMode.platformDefault);}, icon: Image.asset(Assets.youtube, color: Colors.white),iconSize: 40),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [],
          )

        ],
      ),
    );
}


}
