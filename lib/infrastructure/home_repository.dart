import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sportstasks/common/helper.dart';
import 'package:sportstasks/domain/home_data.dart';

import 'i_home_repository.dart';

class HomeServiceRepository extends IHomeRepository {
  final Dio _dio = Dio();

  // Define the base URL and API key

  final String _apiKey = 'c4cab034529b4dda89d028703603fd91';

  HomeServiceRepository();
  @override
  Future<Either<String, HomeData>> fetchHomeData() async {
    try {
      // Making the GET request with the required parameters
      final response = await _dio.get(
        Helpers.fetchTeamData,
      );

      if (response.statusCode == 200) {
        HomeData data;
        return right(HomeData.fromJson(response.data));
      } else {
        return left("error");
      }
    } on DioError catch (e) {
      // Handling Dio errors, such as network issues or invalid requests
      if (e.response != null) {
        print(
            'Dio error! Status: ${e.response?.statusCode}, Data: ${e.response?.data}');
        return left("error");
      } else {
        print('Error sending request: ${e.message}');
        return left("error");
      }
    }
  }

  Future<Either<String, HomeData>> fetchSecondData() async {
    try {
      // Making the GET request with the required parameters
      final response = await _dio.get(
        Helpers.fetchSecondTeamData,
      );

      if (response.statusCode == 200) {
        HomeData data;
        return right(HomeData.fromJson(response.data));
      } else {
        return left("error");
      }
    } on DioError catch (e) {
      // Handling Dio errors, such as network issues or invalid requests
      if (e.response != null) {
        print(
            'Dio error! Status: ${e.response?.statusCode}, Data: ${e.response?.data}');
        return left("error");
      } else {
        print('Error sending request: ${e.message}');
        return left("error");
      }
    }
  }
}
