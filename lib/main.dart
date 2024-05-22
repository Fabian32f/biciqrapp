import 'package:flutter/material.dart';

//Importaciones de firebase
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

import 'package:biciqrapp/screens/login_screen.dart';
import 'package:biciqrapp/screens/register_screen.dart';
import 'package:biciqrapp/screens/Home_screen.dart';

  //para la conexion a firebase
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(
   // options: DefaultFirebaseOptions.currentPlatform,
  //);

void main() {
  runApp(MaterialApp(
    title: 'WissenQR',
    initialRoute: '/home',
    //las rutas
    routes: {
      '/login': (context) => LoginScreen(),
      '/home': (context) => HomeScreen(), // Asegúrate de tener definida esta pantalla
      '/register': (context) => RegisterScreen(), // La pantalla de registro
    },
  ));
}