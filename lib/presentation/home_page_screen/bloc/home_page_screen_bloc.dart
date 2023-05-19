import 'package:hidoc/core/loader/app_loader.dart';
import 'package:hidoc/data/repo/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/presentation/home_page_screen/state/home_page_screen_state.dart';
import 'package:hidoc/presentation/home_screen/state/home_screen_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomePageScreenBloc extends Cubit<HomePageScreenState> {
  AuthRepository authRepository;
  HomePageScreenBloc(this.authRepository) : super(const HomePageScreenState());


}
