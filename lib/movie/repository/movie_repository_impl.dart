 import 'package:catalogmovie/movie/models/movie_detail.dart';
import 'package:catalogmovie/movie/models/movie_model.dart';
import 'package:catalogmovie/movie/models/movie_video.dart';
import 'package:catalogmovie/movie/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio _dio;

  MovieRepositoryImpl(this._dio);

  

  
  @override
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1}) async {
  try {
    final result = 
    await _dio.get('/discover/movie', 
    queryParameters: {'page' : page},
    );

    if (result.statusCode == 200 && result.data != null){
     final model = MovieResponseModel.fromJson(result.data);
     return Right(model);
    }

    return const Left('Error get discover movies');
  } on DioError catch (e) {

    if (e.response != null) {
    return Left(e.response.toString());
    }
    return const Left('Another error on get discover movies');
    
    }
  }
  
  @override
  Future<Either<String, MovieResponseModel>> getTopRated({int page = 1}) async {
    try {
      final result = await _dio.get('/movie/top_rated', 
      queryParameters: {'page': page},
      );

     if (result.statusCode == 200 && result.data != null ) {
     final model =  MovieResponseModel.fromJson(result.data);
     return Right(model);
    }
    
     return const Left('Error get top rated movies');
    } on DioError catch (e) {
      if (e.response != null){
        return Left(e.response.toString());
      }
return const Left('Another error on get top rated movies');

    }
  }
  
  @override
  Future<Either<String, MovieResponseModel>> getNowPlaying({int page = 1}) async{
    try {
     final result = await _dio.get('/movie/now_playing',
      queryParameters: {'page': page},
      );

       if (result.statusCode == 200 && result.data != null ) {
     final model =  MovieResponseModel.fromJson(result.data);
     return Right(model);
    }
    
     return const Left('Error get now playing movies');
    } on DioError catch (e) {
      if (e.response != null){
        return Left(e.response.toString());
      }
return const Left('Another error on get now playing movies');

    }
  }

  @override
  Future<Either<String, MovieDetailModel>> getDetail({required int id}) async {
    try {
     final result = await _dio.get('/movie/$id',
      );

       if (result.statusCode == 200 && result.data != null ) {
     final model =  MovieDetailModel.fromJson(result.data);
     return Right(model);
    }
    
     return const Left('Error get movies detail');
    } on DioError catch (e) {
      if (e.response != null){
        return Left(e.response.toString());
      }
return const Left('Another error on get movies detail');

    }
  }

  @override
  Future<Either<String, MovieVideosModel>> getVideos({required int id}) async{
    try {
     final result = await _dio.get('/movie/$id/videos',
      );

       if (result.statusCode == 200 && result.data != null ) {
     final model =  MovieVideosModel.fromJson(result.data);
     return Right(model);
    }
    
     return const Left('Error get movies videos');
    } on DioError catch (e) {
      if (e.response != null){
        return Left(e.response.toString());
      }
return const Left('Another error on get movies videos');

    }
  }
  
  @override
  Future<Either<String, MovieResponseModel>> search(
    {required String query,
    }) async{
     try {
     final result = await _dio.get('/search/movie',
     queryParameters: {"query" : query},
      );

       if (result.statusCode == 200 && result.data != null ) {
     final model =  MovieResponseModel.fromJson(result.data);
     return Right(model);
    }
    
     return const Left('Error search movies ');
    } on DioError catch (e) {
      if (e.response != null){
        return Left(e.response.toString());
      }
return const Left('Another error on search movies');

    }
  }
  }
 