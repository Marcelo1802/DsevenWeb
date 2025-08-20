import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/di/dependency_injection.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configurar injeção de dependência
  await DependencyInjection.setup();
  
  runApp(
    MultiProvider(
      providers: DependencyInjection.providers,
      child: const MyApp(),
    ),
  );
}
