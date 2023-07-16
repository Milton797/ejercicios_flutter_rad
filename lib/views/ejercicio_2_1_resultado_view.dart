import 'package:ejercicios_flutter_rad/models/ejercicio_2_1_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maps_launcher/maps_launcher.dart';

class ResultadoEjercicio21 extends StatelessWidget {
  final Country _country;

  const ResultadoEjercicio21(this._country, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _country.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SvgPicture.network(
            _country.flag,
            semanticsLabel: 'A flag',
            placeholderBuilder: (context) => const CircularProgressIndicator(),
            width: 500,
            fit: BoxFit.cover,
          ),
          // Image.network(
          //   _country.flags['png']!,
          //   fit: BoxFit.cover,
          // ),
          Card(
            child: ListTile(
              title: const Text(
                'Región',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_country.region),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Sub región',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_country.subregion),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Capital',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_country.capital),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Area territorial',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${_country.area.toString()} km²"),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Población',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_country.population.toString()),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Moneda',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Codigo: ${_country.currencies[0]['code']}\nNombre: ${_country.currencies[0]['name']}\nSimbolo: ${_country.currencies[0]['symbol']}"),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Zona horaria',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_country.timezones[0]),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Lenguaje',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_country.languages[0]['nativeName']),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text(
                'Independiente',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_country.independent == true ? "Sí" : "No"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MapsLauncher.launchQuery(_country.name);
        },
        child: const Icon(Icons.gps_fixed),
      ),
    );
  }
}
