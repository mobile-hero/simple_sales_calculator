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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: space6x),
                      child: Text(
                        'Sales Calculator',
                        style: context.styleHeadline1.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: space2x),
                      child: TextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: context.styleBody1.copyWith(
                            color: grease.withOpacity(0.3),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: space2x),
                      child: TextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: context.styleBody1.copyWith(
                            color: grease.withOpacity(0.3),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        obscuringCharacter: '#',
                      ),
                    ),
                    const SizedBox(height: space4x),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: space8x),
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have account? ',
                          style: context.styleBody2,
                          children: [
                            WidgetSpan(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text(
                                  'Register here',
                                  style: context.styleBody2.bold,
                                ),
                              ),
                            )
                          ],
                        ),
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
