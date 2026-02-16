import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/auth/usecases/get_user.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_display_state.dart';
part 'user_info_display_cubit.freezed.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoDisplayState.loading());

  void displayUserInfo() async {
    var result = await sl<GetUserUseCase>().call();
    result.fold(
      (error) {
        emit(UserInfoDisplayState.error(msg: error));
      },
      (data) {
    print("-----------------------------------------------$data");

        emit(UserInfoDisplayState.loaded(data));
      },
    );
  }
}
