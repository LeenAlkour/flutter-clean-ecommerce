import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/domain/auth/usecases/is_logged_in.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authenticat_state.dart';
part 'authenticat_cubit.freezed.dart';

class AuthenticatCubit extends Cubit<AuthenticatState> {
  AuthenticatCubit() : super(AuthenticatState.unAuthenticated());
  void appStarted() async {
    final isLoggedIn = await sl<IsLoggedInUseCase>().call();
if(isLoggedIn){
  emit(AuthenticatState.authenticated());
}else{
  emit(AuthenticatState.unAuthenticated());
}
  }
}
