import 'package:flutter/material.dart';

import '../components/button.dart';
import '../themes/colors.dart';

class DetailsMealPage extends StatefulWidget {
  const DetailsMealPage({Key? key}) : super(key: key);

  @override
  State<DetailsMealPage> createState() => _DetailsMealPageState();
}

class _DetailsMealPageState extends State<DetailsMealPage> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    String name = data['meal']['name'];

    return Scaffold(
      backgroundColor: data['colorCard'],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Refeição'),
        backgroundColor: data['colorCard'],
        elevation: 0,
        foregroundColor: data['colorIcon'],
        toolbarHeight: 80,
      ),
      body: Column(
        children: [
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     height: 30,
          //     color: data['colorCard'],
          //   ),
          // ),
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    icon: Icons.edit,
                    label: "Editar refeição",
                    onPressed: () => Navigator.pushNamed(context, '/edit'),
                  ),
                  Button(
                    icon: Icons.delete_outline,
                    label: "Excluir refeição",
                    onPressed: () => Navigator.pushNamed(context, '/new'),
                    outlined: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
