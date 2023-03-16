import 'package:daily_diet/themes/colors.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final int? maxline;
  final String? Function(String? text)? validator;
  final String? Function(String? value)? onSaved;
  final DateTime? Function()? onTap;

  const Input({
    Key? key,
    required this.label,
    this.validator,
    this.maxline,
    this.onTap,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: AppColors.gray2,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            maxLines: maxline ?? 1,
            validator: validator,
            onSaved: onSaved,
            onTap: onTap,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
