import 'package:hidoc/core/loader/app_loader.dart';
import 'package:hidoc/data/repo/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/presentation/home_screen/state/home_screen_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeScreenBloc extends Cubit<HomeScreenState> {
  AuthRepository authRepository;

  HomeScreenBloc(this.authRepository) : super(const HomeScreenState());

  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true));
    var carInfo = await authRepository.getDashboard(500, 423914);
    emit(state.copyWith(isLoading: false));
    carInfo.forEach((r) {
      emit(state.copyWith(news: r.news));
      emit(state.copyWith(trandingBulletin: r.trandingBulletin));
      emit(state.copyWith(specialityName: r.specialityName));
      emit(state.copyWith(latestArticle: r.latestArticle));
      emit(state.copyWith(exploreArticle: r.exploreArticle));
      emit(state.copyWith(trandingArticle: r.trandingArticle));
      emit(state.copyWith(article: r.article));
      emit(state.copyWith(bulletin: r.bulletin));
      emit(state.copyWith(sID: r.sId));
      if (r.exploreArticle.length > 0) {
        emit(state.copyWith(selectedArticle: r.exploreArticle[0]));
      }
      // print("result->? ${state.sID}");
    });
    }


    void changeSelectedArticle(int id) {
      for (var i in state.exploreArticle) {
        if (id == i["id"]) {
          emit(state.copyWith(selectedArticle: i));
        }
      }
    }

    void changeDefaultState(int id) {
      emit(state.copyWith(defaultState: id));
    }
}