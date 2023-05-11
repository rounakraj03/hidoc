import 'package:flutter_svg/flutter_svg.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';
import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // dashboardBloc.initialize();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: dashboardBloc,
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                // appBar: Container(child: Row(children: [SvgPicture.asset(Assets.house), Column(children: [Text("hidoc", style: TextStyle(backgroundColor: Colors.blue),)],)]),)
                // backgroundColor: AppColors.black,
                body:
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: 150,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(Assets.house,width: 60,
                                // color: Colors.white
                            ),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("hidoc", style: TextStyle(backgroundColor: Colors.blue,fontSize: 18, color:Colors.white,fontWeight: FontWeight.bold,)),
                                  Text("ARTICLES", style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 24),
                                )
                                ],
                              ),
                            )
                          ]
                      ),
                    ),

                    Expanded(
                      child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFFC6868), Color(0xFF64B5F6)],
                              tileMode: TileMode.mirror
                          )
                      ),
                      child: Center(child: Text("hello Worlds")),
                  ),
                    )],
                )

              ),
            );
          }
        ));
  }
}
