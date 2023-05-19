import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';
import 'package:hidoc/presentation/home_page_screen/view/home_page_screen.dart';
import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/widgets/app_button.dart';
import 'package:hidoc/widgets/critical_care.dart';
import 'package:hidoc/widgets/explore_article.dart';
import 'package:hidoc/widgets/hidoc_bulletin.dart';
import 'package:hidoc/widgets/Hidoc_Nav_Bar/view/hidoc_nav_bar.dart';
import 'package:hidoc/widgets/latest_article.dart';
import 'package:hidoc/widgets/news.dart';
import 'package:hidoc/widgets/quiz.dart';
import 'package:hidoc/widgets/trending_article.dart';
import 'package:hidoc/widgets/trending_hidoc_bulletin.dart';
import 'package:hidoc/widgets/visit_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final dashboardBloc = inject<DashboardBloc>();

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();
    dashboardBloc.initialize();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Scaffold(

                  drawer: HidocDrawer(),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HidocNavBar(),
                      HomePageScreen()
                    ],
                  ),
                ),
              ),
            );
          }
        ));
  }




}
