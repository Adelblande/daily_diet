import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../themes/colors.dart';

class InputDate extends StatefulWidget {
  final String label;
  final String? Function(String? value)? validator;
  final String? Function(String? value)? onSaved;
  final void Function()? onTap;

  const InputDate({
    Key? key,
    required this.label,
    this.validator,
    this.onSaved,
    this.onTap,
  }) : super(key: key);

  @override
  State<InputDate> createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  DateTime initialDate = DateTime.now();
  DateTime firstDate = DateTime(DateTime.now().year - 1);
  DateTime lastDate = DateTime(DateTime.now().year + 1);
  TextEditingController picked = TextEditingController();

  Future pickDate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      // locale: Locale('pt', 'BR'),
    );

    if (date != null) {
      picked.text = DateFormat('dd/MM/yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: AppColors.gray2,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            validator: widget.validator,
            controller: picked,
            onTap: () => pickDate(context),
            onSaved: widget.onSaved,
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
