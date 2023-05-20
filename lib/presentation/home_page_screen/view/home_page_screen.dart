
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
                            children: [

                            ],
                          ),
                        ),
                        Article(),
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
                  Stack(
                    children: [
                      Image.asset(Assets.main1, height: 250, width: 340,fit: BoxFit.fitHeight,),
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
                  Padding(
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





}
