import 'package:checkout_app/features/checkout/presentation/views/widgets/card_info.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/total_price.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'paid_row.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xffEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 + 16,
          left: 22,
          right: 22,
        ),
        child: Column(
          children: [
            const Text(
              'Thank You',
              textAlign: TextAlign.center,
              style: AppStyles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular20,
            ),
            const SizedBox(
              height: 32,
            ),
            const OrderInfoItem(
              title: 'Date',
              value: '01/24/2023',
              isThankYou: true,
            ),
            const SizedBox(
              height: 12,
            ),
            const OrderInfoItem(
              title: 'Time',
              value: '10:15 AM',
              isThankYou: true,
            ),
            const SizedBox(
              height: 12,
            ),
            const OrderInfoItem(
              title: 'To',
              value: 'Sam Louis',
              isThankYou: true,
            ),
            const Divider(
              height: 40,
              color: Color(0xffC7C7C7),
              thickness: 2,
            ),
            const TotalPrice(
              title: 'Total',
              value: r'$50.97',
            ),
            const SizedBox(
              height: 32,
            ),
            const CardInfoContainer(),
            const Spacer(),
            const PaidSignRow(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.09,
            ),
          ],
        ),
      ),
    );
  }
}
