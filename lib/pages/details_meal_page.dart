import 'package:flutter/material.dart';

class DetailsMealPage extends StatefulWidget {
  const DetailsMealPage({Key? key}) : super(key: key);

  @override
  State<DetailsMealPage> createState() => _DetailsMealPageState();
}

class _DetailsMealPageState extends State<DetailsMealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Container(),
    );
  }
}
