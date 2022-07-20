import '../../bloc/login/login_bloc.dart';
import '../../my_material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
          userLocalRepository: context.appProvider.userLocalRepository),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushNamed(context, '/home');
            }
            if (state is LoginError) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email atau password salah')));
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(space4x),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: space2x),
                      child: TextField(
                        controller: TextEditingController(),
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: space2x),
                      child: TextField(
                        controller: TextEditingController(),
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        obscuringCharacter: '#',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login'),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have account?',
                        children: [
                          WidgetSpan(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text('Register here'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: const SizedBox(
          height: kToolbarHeight,
          child: Center(
            child: Text('Copyrights 2022'),
          ),
        ),
      ),
    );
  }
}
