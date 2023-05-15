import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';
import 'package:hidoc/res/assets.dart';
import 'package:url_launcher/url_launcher.dart';

final dashboardBloc = inject<DashboardBloc>();


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
