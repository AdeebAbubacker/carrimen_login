import 'package:bloc/bloc.dart';
import 'package:carri_men_user_app/core/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';




part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  AuthBloc(this.authService) : super(_Initial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<_SignInWithEmailAndPassword>((event, emit) async {
emit(AuthState.loading());
 try {
            User? user = await authService.signInWithEmailAndPassword(email: event.email, password: event.password);

            if (user != null) {
              emit(AuthState.authsuccess(user: user));
            } else {
              emit(const AuthState.authError(message: 'Login failed'));
            }
          } catch (e) {
            emit(AuthState.authError(message: 'An error occurred: $e'));
          }
    });
  }
}
