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


Widget HidocBulletin(){
  return BlocProvider.value(
      value: dashboardBloc,
      child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                        Text(state.bulletin[index-1]["articleTitle"], style: kIsWeb ? AppTextStyles.webHeading : TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text(state.bulletin[index-1]["articleDescription"], maxLines: 3,overflow: TextOverflow.ellipsis,style: kIsWeb ? AppTextStyles.webHeading : TextStyle(color: Colors.black,),),
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
