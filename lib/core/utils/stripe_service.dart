import 'package:checkout_app/features/checkout/data/models/create_customer_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/customer_object_model.dart';
import 'package:checkout_app/features/checkout/data/models/ephemeral_key_model.dart';
import 'package:checkout_app/features/checkout/data/models/init_payment_sheet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/checkout/data/models/payment_intent_input_model.dart';
import '../../features/checkout/data/models/payment_intent_object.dart';
import '/core/utils/api_keys.dart';
import 'api_service.dart';

class StripeService {
  Future<PaymentIntentObject> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await ApiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: 'Bearer ${ApiKeys.secretKey}',
      contentType: 'application/x-www-form-urlencoded',
    );

    var paymentIntentObject = PaymentIntentObject.fromJson(response.data);

    return paymentIntentObject;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetModel initPaymentSheetModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetModel.clientSecret,
        merchantDisplayName: initPaymentSheetModel.merchantName,
        customerId: initPaymentSheetModel.customerId,
        customerEphemeralKeySecret: initPaymentSheetModel.ephemeralKey,
        style: ThemeMode.light,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // creates a customer only one time when he creates an account in the app
  Future<CustomerObjectModel> createCustomer(
      CreateCustomerInputModel createCustomerInputModel) async {
    var response = await ApiService.post(
        body: createCustomerInputModel.toJson(),
        url: 'https://api.stripe.com/v1/customers',
        token: 'Bearer ${ApiKeys.secretKey}',
        contentType: 'application/x-www-form-urlencoded');

    var customerObject = CustomerObjectModel.fromJson(response.data);

    return customerObject;
  }

  // create an ephemeral key for a customer(each payment process)
  Future<EphemeralKeyObjectModel> createEphemeralKey(
      {required customerId}) async {
    var response = await ApiService.post(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: 'Bearer ${ApiKeys.secretKey}',
      contentType: 'application/x-www-form-urlencoded',
      stripeVersion: '2023-10-16',
    );

    var ephemeralKeyObject = EphemeralKeyObjectModel.fromJson(response.data);

    return ephemeralKeyObject;
  }

// the main entry execution point for a payment process
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentObject =
        await createPaymentIntent(paymentIntentInputModel);

    var ephemeralKeyObject = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);

    await initPaymentSheet(
      initPaymentSheetModel: InitPaymentSheetModel(
        clientSecret: paymentIntentObject.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKey: ephemeralKeyObject.secret,
        merchantName: 'MarketOnline',
      ),
    );

    await displayPaymentSheet();
  }
}
