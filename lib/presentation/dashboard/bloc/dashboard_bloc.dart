import 'package:hidoc/core/loader/app_loader.dart';
import 'package:hidoc/data/repo/auth_repository.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class DashboardBloc extends Cubit<DashboardState> {
  AuthRepository authRepository;
  DashboardBloc(this.authRepository) : super(const DashboardState());

  Future<void> initialize() async {
    AppLoader.showLoader();
    var carInfo = await authRepository.getDashboard(500, 423914);
    AppLoader.dismissLoader();
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
      if(r.exploreArticle.length >0){
        emit(state.copyWith(selectedArticle: r.exploreArticle[0]));
      }
      // print("result->? ${state.sID}");
    });
  }


  void changeSelectedArticle(int id){
    for(var i in state.exploreArticle){
      if(id == i["id"]){
        emit(state.copyWith(selectedArticle: i));
      }
    }
  }

  void changeDefaultState(int id){
    emit(state.copyWith(defaultState: id));
  }

}
