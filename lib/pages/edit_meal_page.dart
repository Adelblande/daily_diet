import 'package:flutter/material.dart';

class EditMealPage extends StatefulWidget {
  const EditMealPage({Key? key}) : super(key: key);

  @override
  State<EditMealPage> createState() => _EditMealPageState();
}

class _EditMealPageState extends State<EditMealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
      ),
      body: Container(),
    );
  }
}
