import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/provider/urls.dart';

@singleton
class NetworkProvider {
  late Dio dio;

  NetworkProvider() {
    initClient();
  }

  void initClient() {
    const timeout = Duration(milliseconds: 25000);
    dio = Dio()
      ..options = BaseOptions(
          baseUrl: Urls.baseUrl,
          receiveTimeout: timeout,
          connectTimeout: timeout);
  }
}
