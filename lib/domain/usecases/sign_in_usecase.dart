import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_web/app/error/failures.dart';
import 'package:find_scan_return_web/app/usecases/usecase.dart';
import 'package:find_scan_return_web/domain/entities/authentication.dart';
import '../repositories/authentication_repository.dart';

class SignInUsecase implements UseCase<Authentication, Params> {
  final AuthenticationRepository repository;

  SignInUsecase(this.repository);

  @override
  Future<Either<Failure, Authentication>> call(Params params) async {
    return await repository.signIn(
        userName: params.email, password: params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}