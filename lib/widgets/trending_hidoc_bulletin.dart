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


Widget TrendingHidocBulletin(){
  return BlocProvider.value(
      value: dashboardBloc,
      child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  // color: Colors.blue[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trending Hidoc Bulletin", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26),),
                      SizedBox(height: 20,),
                      ListView.separated(itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.trandingBulletin[index]["articleTitle"], style: kIsWeb ? AppTextStyles.webHeading : TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            Text(state.trandingBulletin[index]["articleDescription"], maxLines: 3,overflow: TextOverflow.ellipsis,style: kIsWeb ? AppTextStyles.webHeading : TextStyle(color: Colors.black,),),
                            SizedBox(height: 10,),
                            RichText(text: TextSpan(text: "Read more"
                                ,recognizer: TapGestureRecognizer()
                                  ..onTap = ()
                                  {
                                    launchUrl(Uri.parse(state.trandingBulletin[index]["redirectLink"]),mode: LaunchMode.platformDefault);
                                  },style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.blue)),),
                          ],
                        );
                      },
                        separatorBuilder: (context, index) => SizedBox(height: 20,),
                        itemCount:state.trandingBulletin.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Visibility(visible: !kIsWeb,child: ElevatedButton(onPressed: (){}, child: Container(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),child: Text("Read More Bulletins",style: TextStyle(fontSize: 20),),)))
                // FTButton(title: "Read More Bulletins")
              ],

            );}
      ));
}
