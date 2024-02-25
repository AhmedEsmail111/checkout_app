import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '/core/widgets/custom_button.dart';
import '/features/checkout/presentation/views/widgets/order_info_item.dart';
import '/features/checkout/presentation/views/widgets/total_price.dart';
import 'widgets/payment_methods_bottom_sheet.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Cart'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Image.asset('assets/images/products.png'),
            ),
            const SizedBox(
              height: 25,
            ),
            const OrderInfoItem(
              title: 'Order Subtotal',
              value: r'$42.97',
            ),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(
              title: 'Discount',
              value: r'$0',
            ),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(
              title: 'Shipping',
              value: r'$8',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Divider(
                height: 34,
                thickness: 2,
                color: Color(0xffC7C7C7),
              ),
            ),
            const TotalPrice(
              title: 'Total',
              value: r'$50.97',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  context: context,
                  builder: (ctx) => const PaymentMethodsBottomSheet(),
                );
              },
              text: 'Complete Payment',
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
