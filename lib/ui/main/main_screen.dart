import '../../my_material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Calculator'),
      ),
      body: Center(
        child: Text(
          'Selamat datang!!',
          style: context.styleBody2.bold,
        ),
      ),
    );
  }
}
