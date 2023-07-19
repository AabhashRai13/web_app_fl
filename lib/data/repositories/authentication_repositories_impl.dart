import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:find_scan_return_web/app/preferences/shared_preferences_manager.dart';
import 'package:find_scan_return_web/data/network/authorization_api_service.dart';
import 'package:find_scan_return_web/domain/entities/authentication.dart';
import 'package:find_scan_return_web/domain/entities/register.dart';
import 'package:find_scan_return_web/domain/entities/sign_in.dart';
import '../../app/error/exceptions.dart';
import '../../app/error/failures.dart';
import '../../app/network/network_info.dart';
import '../../domain/repositories/authentication_repository.dart';

class AuthenticaionRepositoryImpl implements AuthenticationRepository {
  final NetworkInfo networkInfo;
  final AuthorizationApiService authorizationApiService;
  final SharedPreferencesManager sharedPreferencesManager;
  AuthenticaionRepositoryImpl(this.networkInfo, this.authorizationApiService,
      this.sharedPreferencesManager);

  @override
  Future<Either<Failure, Authentication>> signIn(
      {String? userName, String? password}) async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      try {
        final httpResponse = await authorizationApiService.signInUser(
            register: SignIn(username: userName!, password: password!));

        if (httpResponse.response.statusCode == HttpStatus.ok) {
          sharedPreferencesManager.putBool(
              SharedPreferencesManager.keyIsLogin, true);
          return Right(httpResponse.data);
        } else {
          return Left(CredentialsFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> signUp(
      {String? email, String? password, String? userName}) async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      try {
        final httpResponse = await authorizationApiService.registerUser(
            register: Register(
                email: email!, password: password!, username: userName!));
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return Right(httpResponse.data);
        } else {
          return Left(CredentialsFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<void> signOut() async {
    sharedPreferencesManager.clearAll();
  }

  @override
  Future<bool> isSignedIn() async {
    return sharedPreferencesManager
        .getBool(SharedPreferencesManager.keyAccessToken);
  }
}