part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
   const factory AuthState.loading() = _Loading;
  const factory AuthState.authsuccess({required User user}) = _Authsuccess;
   const factory AuthState.authError ({required String message}) = _AuthError;
}
