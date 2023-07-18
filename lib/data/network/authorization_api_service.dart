import 'package:dio/dio.dart';
import 'package:find_scan_return_web/data/models/authentication_model.dart';
import 'package:find_scan_return_web/domain/entities/register.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/entities/sign_in.dart';

part 'authorization_api_service.g.dart';

@RestApi()
abstract class AuthorizationApiService {
  factory AuthorizationApiService(Dio dio, {String baseUrl}) =
      _AuthorizationApiService;

  @POST('auth/register')
  Future<HttpResponse<AuthenticationModel>> registerUser(
      {required Register register});

  @POST('auth/login')
  Future<HttpResponse<AuthenticationModel>> signInUser({
    required SignIn register,
  });
}
