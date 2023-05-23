import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  const LoadingWidget({required this.child, required this.isLoading, Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.child,
        if(widget.isLoading)
          Container(
            height: 150,
            child: LoadingIndicator(indicatorType: Indicator.ballGridPulse,strokeWidth: 3, colors: [
              Color.fromARGB(255, 243, 0, 0),
              Color.fromARGB(255, 255, 108, 0),
              Color.fromARGB(255, 255, 207, 0),
              Color.fromARGB(255, 0, 178, 1),
              Color.fromARGB(255, 51, 112, 255),
              Color.fromARGB(255, 212, 110, 248),
              Color.fromARGB(255, 118, 0, 148),
              Color.fromARGB(255, 243, 0, 0),
              Color.fromARGB(255, 255, 108, 0)],)
          )
      ],
    );
  }
}
