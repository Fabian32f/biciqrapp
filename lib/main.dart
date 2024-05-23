import 'package:biciqrapp/firebase_options.dart';
import 'package:flutter/material.dart';

// Importaciones de Firebase
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

import 'package:biciqrapp/screens/login_screen.dart';
import 'package:biciqrapp/screens/register_screen.dart';
import 'package:biciqrapp/screens/home_screen.dart';
import 'package:biciqrapp/screens/dashboard_screen.dart';
import 'package:biciqrapp/screens/profile_screen.dart';
import 'package:biciqrapp/screens/scanner_screen.dart';
import 'package:biciqrapp/screens/print_qr_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  ); // Inicializa Firebase

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WissenQR',
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/register': (context) => RegisterScreen(), // La pantalla de registro
        '/dashboard': (context) => DashboardScreen(),
        '/profile': (context) => ProfileScreen(),
        '/scanner': (context) => ScannerScreen(),
        '/print_qr': (context) => PrintQRScreen(),
      },
    );
  }
}
