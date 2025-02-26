import 'package:dartz/dartz.dart';
import 'package:sportstasks/domain/home_data.dart';

abstract class IHomeRepository {
  // Future<Either<String,NewsModal>> fetchTopHeadlines({String country});
  Future<Either<String, HomeData>> fetchHomeData();
  Future<Either<String, HomeData>> fetchSecondData();
}
