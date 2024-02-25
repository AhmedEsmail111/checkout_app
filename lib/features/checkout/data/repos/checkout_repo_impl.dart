import 'dart:developer';

import 'package:checkout_app/core/utils/paypal_service.dart';
import 'package:checkout_app/features/checkout/data/models/amount_model.dart';
import 'package:checkout_app/features/checkout/data/models/items_list_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../models/payment_intent_input_model.dart';
import '/core/errors/failures.dart';
import '/core/utils/stripe_service.dart';
import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService;
  final PaypalService paypalService;
  CheckoutRepoImpl({
    required this.stripeService,
    required this.paypalService,
  });

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );

      return right(null);
    } catch (error) {
      return left(
        ServerFailure(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Widget makePaypalPayment(BuildContext context,
      {required AmountModel amount, required ItemsListModel items}) {
    Widget paymentWidget = const Placeholder();
    try {
      paymentWidget = paypalService.makePaypalPayment(context,
          amount: amount, items: items);
    } catch (error) {
      log(error.toString());
    }

    return paymentWidget;
  }
}
