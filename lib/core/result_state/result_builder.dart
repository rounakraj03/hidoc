import 'package:flutter/cupertino.dart';
import 'package:hidoc/core/result_state/result_state.dart';
import 'package:hidoc/data/network/error/network_error.dart';


typedef ResultErrorWidget<T> = Widget Function(T error);
typedef ResultLoadingWidget = Widget Function();
typedef ReturnWidget = Widget Function();
typedef ResultDataWidget<T> = Widget Function(T value);

class ResultStateBuilder<T> extends StatelessWidget {
  const ResultStateBuilder(
      {required this.state,
      required this.dataWidget,
      required this.loadingWidget,
      required this.errorWidget,
      this.idleWidget,
      this.showLoadingInitially = true,
      Key? key}) : super(key: key);

  final ResultState<T> state;
  final ResultDataWidget<T> dataWidget;
  final ResultLoadingWidget loadingWidget;
  final ReturnWidget? idleWidget;
  final ResultErrorWidget<NetworkError> errorWidget;
  final bool showLoadingInitially;

  @override
  Widget build(BuildContext context) {
    return state.when(
        idle: (){
          if(idleWidget == null) {
            return Container();
          }
          return idleWidget!();
        },
        loading: (){
          return loadingWidget();
        },
        data: (T value){
          return dataWidget(value);
        },
        error: (NetworkError error){
          return errorWidget(error);
        });
  }
}
