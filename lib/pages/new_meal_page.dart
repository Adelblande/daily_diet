import 'package:daily_diet/components/input.dart';
import 'package:daily_diet/components/inputDate.dart';
import 'package:daily_diet/components/inputTime.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../themes/colors.dart';

class NewMealPage extends StatefulWidget {
  const NewMealPage({Key? key}) : super(key: key);

  @override
  State<NewMealPage> createState() => _NewMealPageState();
}

class _NewMealPageState extends State<NewMealPage> {
  final form = GlobalKey<FormState>();
  final Map<String, String> formData = {};

  handleSend() {
    final isValid = form.currentState?.validate();
    if (isValid!) {
      form.currentState?.save();
      debugPrint('Form-->$formData');
    }
  }

  @override
  Widget build(BuildContext context) {
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
        key: form,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Input(
                        label: "Nome",
                        validator: (text) => text == null || text.isEmpty
                            ? "Preencha o Nome."
                            : null,
                        onSaved: (value) => formData['name'] = value!,
                      ),
                      Input(
                        label: "Descrição",
                        maxline: 5,
                        validator: (text) => text == null || text.isEmpty
                            ? "Preencha o Descrição."
                            : null,
                        onSaved: (value) => formData['description'] = value!,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 50) / 2,
                            child: InputDate(
                              label: "Data",
                              validator: (text) => text == null || text.isEmpty
                                  ? "Preencha a data."
                                  : null,
                              onSaved: (value) => formData['date'] = value!,
                            ),
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 50) / 2,
                            child: InputTime(
                              label: "Hora",
                              validator: (text) => text == null || text.isEmpty
                                  ? "Preencha a hora."
                                  : null,
                              onSaved: (value) => formData['time'] = value!,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
