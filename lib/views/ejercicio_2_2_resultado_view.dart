import 'package:ejercicios_flutter_rad/models/ejercicio_2_2_model.dart';
import 'package:flutter/material.dart';

class ImagesList extends StatelessWidget {
  final List<Signature> signatures;

  const ImagesList(this.signatures, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imágenes'),
      ),
      body: ListView.builder(
        itemCount: signatures.length,
        itemBuilder: (context, index) {
          final signature = signatures[index];
          return ListTile(
            title: Text(signature.name),
            subtitle: Text(signature.description),
            leading: signature.signature != null
                ? Image.memory(signature.signature!)
                : const Icon(Icons.image),
            onTap: () {
              // Handle item tap
            },
          );
        },
      ),
    );
  }
}
