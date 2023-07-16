import 'dart:typed_data';

class Signature {
  final int id;
  final String name;
  final String description;
  final Uint8List? signature;
  final String createdAt;

  Signature({
    required this.id,
    required this.name,
    required this.description,
    this.signature,
    required this.createdAt,
  });
}
