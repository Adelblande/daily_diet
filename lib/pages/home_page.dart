import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';

import '../components/button.dart';
import '../components/card_statistic.dart';
import '../components/header.dart';
import '../themes/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List snackList = [
    {
      'id': '10',
      'createdDate': '2023-02-08',
      'createdTime': '08:15',
      'name': 'Suco de laranja'
    },
    {
      'id': '1',
      'createdDate': '2023-02-08',
      'createdTime': '01:05',
      'name': 'X-tudo'
    },
    {
      'id': '21',
      'createdDate': '2023-02-07',
      'createdTime': '14:05',
      'name': 'Bife à role'
    },
    {
      'id': '22',
      'createdDate': '2023-02-07',
      'createdTime': '14:35',
      'name': 'Sorvete de chocolate'
    },
    {
      'id': '23',
      'createdDate': '2023-02-07',
      'createdTime': '20:05',
      'name': 'Vitamina de banana'
    },
    {
      'id': '3',
      'createdDate': '2023-02-05',
      'createdTime': '15:30',
      'name': 'Frango com salada'
    },
    {
      'id': '4',
      'createdDate': '2023-02-05',
      'createdTime': '16:30',
      'name': 'Suco de laranja'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Header(),
            ),
            const Expanded(
              flex: 3,
              child: CardStatistic(
                colorCard: AppColors.greenLight,
                colorIcon: AppColors.greenDark,
                title: "90,86%",
                description: "das refeições dentro da dieta",
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                alignment: Alignment.topLeft,
                child: const Text("Refeições"),
              ),
            ),
            Expanded(
              flex: 1,
              child: Button(
                icon: Icons.add,
                label: "Nova refeição",
                onPressed: () => Navigator.pushNamed(context, '/new'),
              ),
            ),
            Expanded(
              flex: 10,
              child: GroupedListView<dynamic, String>(
                elements: snackList,
                groupBy: (element) => element['createdDate'],
                groupSeparatorBuilder: (String groupByValue) => Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                  child: Text(
                    DateFormat('dd.MM.yy').format(DateTime.parse(groupByValue)),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray1,
                      fontSize: 18,
                    ),
                  ),
                ),
                itemBuilder: (context, dynamic element) => Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/details'),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColors.gray4,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: element['createdTime'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.gray1)),
                                  const TextSpan(
                                      text: '  |  ',
                                      style: TextStyle(color: AppColors.gray4)),
                                  TextSpan(
                                      text: element['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.gray2)),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
                itemComparator: (item1, item2) =>
                    item1['name'].compareTo(item2['name']), // optional
                order: GroupedListOrder.DESC, // optional
              ),
            ),
          ],
        ),
      ),
    );
  }
}
