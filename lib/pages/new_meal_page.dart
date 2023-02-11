import 'package:flutter/material.dart';

class NewMealPage extends StatefulWidget {
  const NewMealPage({Key? key}) : super(key: key);

  @override
  State<NewMealPage> createState() => _NewMealPageState();
}

class _NewMealPageState extends State<NewMealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova refeição'),
      ),
      body: Container(),
    );
  }
}
