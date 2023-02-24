import 'package:flutter/material.dart';

import '../themes/colors.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool? outlined;
  final Function()? onPressed;

  const Button({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
    this.outlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: outlined == true ? AppColors.white : AppColors.gray1,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.gray1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

    final colorText = outlined == true ? AppColors.gray1 : AppColors.white;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: colorText,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: colorText,
          ),
        ),
        style: buttonStyle,
      ),
    );
  }
}
