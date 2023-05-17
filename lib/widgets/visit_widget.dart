import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';
import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final dashboardBloc = inject<DashboardBloc>();



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
                      Flexible(flex:2,child: ElevatedButton(child: Text("Visit"),onPressed: (){
                        launchUrlString(state.article["redirectLink"],mode: LaunchMode.externalApplication);
                        },))
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            );
          }
      ));
}