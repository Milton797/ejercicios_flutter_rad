import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final double resultado;

  const ResultadoPage(this.resultado, {super.key});

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
        child: Text('El resultado es: $resultado'),
      ),
    );
  }
}
