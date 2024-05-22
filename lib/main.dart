import 'package:flutter/material.dart';

//Importaciones de firebase
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

import 'package:biciqrapp/screens/login_screen.dart';
import 'package:biciqrapp/screens/register_screen.dart';
import 'package:biciqrapp/screens/Home_screen.dart';
import 'package:biciqrapp/screens/dashboard_screen.dart';
import 'package:biciqrapp/screens/profile_screen.dart';
import 'package:biciqrapp/screens/scanner_screen.dart';
import 'package:biciqrapp/screens/print_qr_screen.dart';


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
      '/home': (context) => HomeScreen(),
      '/register': (context) => RegisterScreen(), // La pantalla de registro
      '/dashboard': (context) => DashboardScreen(),
      '/profile': (context) => ProfileScreen(),
      '/scanner': (context) => ScannerScreen(),
      '/print_qr': (context) => PrintQRScreen(),

    },
  ));
}