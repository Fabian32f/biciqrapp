import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BiciQrApp'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Añade padding horizontal
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/logo.jpg',
                  width: 200.0, // Ajusta el ancho según tu preferencia
                  height: 200.0, // Ajusta la altura según tu preferencia
                ),
              ),
              SizedBox(height: 20),
              Text(
                '¡Asegura tu bicicleta con un simple escaneo! Genera tu código QR personalizado y mantén tu bici siempre identificada.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0, // Tamaño de fuente
                  color: Colors.black87, // Color del texto
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Color de fondo azul
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Ajusta el radio del borde según sea necesario
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)), // Ajuste de relleno
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      fontSize: 16.0, // Tamaño de fuente
                      fontWeight: FontWeight.bold, // Peso del texto
                    ),
                  ),
                ),
                child: Text('Iniciar!!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}