
import 'package:catalogmovie/movie/provider/movie_get_detail.dart';
import 'package:catalogmovie/movie/provider/movie_get_discover.dart';
import 'package:catalogmovie/movie/provider/movie_get_now_playing.dart';
import 'package:catalogmovie/movie/provider/movie_get_top_rated.dart';
import 'package:catalogmovie/movie/provider/movie_get_videos.dart';
import 'package:catalogmovie/movie/provider/movie_search.dart';
import 'package:catalogmovie/movie/repository/movie_repository.dart';
import 'package:catalogmovie/movie/repository/movie_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app_constant.dart';

final sl = GetIt.instance;

void setup() {
  //Register Provider
  sl.registerFactory<MovieGetDiscoverProvider>(
    () => MovieGetDiscoverProvider(sl()),
    );

  sl.registerFactory<MovieGetTopRatedProvider>(
    () => MovieGetTopRatedProvider(sl()),
    );

  sl.registerFactory<MovieGetNowPlayingProvider>(
    () => MovieGetNowPlayingProvider(sl()),
    );

  sl.registerFactory<MovieGetDetailProvider>(
    () => MovieGetDetailProvider(sl()),
    );

  sl.registerFactory<MovieGetVideosProvider>(
    () => MovieGetVideosProvider(sl()),
    ); 

  sl.registerFactory<MovieSearchProvider>(
    () => MovieSearchProvider(sl()),
    );   

  //Register Repository
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(sl()),
    );

// Register Http Client (DIO)
sl.registerLazySingleton<Dio>(
  () => Dio(
    BaseOptions(
      baseUrl: AppConstant.baseUrl,
      queryParameters: {'api_key': AppConstant.apiKey},
    ),
  ),
);
}