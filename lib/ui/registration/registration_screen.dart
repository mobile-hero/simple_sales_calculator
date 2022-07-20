import '../../bloc/registration/registration_bloc.dart';
import '../../my_material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(
          userLocalRepository: context.appProvider.userLocalRepository),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: Container(
          padding: const EdgeInsets.all(space4x),
          child: BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
              final bloc = context.read<RegistrationBloc>();
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: space2x),
                    child: TextField(
                      controller: bloc.emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: space2x),
                    child: TextField(
                      controller: bloc.nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: space2x),
                    child: TextField(
                      controller: bloc.phoneController,
                      decoration: const InputDecoration(
                        hintText: 'Phone',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: space2x),
                    child: TextField(
                      controller: bloc.passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: '#',
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            if (state is RegistrationBloc) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: shadowBoxColor,
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(space4x),
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () {
                  context.read<RegistrationBloc>().add(RegisterUser());
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
