import 'dart:convert';

import 'package:ejercicios_flutter_rad/models/ejercicio_2_1_model.dart';
import 'package:ejercicios_flutter_rad/views/ejercicio_2_1_resultado_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Country>> getRegions(String region) async {
  String mode = region == 'all' ? 'all' : 'region/$region';

  var url = Uri(
    scheme: 'https',
    host: 'restcountries.com',
    path: '/v2/$mode',
  );

  final response = await http.get(url);
  List<Country> countrys = [];

  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);
    final List<dynamic> jsonList = jsonDecode(body);
    for (var countryData in jsonList) {
      countrys.add(
        Country(
          name: countryData['name'],
          topLevelDomain: List<String>.from(countryData['topLevelDomain']),
          alpha2Code: countryData['alpha2Code'],
          alpha3Code: countryData['alpha3Code'],
          callingCodes: List<String>.from(countryData['callingCodes']),
          capital: countryData['capital'] as String? ?? 'No CAPITAL',
          altSpellings: List<String>.from(
              countryData['altSpellings'] as List<dynamic>? ?? []),
          subregion: countryData['subregion'],
          region: countryData['region'],
          population: countryData['population'],
          latlng:
              List<double>.from(countryData['latlng'] as List<dynamic>? ?? []),
          demonym: countryData['demonym'],
          area: countryData['area'] as double? ?? 0.0,
          timezones: List<String>.from(countryData['timezones']),
          nativeName: countryData['nativeName'],
          numericCode: countryData['numericCode'],
          flags: Map<String, String>.from(countryData['flags']),
          currencies: List<Map<String, dynamic>>.from(
              countryData['currencies'] as List<dynamic>? ?? []),
          languages: List<Map<String, dynamic>>.from(countryData['languages']),
          translations: Map<String, String>.from(countryData['translations']),
          flag: countryData['flag'],
          cioc: countryData['cioc'] as String? ?? 'No CIOC',
          independent: countryData['independent'],
        ),
      );
    }
  } else {
    print('Error: ${response.statusCode} message: ${response.reasonPhrase}');
  }
  return countrys;
}

List<Widget> listCountry(List<Country> data, BuildContext context) {
  List<Widget> countrys = [];

  for (var country in data) {
    countrys.add(
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultadoEjercicio21(country),
            ),
          );
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(country.flags['png']!, width: 32, height: 32),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "${country.name} (${country.alpha2Code})",
                  softWrap: true,
                ),
              ),
              Text('+${country.callingCodes[0]}'),
            ],
          ),
        ),
      ),
    );
  }

  return countrys;
}

class Ejercicio21 extends StatefulWidget {
  const Ejercicio21({super.key});

  @override
  State<Ejercicio21> createState() => _Ejercicio21State();
}

class _Ejercicio21State extends State<Ejercicio21> {
  Future<List<Country>> countryList = Future<List<Country>>.value([]);

  @override
  Widget build(BuildContext context) {
    List regions = ["all", "africa", "americas", "asia", "europe", "oceania"];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Soy el ejercicio 2-1",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonFormField(
              hint: const Text("Selecciona una región"),
              items: regions.map(
                (region) {
                  return DropdownMenuItem(
                    value: region,
                    child: Text(region),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  countryList = getRegions(value.toString());
                });
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: countryList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: listCountry(
                            snapshot.data as List<Country>, context),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print("Error snapshot: ${snapshot.error}");
                    return const Text("Explota");
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // ountryList = getRegions('all');
  }
}
