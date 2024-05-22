import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  final _nombreController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _semestreController = TextEditingController();
  final _grupoController = TextEditingController();
  final _contactoController = TextEditingController();
  PickedFile? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _profileImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrate'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Registrate',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.green,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Complete los siguientes campos',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blue,
                      child: _profileImage != null
                          ? ClipOval(
                        child: Image.file(
                          File(_profileImage!.path),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      )
                          : Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                _buildTextField(
                  controller: _nombreController,
                  label: 'Nombre',
                ),


                SizedBox(height: 20),
                _buildTextField(
                  controller: _matriculaController,
                  label: 'Matrícula',
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: _semestreController,
                  label: 'Semestre',
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: _grupoController,
                  label: 'Grupo',
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: _contactoController,
                  label: 'Número de contacto',
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Aquí se puede manejar la lógica de registro
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    child: Text('Registrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para construir campos de texto
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.blue.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa $label';
        }
        return null;
      },
    );
  }
}
