import 'package:bookly/Features/home/Data/DataSources/home_Local_dataSource.dart';
import 'package:bookly/Features/home/Data/DataSources/home_remote_datasource.dart';
import 'package:bookly/Features/home/Data/repos/HomeRepo_imp.dart';
import 'package:bookly/core/utils/Api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void Getservicelocator() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));
  getit.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      HomeLocalDataSourceImpl(),
      HomeRemoteDataSourceImpl(getit.get<ApiService>()),
    ),
  );
}
