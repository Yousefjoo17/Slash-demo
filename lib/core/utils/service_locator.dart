import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:slash/core/utils/api_service.dart';
import 'package:slash/features/Home/data/repos/Home_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiService: getIt.get<ApiService>()));
}
