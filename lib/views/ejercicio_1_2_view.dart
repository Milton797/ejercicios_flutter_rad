import 'package:ejercicios_flutter_rad/models/ejercicio_1_2_model.dart';
import 'package:ejercicios_flutter_rad/views/ejercicio_1_2_resultado_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Ejercicio12 extends StatelessWidget {
  final nombre = TextEditingController();
  final apellidos = TextEditingController();
  final edad = TextEditingController();
  final correo = TextEditingController();

  Ejercicio12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Soy el ejercicio 1-2",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Wrap(
            runSpacing: 15,
            children: <Widget>[
              TextFormField(
                controller: nombre,
                decoration: InputDecoration(
                  labelText: "Nombre (*)",
                  hintText: 'Ingrese el nombre',
                  suffix: IconButton(
                    onPressed: () {
                      nombre.clear();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
              TextFormField(
                controller: apellidos,
                decoration: InputDecoration(
                  labelText: "Apellidos (*)",
                  hintText: 'Ingrese los apellidos',
                  suffix: IconButton(
                    onPressed: () {
                      apellidos.clear();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
              TextFormField(
                controller: edad,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Edad (*)",
                  hintText: 'Ingrese la edad',
                  suffix: IconButton(
                    onPressed: () {
                      edad.clear();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              TextFormField(
                controller: correo,
                decoration: InputDecoration(
                  labelText: "Correo (*)",
                  hintText: 'Ingrese el correo',
                  suffix: IconButton(
                    onPressed: () {
                      correo.clear();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  if (nombre.text.isEmpty ||
                      apellidos.text.isEmpty ||
                      edad.text.isEmpty ||
                      correo.text.isEmpty) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('AVISO'),
                          content: const Text("No se permiten campos vacíos."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }

                  final Persona persona = Persona(nombre.text, apellidos.text,
                      int.parse(edad.text), correo.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultadoPage(persona),
                    ),
                  );
                },
                child: const Text('Enviar información'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
