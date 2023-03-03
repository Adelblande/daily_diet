import 'package:daily_diet/components/input.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../themes/colors.dart';

class NewMealPage extends StatefulWidget {
  const NewMealPage({Key? key}) : super(key: key);

  @override
  State<NewMealPage> createState() => _NewMealPageState();
}

class _NewMealPageState extends State<NewMealPage> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    handleSend() {
      formkey.currentState?.validate();
    }

    return Scaffold(
      backgroundColor: AppColors.gray5,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nova refeição'),
        backgroundColor: AppColors.gray5,
        elevation: 0,
        foregroundColor: AppColors.gray1,
        toolbarHeight: 80,
      ),
      body: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Input(
                      label: "Name",
                      validator: (text) => text == null || text.isEmpty
                          ? "Preencha o campo Nome"
                          : null,
                    ),
                    Input(
                      label: "Descrição",
                      maxline: 5,
                      validator: (text) => text == null || text.isEmpty
                          ? "Preencha o campo Descrição"
                          : null,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Button(
                label: "Cadastrar refeição",
                onPressed: handleSend,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
