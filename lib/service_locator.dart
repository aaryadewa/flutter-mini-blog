import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mini_blog/core/error/exception.dart';
import 'package:mini_blog/features/post/data/datasource/post_datasource_impl.dart';
import 'package:mini_blog/features/post/data/repository/post_repository_impl.dart';
import 'package:mini_blog/features/post/domain/usecase/post_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => PostUsecase(sl()));
  sl.registerLazySingleton(() => PostRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton(() => PostDatasourceImpl(dio: sl()));

  // Register Dio for working with the backend RESTful API.
  sl.registerLazySingleton(() {
    final BaseOptions options =
        BaseOptions(baseUrl: 'https://adw-json-server.herokuapp.com');

    Dio dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(onError: (DioError de) async {
      if (de.response?.statusCode == 404) {
        throw ResourceNotFoundException();
      }
    }));

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return host == 'localhost' ? true : false;
      };
    };

    return dio;
  });
}
