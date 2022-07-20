import '../../res/resources.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar"),
      ),
      body: Container(
        padding: const EdgeInsets.all(space4x),
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
                  hintText: 'Name',
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: space2x),
              child: TextField(
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  hintText: 'Phone',
                ),
                keyboardType: TextInputType.phone,
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
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

          },
        ),
      ),
    );
  }
}
