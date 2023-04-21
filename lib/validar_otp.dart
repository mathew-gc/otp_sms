import 'package:flutter/material.dart';
import 'menu.dart';
import 'main.dart';
TextEditingController textController = TextEditingController();
class Validar extends StatelessWidget {
  const Validar({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Verificacion'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(66, 255, 255, 255),
                  labelText: 'Codigo',
                  hintText: 'Digita el codigo de seguridad',
                  prefixIcon: Icon(Icons.password),
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
                if (textController.text == message) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerificationScreen()),
                  );
                }
              },
              color: const Color.fromARGB(255, 88, 209, 137),
              child: const Text(
                'Verificar codigo',
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
