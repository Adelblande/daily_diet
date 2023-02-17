import 'package:flutter/material.dart';

import '../themes/colors.dart';

class CardStatistics extends StatelessWidget {
  final Color colorCard;
  final Color? colorIcon;
  final String title;
  final String description;
  final Function()? onTap;
  final bool hasIcon;

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

  const CardStatistics({
    Key? key,
    required this.colorCard,
    required this.title,
    required this.description,
    this.colorIcon,
    this.onTap,
    this.hasIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: colorCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.north_east,
                      color: hasIcon ? colorIcon : Colors.transparent,
                      size: 24,
                    ),
                  ],
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: titleStyle,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: descriptionStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
