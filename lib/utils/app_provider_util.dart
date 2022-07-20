import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/app_provider.dart';

extension AppProviderUtil on BuildContext {
  AppProvider get appProvider => read<AppProvider>();
}
