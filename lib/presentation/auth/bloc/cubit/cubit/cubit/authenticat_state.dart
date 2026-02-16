part of 'authenticat_cubit.dart';

@freezed
class AuthenticatState with _$AuthenticatState {
  const factory AuthenticatState.authenticated() = Authenticated;
  const factory AuthenticatState.unAuthenticated() = UnAuthenticated;
}
