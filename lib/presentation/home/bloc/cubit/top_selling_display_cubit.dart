import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/product/usecase/get_top_selling.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_selling_display_state.dart';
part 'top_selling_display_cubit.freezed.dart';

class TopSellingDisplayCubit extends Cubit<TopSellingDisplayState> {
  TopSellingDisplayCubit() : super(TopSellingDisplayState.loading());
  void displayTopSelligProducts() async {
    final data = await sl<GetTopSellingUseCase>().call();
    data.fold(
      (l) => emit(TopSellingDisplayState.error(msg: l)),
      (r) => emit(TopSellingDisplayState.loaded(r)),
    );
  }
}
