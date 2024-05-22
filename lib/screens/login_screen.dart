import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart'; // Para la validación de entrada

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Código de la función de inicio de sesión
  void _iniciarSesion(String username, String password) async {
    // Simula la validación de credenciales (reemplaza con tu lógica real)
    if (username == 'Fabian1' && password == '2222') {
      // Credenciales válidas, navega a la pantalla principal
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Credenciales no válidas, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nombre de usuario o contraseña incorrectos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a BiciQrApp'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: SizedBox(
                  width: 200.0, // Ajusta el ancho según tu preferencia
                  height: 200.0, // Ajusta la altura según tu preferencia
                  child: Image.asset('assets/logo.jpg'),
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey, // Asocia la clave del formulario
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0), // 20 cm (200 dp) padding on each side
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0), // Ejemplo de radio de 10 píxeles
                        border: Border.all(
                          color: Colors.black, // Ejemplo de color azul
                          width: 2.0,
                        ),
                        color: Colors.blueAccent[400], // Ejemplo de color
                      ),
                      child: Column(
                        children: <Widget>[
                          _buildTextField(
                            controller: _usernameController,
                            label: 'Nombre de usuario',
                            fillColor: Colors.black26,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingresa un nombre de usuario';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          _buildTextField(
                            controller: _passwordController,
                            label: 'Contraseña',
                            fillColor: Colors.white10,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingresa una contraseña';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // El formulario es válido, inicia sesión
                                _iniciarSesion(_usernameController.text, _passwordController.text);
                              }
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
                                  color: Colors.black87, // Color del texto blanco
                                  fontSize: 16.0, // Tamaño de fuente
                                  fontWeight: FontWeight.bold, // Peso del texto
                                ),
                              ),
                              elevation: MaterialStateProperty.all<double>(10.0), // Elevación de la sombra
                              shadowColor: MaterialStateProperty.all<Color>(Colors.black38), // Color de la sombra
                            ),
                            child: Text('Iniciar Sesión'),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir campos de texto
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required Color fillColor,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: fillColor,
        contentPadding: EdgeInsets.all(10.0), // Espacio interno
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
