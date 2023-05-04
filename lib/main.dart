import 'package:flutter/material.dart';
import 'generate_otp.dart';
import 'envio_sms.dart';
import 'validar_otp.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await verificaPermisos(); 
  runApp(MaterialApp(
    // Define tus rutas aquí
    routes: {
      '/': (context) => const MainApp(),
      '/validar': (context) => const Validar(),
    },
  ));
}

String message = '';
TextEditingController textController = TextEditingController();

Future<void> verificaPermisos() async {
  // Solicita los permisos necesarios
  Map<Permission, PermissionStatus> statuses = await [
    Permission.sms,
    Permission.phone,
  ].request();

  // Verifica si se concedieron los permisos necesarios
  if (statuses[Permission.sms] != PermissionStatus.granted ||
      statuses[Permission.phone] != PermissionStatus.granted) {
    throw Exception('Los permisos necesarios no fueron concedidos');
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Enviar SMS'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 32),
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(66, 255, 255, 255),
                  labelText: 'Numero',
                  hintText: 'Digita tu numero de telefono',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value.toString().isEmpty) {}
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 16),
            MaterialButton(
              onPressed: () async {
                message = 'su codigo de verificacion es: ${generateOTP()}';
                sendSMS(message, textController.text);
                Navigator.pushNamed(context, '/validar');
              },
              color: const Color.fromARGB(255, 101, 64, 163),
              child: const Text(
                'Enviar codigo',
                style: TextStyle(
                  color: Color.fromARGB(179, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
