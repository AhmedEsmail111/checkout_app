import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/amount_model.dart';
import '../../../data/models/items_list_model.dart';
import '../../../data/models/payment_intent_input_model.dart';
import '/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    final data = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    data.fold(
      (l) => emit(
        PaymentFailure(errorMessage: l.errorMessage),
      ),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentStates> change) {
    log(change.toString());
    super.onChange(change);
  }

  Widget makePaypalPayment(BuildContext context,
      {required AmountModel amount, required ItemsListModel items}) {
    return checkoutRepo.makePaypalPayment(context,
        amount: amount, items: items);
  }

  // manage the selected payment method
  var paymentMethodIndex = PaymentMethods.card;

  void changePaymentMethodIndex({required PaymentMethods paymentMethod}) {
    paymentMethodIndex = paymentMethod;
    emit(TogglePaymentMethod());
  }
}

enum PaymentMethods {
  card,
  paypal,
}
