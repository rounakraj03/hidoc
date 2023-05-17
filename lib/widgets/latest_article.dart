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
                  Text("Latest Articles", style: kIsWeb ? AppTextStyles.webHeading1 : TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 28)),
                  SizedBox(height: 10,),
                  Container(height: 1,padding: EdgeInsets.symmetric(horizontal: 100),color: Colors.black,),

                  SizedBox(height: 20,),
                  ListView.separated(itemBuilder: (context, index) {
                    if(index == 0){
                    }
                    return Text(state.exploreArticle[index]["articleTitle"], style: kIsWeb ? AppTextStyles.webSubheading1 : TextStyle(color: Colors.black,fontWeight: FontWeight.normal),);
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
                    itemCount:state.exploreArticle.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,)
                ],
              ),
            );}
      ));
}