// Get All UserProfiles Use Case
// Business logic for retrieving all userProfile entities

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_profile_entity.dart';
import '../repositories/user_profile_repository.dart';

class GetAllUserProfiles implements UseCase<List<UserProfileEntity>, NoParams> {
  final UserProfileRepository repository;
  
  GetAllUserProfiles(this.repository);
  
  @override
  Future<Either<Failure, List<UserProfileEntity>>> call(NoParams params) {
    return repository.getAllUserProfiles();
  }
}
