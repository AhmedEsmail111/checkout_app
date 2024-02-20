import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CardInfoContainer extends StatelessWidget {
  const CardInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/masterCard.jpg',
            width: 60,
          ),
          const SizedBox(
            width: 20,
          ),
          const Column(
            children: [
              Text(
                'Credit Card',
                textAlign: TextAlign.center,
                style: AppStyles.style18,
              ),
              Text(
                'Mastercard **78',
                textAlign: TextAlign.center,
                style: AppStyles.style18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
