import 'package:flutter/material.dart';

//Importaciones de firebase
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

import 'package:biciqrapp/screens/login_screen.dart';

  //para la conexion a firebase
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(
   // options: DefaultFirebaseOptions.currentPlatform,
  //);

  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: 'Tu App',
  home: LoginScreen(), // Navega a la pantalla de inicio de sesión
  );
  }
  }