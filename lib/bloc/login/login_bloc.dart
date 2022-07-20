import 'dart:async';

import '../../data/repository/user_local_repository.dart';
import '../../my_material.dart';
import '../../objectbox.g.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.userLocalRepository}) : super(LoginInitial()) {
    on<LoginNow>(_loginNowHandler);
  }

  final UserLocalRepository userLocalRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _loginNowHandler(LoginNow event, Emitter emit) async {
    final store = await openStore();
    emit(LoginLoading());

    final user = userLocalRepository.getUser(
        store, emailController.text, passwordController.text);
    if (user != null) {
      emit(LoginSuccess());
    } else {
      emit(LoginError());
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
