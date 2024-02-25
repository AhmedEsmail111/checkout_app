import 'package:dio/dio.dart';

abstract class ApiService {
  static Dio? dio;

  static init() {
    dio = Dio();
  }

  static Future<Response> post({
    required body,
    String? token,
    required String url,
    String? contentType,
    String? stripeVersion,
  }) async {
    return dio!.post(
      url,
      data: body,
      options: Options(
        contentType: contentType ?? 'application/json',
        headers: {
          'Authorization': token,
          if (stripeVersion != null) 'Stripe-Version': stripeVersion
        },
      ),
    );
  }
}
