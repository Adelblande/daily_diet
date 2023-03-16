import 'package:flutter/material.dart';

import '../themes/colors.dart';

class InputTime extends StatefulWidget {
  final String label;
  final String? Function(String? value)? validator;
  final String Function(String? value)? onSaved;
  final void Function()? onTap;

  const InputTime({
    Key? key,
    required this.label,
    this.validator,
    this.onSaved,
    this.onTap,
  }) : super(key: key);

  @override
  State<InputTime> createState() => _InputTimeState();
}

class _InputTimeState extends State<InputTime> {
  TextEditingController picked = TextEditingController();

  Future pickTime(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: TimeOfDay.now().hour,
        minute: TimeOfDay.now().minute,
      ),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (time != null) {
      picked.text =
          "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
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
            onTap: () => pickTime(context),
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
