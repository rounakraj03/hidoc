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


  void changeSelectedArticle(int i){
    if(state.exploreArticle.length >i){
      emit(state.copyWith(selectedArticle: state.exploreArticle[0]));
    }
  }

}
