import 'package:ejercicios_flutter_rad/models/ejercicio_1_1_model.dart';
import 'package:ejercicios_flutter_rad/views/ejercicio_1_1_resultado_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Ejercicio11 extends StatelessWidget {
  final Calculadora _calculadora = Calculadora();

  final n1Controller = TextEditingController();
  final n2Controller = TextEditingController();

  Ejercicio11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Soy el ejercicio 1-1",
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
                controller: n1Controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Numero 1 (*)",
                  hintText: 'Ingrese el primer número',
                  suffix: IconButton(
                    onPressed: () {
                      n1Controller.clear();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[0-9.,]'),
                  ),
                ],
              ),
              TextFormField(
                controller: n2Controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Numero 2 (*)",
                  hintText: 'Ingrese el segundo número',
                  suffix: IconButton(
                    onPressed: () {
                      n2Controller.clear();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[0-9.,]'),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  if (n1Controller.text.isEmpty || n2Controller.text.isEmpty) {
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

                  final double n1 = double.parse(n1Controller.text);
                  final double n2 = double.parse(n2Controller.text);

                  final double resultado = _calculadora.suma(n1, n2);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultadoPage(resultado),
                    ),
                  );
                },
                child: const Text('Suma'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  if (n1Controller.text.isEmpty || n2Controller.text.isEmpty) {
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

                  final double n1 = double.parse(n1Controller.text);
                  final double n2 = double.parse(n2Controller.text);

                  final double resultado = _calculadora.resta(n1, n2);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultadoPage(resultado),
                    ),
                  );
                },
                child: const Text('Resta'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  if (n1Controller.text.isEmpty || n2Controller.text.isEmpty) {
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

                  final double n1 = double.parse(n1Controller.text);
                  final double n2 = double.parse(n2Controller.text);

                  final double resultado = _calculadora.division(n1, n2);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultadoPage(resultado),
                    ),
                  );
                },
                child: const Text('División'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  if (n1Controller.text.isEmpty || n2Controller.text.isEmpty) {
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

                  final double n1 = double.parse(n1Controller.text);
                  final double n2 = double.parse(n2Controller.text);

                  final double resultado = _calculadora.multiplicacion(n1, n2);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultadoPage(resultado),
                    ),
                  );
                },
                child: const Text('Multiplicación'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
