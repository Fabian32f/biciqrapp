import 'package:flutter/material.dart';

class ScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Escáner',
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
      body: Center(
        child: Text(
          'Contenido del escáner aquí...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
