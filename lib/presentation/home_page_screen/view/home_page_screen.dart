
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
import 'package:hidoc/widgets/critical_care.dart';
import 'package:hidoc/widgets/explore_article.dart';
import 'package:hidoc/widgets/hidoc_bulletin.dart';
import 'package:hidoc/widgets/latest_article.dart';
import 'package:hidoc/widgets/loading_widget.dart';
import 'package:hidoc/widgets/news.dart';
import 'package:hidoc/widgets/quiz.dart';
import 'package:hidoc/widgets/trending_article.dart';
import 'package:hidoc/widgets/trending_hidoc_bulletin.dart';
import 'package:hidoc/widgets/visit_widget.dart';
import 'package:loading_indicator/loading_indicator.dart';
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
                        Article(),
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


}
