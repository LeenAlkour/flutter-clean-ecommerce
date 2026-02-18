import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/auth/usecases/get_ages.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'ages_display_state.dart';
part 'ages_display_cubit.freezed.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesDisplayState.loading());
  void displayAges() async {
    var result = await sl<GetAgesUseCase>().call();
    result.fold(
      (message){
        emit(AgesDisplayState.error(msg: message));
      },(data){
        emit(AgesDisplayState.loaded(data));

      }
    );
  }
}
