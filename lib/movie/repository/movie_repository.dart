import 'package:catalogmovie/movie/models/movie_detail.dart';
import 'package:catalogmovie/movie/models/movie_model.dart';
import 'package:catalogmovie/movie/models/movie_video.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1});
  Future<Either<String, MovieResponseModel>> getTopRated({int page = 1});
  Future<Either<String, MovieResponseModel>> getNowPlaying({int page = 1});
  Future<Either<String, MovieResponseModel>> search({required String query});
  Future<Either<String, MovieDetailModel>> getDetail({ required int id});
  Future<Either<String, MovieVideosModel>> getVideos({ required int id});

}