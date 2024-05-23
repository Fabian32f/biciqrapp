import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class PrintQRScreen extends StatefulWidget {
  @override
  _PrintQRScreenState createState() => _PrintQRScreenState();
}

class _PrintQRScreenState extends State<PrintQRScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String _qrData = '';
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generar QR'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: RepaintBoundary(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'Matrícula',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _qrData = _nameController.text +
                        ', ' +
                        _idController.text +
                        ', ' +
                        _descriptionController.text;
                  });
                },
                child: Text('Generar QR'),
              ),
              SizedBox(height: 32.0),
              _qrData.isNotEmpty
                  ? Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: _qrData,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _saveQrCode();
                      },
                      child: Text('Guardar QR'),
                    ),
                  ],
                ),
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveQrCode() async {
    // Verificar si ya se ha concedido el permiso de almacenamiento
    if (await Permission.storage.isGranted) {
      // Permiso ya concedido, continuar con el proceso de guardar el código QR
      try {
        RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.rawRgba);

        if (byteData != null) {
          Uint8List pngBytes = byteData.buffer.asUint8List();
          final result =
          await ImageGallerySaver.saveImage(Uint8List.fromList(pngBytes));
          print(result);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Código QR guardado en la galería.'),
          ));
        }
      } catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al guardar el código QR.'),
        ));
      }
    } else {
      // El permiso no ha sido concedido, solicitar permiso al usuario
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permiso concedido, volver a intentar guardar el código QR
        _saveQrCode();
      } else {
        // Permiso denegado, mostrar un mensaje informativo al usuario
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Permiso de almacenamiento denegado.'),
        ));
      }
    }
  }
}

  void main() {
  runApp(MaterialApp(
    home: PrintQRScreen(),
  ));
    }
