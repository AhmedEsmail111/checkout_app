import 'dart:developer';

import 'package:checkout_app/core/widgets/custom_app_bar.dart';
import 'package:checkout_app/core/widgets/custom_button.dart';
import 'package:checkout_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_credit_card_widget.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/payment_methods_row.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payment Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            const SliverToBoxAdapter(
              child: PaymentMethodsRow(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomCreditCardWidget(
                autoValidateMode: autoValidateMode,
                formKey: formKey,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        log('payment');
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const ThankYouView(),
                          ),
                        );
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: 'Pay',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
