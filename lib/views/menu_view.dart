import 'package:ejercicios_flutter_rad/views/ejercicio_1_1_view.dart';
import 'package:ejercicios_flutter_rad/views/ejercicio_1_2_view.dart';
import 'package:ejercicios_flutter_rad/views/ejercicio_2_1_view.dart';
import 'package:ejercicios_flutter_rad/views/ejercicio_2_2_view.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "⚡ Ejercicios RAD ⚡",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ejercicio11(),
                    ),
                  );
                },
                child: const Text('Ejercicio 1.1'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ejercicio12(),
                    ),
                  );
                },
                child: const Text('Ejercicio 1.2'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Ejercicio21(),
                    ),
                  );
                },
                child: const Text('Ejercicio 2.1'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Ejercicio22(),
                    ),
                  );
                },
                child: const Text('Ejercicio 2.2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
