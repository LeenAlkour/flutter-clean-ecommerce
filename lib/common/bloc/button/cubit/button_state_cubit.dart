import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'button_state.dart';
part 'button_state_cubit.freezed.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonState.initial());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonState.loading());
    try {
      Either result = await usecase(params: params);
      result.fold(
        (l) => emit(ButtonState.error(l)),
        (r) => emit(ButtonState.success()),
      );
    } catch (e) {
      emit(ButtonState.error(e.toString()));
    }
  }
}
