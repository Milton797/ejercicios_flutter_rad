import 'dart:io';
import 'dart:ui';

import 'package:ejercicios_flutter_rad/controllers/ejercicio_2_2_controller.dart';
import 'package:ejercicios_flutter_rad/views/ejercicio_2_2_resultado_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';

class DrawingPoint {
  Path path;
  Paint paint;

  DrawingPoint(this.path, this.paint);
}

class Ejercicio22 extends StatefulWidget {
  const Ejercicio22({super.key});

  @override
  State<Ejercicio22> createState() => _Ejercicio22State();
}

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPoint;

  _DrawingPainter(this.drawingPoint);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.white, BlendMode.src);

    // Pintar
    for (final point in drawingPoint) {
      canvas.drawPath(point.path, point.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _Ejercicio22State extends State<Ejercicio22> {
  final List<DrawingPoint> drawingPoints = [];
  Color selectedColor = Colors.black;
  double strokeWidthValue = 5.0;
  final double canvasSize = 120;
  final List<Color> _selectableColors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: canvasSize,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      _selectableColors.length,
                      (index) => selectColor(_selectableColors[index]),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Slider(
                  value: strokeWidthValue,
                  min: 1.0,
                  max: 20.0,
                  onChanged: (value) {
                    setState(() {
                      strokeWidthValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Soy el ejercicio 2-2",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onPanDown: (details) {
          _startStroke(details.localPosition);
        },
        onPanUpdate: (details) {
          _moveStroke(details.localPosition);
        },
        child: CustomPaint(
          painter: _DrawingPainter(drawingPoints),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - canvasSize,
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.clear),
            label: "Limpiar lienzo",
            onTap: () {
              drawingPoints.clear();
              _showToast("Lienzo limpiado");
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.list_alt),
            label: "Listar firmas",
            onTap: () async {
              navigateToImagesList(context);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.save),
            label: "Guardar",
            onTap: () => _displayBottomSheet(context),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Algo al iniciar el formulario
  }

  void navigateToImagesList(BuildContext context) async {
    final items = await SQLHelper.getItems();

    final signatures = items.map((item) {
      return item.values.first;
    }).toList();

    Future<void>.delayed(Duration.zero, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagesList(signatures),
        ),
      );
    });
  }

  Widget selectColor(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        height: isSelected ? 50 : 40,
        width: isSelected ? 50 : 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(
                  color: Colors.yellow,
                  width: 3,
                )
              : null,
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nombre",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Descripción',
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (_nameController.text.isNotEmpty ||
                      _descriptionController.text.isNotEmpty) {
                    _saveDrawing(canvasSize);
                  } else {
                    _showToast("No se permiten valores vacíos");
                  }

                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text("Guardar"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _moveStroke(Offset data) {
    setState(() {
      drawingPoints.last.path.lineTo(data.dx, data.dy);
    });
  }

  Future<void> _saveDrawing(double canvasSize) async {
    try {
      final pictureRecorder = PictureRecorder();
      final canvas = Canvas(pictureRecorder);

      canvas.drawColor(Colors.white, BlendMode.src);

      for (var point in drawingPoints) {
        canvas.drawPath(point.path, point.paint);
      }

      final picture = pictureRecorder.endRecording();

      final image = await picture.toImage(
        MediaQuery.of(context).size.width.toInt(),
        MediaQuery.of(context).size.height.toInt() - canvasSize.toInt(),
      );

      final byteData = await image.toByteData(format: ImageByteFormat.png);
      final bytes = byteData!.buffer.asUint8List();

      SQLHelper.createData(
        _nameController.text,
        _descriptionController.text,
        bytes,
      );

      _nameController.clear();
      _descriptionController.clear();

      final directory = Directory('storage/emulated/0/Pictures/RAD');
      await directory.create(recursive: true);

      final now = DateTime.now();
      final formattedDateTime = DateFormat('yyyyMMdd_HHmmss').format(now);
      final file = File('${directory.path}/drawing_$formattedDateTime.png');

      await file.writeAsBytes(bytes);

      _showToast("Drawing saved successfully!");
    } catch (e) {
      _showToast("Failed to save drawing.");
    }
  }

  void _showToast(String message, {int duration = 1000}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: duration),
        content: Text(message),
      ),
    );
  }

  void _startStroke(Offset data) {
    drawingPoints.add(
      DrawingPoint(
        Path()..moveTo(data.dx, data.dy),
        Paint()
          ..color = selectedColor
          ..strokeWidth = strokeWidthValue
          ..style = PaintingStyle.stroke,
      ),
    );
  }
}
