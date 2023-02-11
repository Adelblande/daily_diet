import 'package:flutter/material.dart';

import '../themes/images.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImages.logo,
          ),
          Image.asset(
            AppImages.man,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
