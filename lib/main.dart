import 'package:checkout_app/core/utils/api_keys.dart';
import 'package:checkout_app/core/utils/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/utils/paypal_service.dart';
import 'core/utils/stripe_service.dart';
import 'features/checkout/data/repos/checkout_repo_impl.dart';
import 'features/checkout/presentation/manager/payment/payment_cubit.dart';
import 'features/checkout/presentation/views/my_cart_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = ApiKeys.publishableKey;
  ApiService.init();

  runApp(const CHeckoutApp());
}

class CHeckoutApp extends StatelessWidget {
  const CHeckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(
        CheckoutRepoImpl(
          paypalService: PaypalService(),
          stripeService: StripeService(),
        ),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CartView(),
      ),
    );
  }
}
