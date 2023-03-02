import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    const titleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.gray1,
    );

    const subtitleStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.gray1,
    );

    const descriptionStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.gray2,
    );

    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    String id = data['meal']['id'];
    String name = data['meal']['name'];
    String description = data['meal']['description'];
    String createdDate = data['meal']['createdDate'];
    String createdTime = data['meal']['createdTime'];
    bool isOnTheDiet = data['meal']['isOnTheDiet'];

    handleCancel() {
      Navigator.pop(context);
    }

    handleConfirm(String id) {
      Navigator.pop(context);
      print('vai excluir essa porra mesmo $id');
    }

    confirmDelete() {
      return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          insetPadding: const EdgeInsets.all(20),
          contentPadding: const EdgeInsets.all(30),
          buttonPadding: const EdgeInsets.all(24),
          content: const Text(
            'Deseja realmente excluir o registro da refeição?',
            textAlign: TextAlign.center,
            style: subtitleStyle,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: Button(
                    label: "Cancelar",
                    onPressed: handleCancel,
                    outlined: true,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Button(
                    label: "Sim, excluir",
                    onPressed: () => handleConfirm(id),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      name,
                      style: titleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      description,
                      style: descriptionStyle,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      'Data e hora',
                      style: subtitleStyle,
                    ),
                  ),
                  Text.rich(
                      TextSpan(style: descriptionStyle, children: <TextSpan>[
                    TextSpan(
                      text: DateFormat('dd/MM/yy').format(
                        DateTime.parse(createdDate),
                      ),
                    ),
                    const TextSpan(text: ' às '),
                    TextSpan(text: createdTime),
                  ])),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.gray6,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: 160,
                      height: 32,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Icon(
                              Icons.circle,
                              color: isOnTheDiet
                                  ? AppColors.greenMid
                                  : AppColors.redMid,
                              size: 12,
                            ),
                          ),
                          Text(
                            isOnTheDiet ? 'dentro da dieta' : 'fora da dieta',
                            style: descriptionStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                    onPressed: confirmDelete,
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
