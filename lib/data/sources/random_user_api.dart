import 'package:dio/dio.dart';
import 'package:flontacts/data/models/random_user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'random_user_api.g.dart';

@RestApi(baseUrl: "https://randomuser.me/api/")
abstract class RandomUserApi {
  factory RandomUserApi(Dio dio, {String baseUrl}) = _RandomUserApi;

  @GET("?results=10")
  Future<RandomUserResponse> getContacts();
}
