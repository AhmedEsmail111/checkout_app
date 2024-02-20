import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_dashed_lines.dart';
import 'package:flutter/material.dart';

import 'custom_check_icon.dart';
import 'thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 55, bottom: 20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const ThankYouCard(),
            Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * 0.25,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * 0.25,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: -50,
              child: CustomCheckIcon(),
            ),
            Positioned(
              left: 8 + 20,
              right: 8 + 20,
              bottom: MediaQuery.sizeOf(context).height * 0.25 + 20,
              child: const CustomDashedLines(),
            ),
          ],
        ),
      ),
    );
  }
}
