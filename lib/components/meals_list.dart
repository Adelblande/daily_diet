import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class MealsList extends StatelessWidget {
  final List meals;

  const MealsList({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: GroupedListView<dynamic, String>(
        elements: meals,
        groupBy: (element) => element['createdDate'],
        groupSeparatorBuilder: (String groupByValue) => Text(groupByValue),
        itemBuilder: (context, dynamic element) => Text(element['name']),
        itemComparator: (item1, item2) =>
            item1['dateCreated'].compareTo(item2['dateCreated']), // optional
        useStickyGroupSeparators: true, // optional
        floatingHeader: true, // optional
        order: GroupedListOrder.ASC, // optional
      ),
    );
  }
}
