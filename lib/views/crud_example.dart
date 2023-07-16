// import 'dart:typed_data';

// import 'package:ejercicios_flutter_rad/controllers/ejercicio_2_2_controller.dart';
// import 'package:ejercicios_flutter_rad/models/ejercicio_2_2_model.dart';
// import 'package:flutter/material.dart';

// class CrudEjercicio22 extends StatefulWidget {
//   const CrudEjercicio22({super.key});

//   @override
//   State<CrudEjercicio22> createState() => _CrudEjercicio22State();
// }

// class _CrudEjercicio22State extends State<CrudEjercicio22> {
//   bool _isLoading = true;
//   final _nameController = TextEditingController();
//   final _descriptionController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Soy el ejercicio 2-2 crud",
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: _isLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: Signature.signatureList.length,
//               itemBuilder: (context, index) => Card(
//                 margin: const EdgeInsets.all(15),
//                 child: ListTile(
//                   title: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Text(
//                       Signature.signatureList[index].name,
//                       style: const TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   // subtitle: Text(),
//                 ),
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => showBottomSheet(null),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   void showBottomSheet(int? id) async {
//     if (id != null) {
//       final existingData =
//           Signature.signatureList.firstWhere((element) => element.id == id);
//       _nameController.text = existingData.name;
//       _descriptionController.text = existingData.description;
//     }

//     showModalBottomSheet(
//       elevation: 5,
//       isScrollControlled: true,
//       context: context,
//       builder: (_) => Container(
//         padding: EdgeInsets.only(
//           top: 30,
//           left: 15,
//           right: 15,
//           bottom: MediaQuery.of(context).viewInsets.bottom + 50,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Nombre",
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _descriptionController,
//               maxLines: 4,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Descripción',
//               ),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   if (id == null) {
//                     await _addData();
//                   } else {
//                     await _updateData(id);
//                   }

//                   _nameController.clear();
//                   _descriptionController.clear();

//                   Navigator.of(context).pop();
//                   print("Agregado");
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(18),
//                   child: Text(
//                     id == null ? "Agregar" : "Modificar",
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _addData() async {
//     Uint8List signature = Uint8List(0);
//     ByteBuffer signatureBuffer = signature.buffer;

//     await SQLHelper.createData(
//       _nameController.text,
//       _descriptionController.text,
//       signatureBuffer,
//     );
//     _loadData();
//   }

//   Future<void> _deleteData(int id) async {
//     await SQLHelper.deleteData(id);
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text("Borrado")));
//   }

//   void _loadData() async {
//     final data = await SQLHelper.getItems();
//     setState(() {
//       for (var element in data) {
//         Signature(
//           id: element['id'],
//           name: element['name'],
//           description: element['description'],
//           signature: element['signature'],
//           createdAt: element['createdAt'],
//         );
//       }
//       _isLoading = false;
//     });
//   }

//   Future<void> _updateData(int id) async {
//     await SQLHelper.updateData(
//       id,
//       _nameController.text,
//       _descriptionController.text,
//     );
//   }
// }
