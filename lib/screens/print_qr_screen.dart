import 'package:flutter/material.dart';

class PrintQRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Imprimir QR',
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
          'Contenido de la impresión de QR aquí...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
