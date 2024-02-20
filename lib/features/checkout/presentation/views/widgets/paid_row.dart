import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaidSignRow extends StatelessWidget {
  const PaidSignRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/images/product_mark.svg'),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff34A853), width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            'PAID',
            style: AppStyles.style24.copyWith(color: const Color(0xff34A853)),
          ),
        )
      ],
    );
  }
}
