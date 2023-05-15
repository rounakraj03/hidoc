import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';
import 'package:hidoc/res/assets.dart';
import 'package:url_launcher/url_launcher.dart';

final dashboardBloc = inject<DashboardBloc>();

TextStyle textStyle1 = TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26);
TextStyle textStyle2 = TextStyle(color: Colors.black,fontWeight: FontWeight.bold);



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
