import 'package:hidoc/core/loader/app_loader.dart';
import 'package:hidoc/data/repo/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/presentation/home_screen/state/home_screen_state.dart';
import 'package:hidoc/widgets/Hidoc_Nav_Bar/state/hidoc_nav_bar_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class HidocNavBarBloc extends Cubit<HidocNavBarState> {
  AuthRepository authRepository;
  HidocNavBarBloc(this.authRepository) : super(const HidocNavBarState());

  void resetAllValues(){
    emit(state.copyWith(hoverValue: [false,false,false,false,false,false,false,false,false,false]));
  }

  void resetAllDoctorValues(){
    emit(state.copyWith(forDoctorsListSelected: [false,false,false,false,false]));
  }

  void changeDoctorValues(int index){
    List tempList = List.from(state.forDoctorsListSelected);
    tempList[index] = true;
    emit(state.copyWith(forDoctorsListSelected: tempList));
  }
  void changeHoverValues(int index,bool value){
    resetAllValues();
    List tempList = List.from(state.hoverValue);
    tempList[index] = value;
    emit(state.copyWith(hoverValue: tempList));
  }

  void changeDropDownValue(int index,bool value){
    List tempList = List.from(state.isDropDownSelected);
    tempList[index] = value;
    emit(state.copyWith(isDropDownSelected: tempList));
  }

}
