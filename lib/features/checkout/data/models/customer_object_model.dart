class CustomerObjectModel {
  final String id;
  final String object;
  final dynamic address;
  final int balance;
  final int created;
  final dynamic currency;
  final dynamic defaultSource;
  final bool delinquent;
  final dynamic description;
  final dynamic discount;
  final String email;
  final String invoicePrefix;

  final bool livemode;

  final String name;
  final int nextInvoiceSequence;
  final dynamic phone;
  final List<dynamic> preferredLocales;
  final dynamic shipping;
  final String taxExempt;
  final dynamic testClock;

  CustomerObjectModel({
    required this.id,
    required this.object,
    required this.address,
    required this.balance,
    required this.created,
    required this.currency,
    required this.defaultSource,
    required this.delinquent,
    required this.description,
    required this.discount,
    required this.email,
    required this.invoicePrefix,
    required this.livemode,
    required this.name,
    required this.nextInvoiceSequence,
    required this.phone,
    required this.preferredLocales,
    required this.shipping,
    required this.taxExempt,
    required this.testClock,
  });

  factory CustomerObjectModel.fromJson(Map<String, dynamic> json) =>
      CustomerObjectModel(
        id: json["id"],
        object: json["object"],
        address: json["address"],
        balance: json["balance"],
        created: json["created"],
        currency: json["currency"],
        defaultSource: json["default_source"],
        delinquent: json["delinquent"],
        description: json["description"],
        discount: json["discount"],
        email: json["email"],
        invoicePrefix: json["invoice_prefix"],
        livemode: json["livemode"],
        name: json["name"],
        nextInvoiceSequence: json["next_invoice_sequence"],
        phone: json["phone"],
        preferredLocales:
            List<dynamic>.from(json["preferred_locales"].map((x) => x)),
        shipping: json["shipping"],
        taxExempt: json["tax_exempt"],
        testClock: json["test_clock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "address": address,
        "balance": balance,
        "created": created,
        "currency": currency,
        "default_source": defaultSource,
        "delinquent": delinquent,
        "description": description,
        "discount": discount,
        "email": email,
        "invoice_prefix": invoicePrefix,
        "livemode": livemode,
        "name": name,
        "next_invoice_sequence": nextInvoiceSequence,
        "phone": phone,
        "preferred_locales": List<dynamic>.from(preferredLocales.map((x) => x)),
        "shipping": shipping,
        "tax_exempt": taxExempt,
        "test_clock": testClock,
      };
}
