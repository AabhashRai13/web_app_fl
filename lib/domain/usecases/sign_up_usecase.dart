import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_web/app/usecases/usecase.dart';
import 'package:find_scan_return_web/domain/entities/authentication.dart';
import 'package:find_scan_return_web/domain/repositories/authentication_repository.dart';
import '../../app/error/failures.dart';

class SignUpUsecase implements UseCase<Authentication, Params> {
  final AuthenticationRepository repository;

  SignUpUsecase(this.repository);

  @override
  Future<Either<Failure, Authentication>> call(Params params) async {
    return await repository.signUp(
      email: params.email,
      password: params.password,
      userName: params.name,
    );
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  final String name;

  const Params({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, name];
}