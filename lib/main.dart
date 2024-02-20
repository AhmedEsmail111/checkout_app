import 'package:flutter/material.dart';

import 'features/checkout/presentation/views/my_cart_view.dart';

void main() {
  runApp(const CHeckoutApp());
}

class CHeckoutApp extends StatelessWidget {
  const CHeckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartView(),
    );
  }
}
