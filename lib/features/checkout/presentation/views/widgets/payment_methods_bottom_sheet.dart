import 'package:checkout_app/features/checkout/data/models/amount_model.dart';
import 'package:checkout_app/features/checkout/data/models/items_list_model.dart';
import 'package:checkout_app/features/checkout/presentation/manager/payment/payment_cubit.dart';
import 'package:checkout_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/api_keys.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/payment_intent_input_model.dart';
import 'payment_methods_row.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethodsRow(),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 1.5,
            child: BlocConsumer<PaymentCubit, PaymentStates>(
              listener: (context, state) {
                if (state is PaymentSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ThankYouView(),
                    ),
                  );
                }
                if (state is PaymentFailure) {
                  Navigator.of(context).pop();
                  var snackBar = SnackBar(
                    content: Text(state.errorMessage),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                final cubit = context.read<PaymentCubit>();
                return CustomButton(
                  isLoading: state is PaymentLoading ? true : false,
                  text: 'Continue',
                  onPressed: () {
                    if (cubit.paymentMethodIndex == PaymentMethods.card) {
                      cubit.makePayment(
                        paymentIntentInputModel: PaymentIntentInputModel(
                          amount: '100',
                          currency: 'USD',
                          customerId: ApiKeys.customerId,
                        ),
                      );
                    } else {
                      final amountModel = AmountModel(
                        total: '100',
                        currency: 'USD',
                        details: Details(
                          subtotal: '100',
                          shipping: '0',
                          shippingDiscount: 0,
                        ),
                      );

                      final orders = [
                        Order(
                          name: 'Apple',
                          quantity: 4,
                          price: '10',
                          currency: 'USD',
                        ),
                        Order(
                          name: 'Apple',
                          quantity: 5,
                          price: '12',
                          currency: 'USD',
                        ),
                      ];
                      final itemsListModel = ItemsListModel(orders: orders);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => cubit.makePaypalPayment(
                            context,
                            amount: amountModel,
                            items: itemsListModel,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
