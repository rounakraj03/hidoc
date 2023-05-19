
import 'package:flutter/foundation.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/home_page_screen/bloc/home_page_screen_bloc.dart';
import 'package:hidoc/presentation/home_page_screen/state/home_page_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final homePageScreenBloc = inject<HomePageScreenBloc>();

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: homePageScreenBloc,
        child: BlocBuilder<HomePageScreenBloc, HomePageScreenState>(
          builder: (context, state) {
            return Container(
              child: Text("Hello World")
            );
          }
        ));
  }

}
