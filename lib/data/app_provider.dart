import 'package:simple_sales_calculator/data/repository/user_local_repository.dart';
import 'package:simple_sales_calculator/my_material.dart';

class AppProvider {
  AppProvider({
    required this.userLocalRepository,
  });

  final UserLocalRepository userLocalRepository;
}
