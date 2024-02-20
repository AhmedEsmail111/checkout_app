import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCardWidget extends StatefulWidget {
  const CustomCreditCardWidget(
      {super.key, required this.formKey, required this.autoValidateMode});
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  @override
  State<StatefulWidget> createState() {
    return _CustomCreditCardWidgetState();
  }
}

class _CustomCreditCardWidgetState extends State<CustomCreditCardWidget> {
  String cardNumber = '', expiryDate = '', cardHolder = '', cvvCode = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolder,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (value) {},
        ),
        CreditCardForm(
          autovalidateMode: widget.autoValidateMode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolder,
          cvvCode: cvvCode,
          onCreditCardModelChange: (cardModel) {
            cardNumber = cardModel.cardNumber;
            expiryDate = cardModel.expiryDate;
            cardHolder = cardModel.cardHolderName;
            cvvCode = cardModel.cvvCode;
            showBackView = cardModel.isCvvFocused;
            setState(() {});
          },
          formKey: widget.formKey,
        )
      ],
    );
  }
}
