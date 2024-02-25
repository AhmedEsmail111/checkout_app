import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../models/amount_model.dart';
import '../models/items_list_model.dart';
import '../models/payment_intent_input_model.dart';
import '/core/errors/failures.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });

  Widget makePaypalPayment(BuildContext context,
      {required AmountModel amount, required ItemsListModel items});
}
