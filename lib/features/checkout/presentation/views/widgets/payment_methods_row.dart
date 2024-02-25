import 'package:checkout_app/features/checkout/presentation/manager/payment/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_method_item.dart';

class PaymentMethodsRow extends StatelessWidget {
  const PaymentMethodsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<PaymentCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PaymentMethodItem(
              image: 'assets/images/card.svg',
              isActive: cubit.paymentMethodIndex == PaymentMethods.card,
              onTap: () {
                cubit.changePaymentMethodIndex(
                  paymentMethod: PaymentMethods.card,
                );
              },
            ),
            const SizedBox(
              width: 24,
            ),
            PaymentMethodItem(
              image: 'assets/images/paypal.svg',
              isActive: cubit.paymentMethodIndex == PaymentMethods.paypal,
              onTap: () {
                cubit.changePaymentMethodIndex(
                  paymentMethod: PaymentMethods.paypal,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
