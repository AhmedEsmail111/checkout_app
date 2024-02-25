import 'package:checkout_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool isLoading;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.isLoading = false,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color(0xff34A853),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: AppStyles.style22,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
