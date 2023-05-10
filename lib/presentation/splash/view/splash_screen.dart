import 'package:hidoc/di/di.dart';
import 'package:hidoc/presentation/splash/bloc/splash_bloc.dart';
import 'package:hidoc/presentation/splash/state/splash_state.dart';
import 'package:hidoc/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final splashBloc = inject<SplashBloc>();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // splashBloc.initialize();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: splashBloc,
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.black,
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  // child: state.logo ?? Container(),
                  child: Text("Hello World", style: TextStyle(color: Colors.white)),
                ),
              ),
            );
          }
        ));
  }
}
