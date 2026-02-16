import 'package:e_commerce/domain/product/usecase/get_new_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/domain/product/usecase/get_top_selling.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_in_display_state.dart';
part 'new_in_display_cubit.freezed.dart';

class NewInDisplayCubit extends Cubit<NewInDisplayState> {
  NewInDisplayCubit() : super(NewInDisplayState.loading());
  void displayNewInProducts() async {
    final data = await sl<GetNewInUseCase>().call();
    data.fold(
      (l) => emit(NewInDisplayState.error(msg: l)),
      (r) => emit(NewInDisplayState.loaded(r)),
    );
  }
}
