import 'package:flutter/material.dart';

import '../themes/colors.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onPressed;

  final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.gray1,
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        color: AppColors.gray1,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  Button(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: buttonStyle,
      ),
    );
  }
}
