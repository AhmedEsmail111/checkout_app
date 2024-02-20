import 'package:flutter/material.dart';

import 'payment_method_item.dart';

class PaymentMethodsRow extends StatefulWidget {
  const PaymentMethodsRow({super.key});

  @override
  State<PaymentMethodsRow> createState() => _PaymentMethodsRowState();
}

class _PaymentMethodsRowState extends State<PaymentMethodsRow> {
  var activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PaymentMethodItem(
          image: 'assets/images/card.svg',
          isActive: activeIndex == 0,
          onTap: () {
            setState(() {
              activeIndex = 0;
            });
          },
        ),
        const SizedBox(
          width: 24,
        ),
        PaymentMethodItem(
          image: 'assets/images/paypal.svg',
          isActive: activeIndex == 1,
          onTap: () {
            setState(() {
              activeIndex = 1;
            });
          },
        ),
      ],
    );
  }
}
