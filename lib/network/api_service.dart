import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:jaji_admin/constant/constants.dart' as NETWORK_CONSTANT;
import 'entity/pto.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: NETWORK_CONSTANT.basURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    // dio.options.connectTimeout = 5000; //5s
    // dio.options.receiveTimeout = 5000;
    // dio.options.headers = {
    //   HttpHeaders.userAgentHeader: 'dio',
    //   'common-header': 'xx'
    // };
    return ApiService(dio);
  }

  // //get search example grammar
  // @GET("/search")
  // Future<List<Example>> getExample(@Query("key_search") String keySearch);

  //post login user
  @FormUrlEncoded()
  @POST("/add/quiz/api")
  // @Headers({
  //   "Access-Control-Allow-Origin": "*",
  //   'content-Type': 'text/plain; charset=UTF-8',
  //   "Access-Control-Allow-Credentials": true,
  //   "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
  //   "Access-Control-Allow-Methods": "POST, OPTIONS"
  // })
  Future<Pto> addQuiz(@Field("quiz") String quiz, @Field("type") String type);

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
