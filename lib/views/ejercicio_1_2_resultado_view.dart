import 'package:ejercicios_flutter_rad/models/ejercicio_1_2_model.dart';
import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final Persona _persona;

  const ResultadoPage(this._persona, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Resultado",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nombres: ${_persona.nombres}'),
            const SizedBox(height: 15),
            Text('Apellidos: ${_persona.apellidos}'),
            const SizedBox(height: 15),
            Text('Edad: ${_persona.edad}'),
            const SizedBox(height: 15),
            Text('Correo: ${_persona.correo}'),
          ],
        ),
      ),
    );
  }
}
