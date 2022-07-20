import 'dart:async';

import 'package:simple_sales_calculator/data/models/user.dart';

import '../../data/repository/user_local_repository.dart';
import '../../my_material.dart';
import '../../objectbox.g.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({
    required this.userLocalRepository,
  }) : super(RegistrationInitial()) {
    on<RegisterUser>(_registerUserHandler);
  }

  final UserLocalRepository userLocalRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  FutureOr<void> _registerUserHandler(
      RegisterUser event, Emitter<RegistrationState> emit) async {
    final store = await openStore();
    emit(RegistrationLoading());

    final user = User(
        email: emailController.text,
        name: nameController.text,
        phone: phoneController.text,
        password: passwordController.text,
        image: null);
    final userId = userLocalRepository.createUser(store, user);
    user.id = userId;

    if (userId > 0) {
      emit(RegistrationSuccess());
    } else {
      emit(RegistrationError());
    }
  }
}
