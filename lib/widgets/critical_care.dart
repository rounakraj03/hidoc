import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';
import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/assets.dart';
import 'package:url_launcher/url_launcher.dart';

final dashboardBloc = inject<DashboardBloc>();

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
                margin: kIsWeb ? EdgeInsets.symmetric(horizontal: 250) : null,
                decoration: BoxDecoration(
                    color: kIsWeb ? Colors.white : Colors.grey[50],
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
                      child: Center(
                          child: Text(e["articleTitle"],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16))),
                      value: e["id"],
                    );
                  }).toList(),
                  onChanged:(value) {
                    dashboardBloc.changeSelectedArticle(value as int);
                  },
                ),
              ),

              SizedBox(height: 30,),

              Container(
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),  // shadow color
                    //     spreadRadius: 5,  // spread radius
                    //     blurRadius: 5,   // blur radius
                    //     offset: Offset(0, 3), // changes position of shadow
                    //   ),
                    // ],
                    // color: Colors.white,
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: kIsWeb ? Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Stack(
                            children: [
                              Container(
                                child: Image.network(state.selectedArticle["articleImg"], fit: BoxFit.cover, height:200,errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(Assets.error,fit: BoxFit.cover);
                                })),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30))
                                  ),
                                  child: Column(
                                    children: [
                                      Text("Points", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white)),
                                      SizedBox(height: 5,),
                                      Text(state.selectedArticle["rewardPoints"].toString(), style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 30,),
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              SizedBox(height: 20,),
                              Text(state.selectedArticle["articleTitle"], style: AppTextStyles.webHeading,overflow: TextOverflow.visible,maxLines: 1),
                              SizedBox(height: 15,),
                              Text(state.selectedArticle["articleDescription"],overflow: TextOverflow.ellipsis, maxLines: 2,style: TextStyle(fontSize: 12)),
                              SizedBox(height: 30,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(text: TextSpan(text: "Read full article to earn more points",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = ()
                                      {
                                        launchUrl(Uri.parse(state.selectedArticle["redirectLink"]),mode: LaunchMode.platformDefault);
                                      },style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, decorationColor: Colors.blue)),),
                              ),
                              ],),
                          ),
                        ),
                    ],
                    ),
                  ],
                ) :Column(
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