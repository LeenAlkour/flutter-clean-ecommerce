import 'package:bloc/bloc.dart';


class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super('Age Range');
  String selectedAge = '';
void selectAge(data) {
    selectedAge = data!;
    emit(selectedAge);
  }
}
