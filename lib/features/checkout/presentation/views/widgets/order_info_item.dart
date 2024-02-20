import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isThankYou;
  const OrderInfoItem(
      {super.key,
      required this.title,
      required this.value,
      this.isThankYou = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.style18,
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: isThankYou ? AppStyles.styleSemiBold18 : AppStyles.style18,
        ),
      ],
    );
  }
}
