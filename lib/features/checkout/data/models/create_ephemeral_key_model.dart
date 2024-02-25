class CreateEphemeralKeyInputModel {
  final String customerId;
  final String stripeVersion;

  CreateEphemeralKeyInputModel(
      {required this.customerId, required this.stripeVersion});

  toJson() {
    return {'customer': customerId};
  }
}
