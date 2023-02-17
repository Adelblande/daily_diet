import 'package:flutter/material.dart';

import '../components/card_statistics.dart';
import '../themes/colors.dart';

class DataStatistics {
  Color colorCard;
  Color colorIcon;

  DataStatistics(this.colorCard, this.colorIcon);
}

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final titleStyle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.gray1,
  );

  final descriptionStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.gray2,
  );

  final subTitleStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.gray2,
  );

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: data['colorCard'],
      appBar: AppBar(
        backgroundColor: data['colorCard'],
        elevation: 0,
        foregroundColor: data['colorIcon'],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: data['colorCard'],
              child: Center(
                  child: Column(
                children: [
                  Text(
                    '90,86%',
                    style: titleStyle,
                  ),
                  Text(
                    'das refeições dentro da dieta',
                    style: descriptionStyle,
                  )
                ],
              )),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Estatísticas gerais',
                        style: subTitleStyle,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: CardStatistics(
                        colorCard: AppColors.gray6,
                        title: "22",
                        description:
                            "melhor sequência de pratos dentro da dieta",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: CardStatistics(
                        colorCard: AppColors.gray6,
                        title: "109",
                        description: "refeições registradas",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 44) / 2,
                            child: const CardStatistics(
                              colorCard: AppColors.greenLight,
                              title: "99",
                              description: "refeições dentro da dieta",
                            ),
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 44) / 2,
                            child: const CardStatistics(
                              colorCard: AppColors.redLight,
                              title: "10",
                              description: "refeições fora da dieta",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
