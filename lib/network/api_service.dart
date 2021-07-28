import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jaji_admin/models/quiz1/quiz_quiz1_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:jaji_admin/constant/constants.dart' as NETWORK_CONSTANT;
part 'api_service.g.dart';

@RestApi(baseUrl: NETWORK_CONSTANT.basURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    return ApiService(dio);
  }

  // //get search example grammar
  // @GET("/search")
  // Future<List<Example>> getExample(@Query("key_search") String keySearch);

  //post login user
  @FormUrlEncoded()
  @POST("/add/quiz")
  Future<String> addQuiz(
      @Field("quiz") String quiz, @Field("type") String type);

  // /// thêm câu hỏi
  // @FormUrlEncoded()
  // @POST("/users/signup")
  // Future<UserToken> signUp(
  //     @Field("firstName") String firstName,
  //     @Field("lastName") String lastName,
  //     @Field("email") String email,
  //     @Field("password") String password);

  // //get login user
  // @GET("/users/secret")
  // Future<Resources> secret(@Header("Authorization") String jwt);

  // //auth with Facebook
  // @FormUrlEncoded()
  // @POST("/users/auth/facebook")
  // Future<Response<Map<String, dynamic>>> authFacebook(
  //     @Field("access_token") String accessToken);

  // //get question by quanity
  // @FormUrlEncoded()
  // @GET("/question/getbyquantity")
  // Future<Response<Map<String, dynamic>>> getQuestionByQuantity(
  //     @Field("level") String level,
  //     @Field("type") String type,
  //     @Field("subType") String subType,
  //     @Field("quantity") String quantity);
}
