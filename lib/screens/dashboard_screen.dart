import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Importa el archivo de la pantalla de perfil
import 'scanner_screen.dart'; // Importa el archivo de la pantalla de escáner
import 'print_qr_screen.dart'; // Importa el archivo de la pantalla de impresión de QR

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bienvenido a WissenQR',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: Colors.blue,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0, // Remover la sombra del AppBar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/profile'); // Navega a la página del perfil
        },
          child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/user_avatar.jpg'),
          ),
      ),
          SizedBox(height: 10),
          Text(
            'Nombre de Usuario',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/scanner'); // Navega a la página del escáner
                },
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.scanner,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Scanner',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/print_qr'); // Navega a la página de imprimir QR
                },
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.print,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Imprimir QR',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
