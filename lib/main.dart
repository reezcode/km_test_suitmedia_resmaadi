import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/service_locator.dart';

// KAMPUS MERDEKA TEST SUITMEDIA - MOBILE DEVELOPER
// RESMA ADI NUGROHO - UNIVERSITAS DIPONEGORO
// 20:07 WIB 08 AGUSTUS 2024

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(BaseApp());
}
