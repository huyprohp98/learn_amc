import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_amc/bloc/bloc_auth/auth_state.dart';
import 'package:learn_flutter_amc/data/repositories/auth_repository.dart';

class AuthBloc extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated());
  // When User Presses the SignIn Button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
  Future<void> signInRequested(String email, String password) async {
    emit(Loading());
    try {
      await authRepository.signIn(email: email, password: password);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  // When User Presses the SignUp Button, we will send the SignUpRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
  Future<void> signUpRequested(String email, String password) async {
    emit(Loading());
    try {
      await authRepository.signUp(email: email, password: password);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  // When User Presses the Google Login Button, we will send the GoogleSignInRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
  Future<void> googleSignInRequested(String? email, String? password) async {
    emit(Loading());
    try {
      await authRepository.signInWithGoogle();
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
  Future<void> signOutRequested() async {
    emit(Loading());
    await authRepository.signOut();
    emit(UnAuthenticated());
  }
}
