import 'package:hidoc/data/repo/auth_repository.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class DashboardBloc extends Cubit<DashboardState> {
  AuthRepository authRepository;
  DashboardBloc(this.authRepository) : super(const DashboardState());

  Future<void> initialize() async {
    var carInfo = await authRepository.getDashboard(500, 423914);
    carInfo.forEach((r) {
      print("result->? $r");
    });
  }
}
