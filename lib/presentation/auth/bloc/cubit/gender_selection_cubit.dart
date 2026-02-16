import 'package:bloc/bloc.dart';

class GenderSelectionCubit extends Cubit<int> {
  GenderSelectionCubit() : super(2);
  int selectedGender = 2;
  void selectGender(int genderIndex) {
    selectedGender = genderIndex;
    emit(genderIndex);
  }
}
